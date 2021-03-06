package com.hoolai.game.dbtransfer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import git.PropertiesFile;

public class Transfer {
	//存储每一个表的内容
	private static List<Table> tables = new ArrayList<>();

	public static void transfer(Conf conf, String targetDir) throws SQLException, FileNotFoundException {
		//链接数据库，记录每一个表的字段，数据
		transfer0(conf);
		//检测、修正武将等那一块数据？
		revisenpcavatar();
		//检查campaignnode中的数据
		//check();
		savefile(targetDir);
	}

@SuppressWarnings("unused")
	private static void check() {
		Table cnode = findTable("t_s_campaignnode");
		int nodeIDIndex = cnode.findColumnIndex("NodeId");
		int bossIndex = cnode.findColumnIndex("Bosses");
		int formationIndex = cnode.findColumnIndex("Formation");

		Table lnode = findTable("t_s_livingtemplate");
		int livingIdIndex = lnode.findColumnIndex("TemplateId");
		List<Record> livingList = lnode.records;
		List<String> livingIdList = new ArrayList<>();
		for (Record living : livingList) {
			livingIdList.add(living.values.get(livingIdIndex));
		}

		Iterator<Record> it = cnode.records.iterator();
		// 检查bosses和formation的长度是否一致
		StringBuffer msg1 = new StringBuffer();
		StringBuffer msg2 = new StringBuffer();
		while (it.hasNext()) {
			Record r = it.next();
			String bosses = r.values.get(bossIndex);
			String formation = r.values.get(formationIndex);
			if (bosses != null && !"".equals(bosses) && formation != null && !"".equals(formation)) {
				if (bosses.split(",").length != formation.split(",").length) {
					msg1.append("NodeId = " + r.values.get(nodeIDIndex) + "的怪和站位不匹配，请检查。");
					msg1.append("\r\n");
				}
				;
				String[] bossesArr = bosses.split(",");
				// 检查怪是否存在
				for (String bossId : bossesArr) {
					if (!livingIdList.contains(bossId)) {
						msg2.append("NodeId = " + r.values.get(nodeIDIndex) + "的怪BossId=" + bossId + "不存在。");
						msg2.append("\r\n");
					}
				}
			}
		}
		// System.out.println(msg1.toString());
		// System.out.println(msg2.toString());
	}
	/***
	 * 
	 * 存储到文件
	 * */
	private static void savefile(String targetDir) throws FileNotFoundException {
		//存储的文件名
		File file = new File(targetDir, "hlsango.sql");
		PrintStream ps = new PrintStream(new FileOutputStream(file));
		//sqlite 开始
		ps.println("PRAGMA locking_mode = EXCLUSIVE;");
		ps.println("BEGIN EXCLUSIVE;");
		ps.println();

		for (Table table : tables) {
			ps.println(table);
		}

		ps.println();
		ps.print("COMMIT;");
		ps.flush();
		ps.close();
	}

	private static void transfer0(Conf conf) throws SQLException {
		tables.clear();
		//链接数据库
		Connection connect = DBConnection.connect(conf);
		//遍历 需要生成的sql文件 的表名
		for (String table : Environment.transferTables) {
			transferTable(connect, table);
		}
		connect.close();
	}

	private static void revisenpcavatar() throws SQLException {
		Table npcavatar = findTable("t_s_npcavatar");

		// clear generate records
		int idx = npcavatar.findColumnIndex("TemplateId");
		Iterator<Record> it = npcavatar.records.iterator();
		//该表templateId都是 4位数，清理不符合标准的
		while (it.hasNext()) {
			if (it.next().values.get(idx).length() != 4) {
				it.remove();
			}
		}

		revisenpcavatarfromanothertable(npcavatar, findTable("t_s_livingtemplate"));
		revisenpcavatarfromanothertable(npcavatar, findTable("t_s_soldiertemplate"));
	}

	private static void revisenpcavatarfromanothertable(Table npcavatar, Table another) {
		int idx1 = npcavatar.findColumnIndex("TemplateId");
		int idx2 = npcavatar.findColumnIndex("TemplateName");
		int idx3 = npcavatar.findColumnIndex("Quality");

		int idx00 = another.findColumnIndex("NpcTemplateId");
		int idx01 = another.findColumnIndex("TemplateId");
		int idx02 = another.findColumnIndex("TemplateName");
		int idx03 = another.findColumnIndex("Quality");

		Iterator<Record> it = another.records.iterator();
		while (it.hasNext()) {
			Record next = it.next();
			
			if(next == null) {
				System.out.println("next is null");
			}
			
		
			npcavatar.records.add(npcavatar.findRecordByValIdx(idx1, next.values.get(idx00)).copy()
					.replaceValByIdx(idx1, next.values.get(idx01)).replaceValByIdx(idx2, next.values.get(idx02))
					.replaceValByIdx(idx3, next.values.get(idx03)));
		}
	}
	/**
	 * 查看是否有该表table
	 **/
	private static Table findTable(String name) {
		for (Table table : tables) {
			if (table.name.equals(name)) {
				return table;
			}
		}
		System.out.println("this table is not exites:" + name);
		return null;
	}
	/**
	 * @param conn 数据库链接
	 * @param tableName 需要生成sql语句的表名 
	 **/
	private static void transferTable(Connection conn, String tableName) throws SQLException {
		//得到数据库结果，数据库名称（可以不填），模式，表名称，类型
		ResultSet t = conn.getMetaData().getTables(null, null, tableName, new String[] { "TABLE" });
		if (t.next()) {
			//降序排列
			PreparedStatement pstmt = conn.prepareStatement("DESC " + tableName);
			//执行降序命令
			ResultSet rs = pstmt.executeQuery();
			//存储table
			Table table = new Table(tableName);
			for (; rs.next();) {
				//列 添加 数据库 字段属性
				table.columns.add(new Column().parseFromRS(tableName, rs));
			}
			rs.close();
			pstmt.close();

			pstmt = conn.prepareStatement("SELECT * FROM " + tableName);
			rs = pstmt.executeQuery();
			//遍历查询结果
			for (; rs.next();) {
				//存储每一个单元格（数值）
				table.parseRecord(rs);
			}
			tables.add(table);
		} else {
			System.out.println(tableName + " not exists");
		}
	}

	/**
	 * 程序入口，用于生成sql文件到git库，便于git推到远端。
	 */
	public static void exce(String[] gitAddress, String version) throws SQLException, IOException {
		//得到git所在的的地址，如果没有参数,那么将sql文件默认生成才（"user.home"）文件夹下
		String file = gitAddress.length > 0 ? gitAddress[0] : System.getProperty("user.home");

		String transferProperties = "transfer.properties"; 
		//主要用于读取Java的配置文件
		Properties properties = new Properties();
		//加载"transfer.properties"配置文件，
		properties.load(new FileInputStream(getResource(transferProperties)));
		//开始工作，Conf 配置数据库参数	
		transfer(Conf.parseFrom(properties, version), file);
	}

	public static String getResource(String file) {
		if ("transfer.properties".equals(file)) {
			return PropertiesFile.getInstance().getProperty("svntransferAddress");
		}
		if ("transfer.tables".equals(file)) {
			return PropertiesFile.getInstance().getProperty("svnResAddress");
		}
		if ("ignored.columns".equals(file)) {
			return PropertiesFile.getInstance().getProperty("svningoredAddress");
		}
		return null;
		// if(new File(file).exists()) return file;
		// URL resource = Transfer.class.getClassLoader().getResource(file);
		// if(resource == null) {
		// resource = Transfer.class.getResource(file);
		// }
		// return resource.getFile();
	}

}
