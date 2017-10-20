package com.hoolai.game.dbtransfer;

import java.io.IOException;
import java.util.Properties;

public class Conf {

	public String host = "192.168.1.14"; //默认的数据库参数
	public String port = "3306";
	public String user = "root";
	public String pass = "root";
	public String name = "db_templates_luzj_001";
	public String transferTablesFile;
	public String ignoredColumnsFile;

	public static Conf parseFrom(Properties pp, String version) throws IOException {
		Conf conf = new Conf();
		//从transfer.properties得到数据库参数
		conf.host = pp.getProperty(version + "_host");
		conf.port = pp.getProperty(version + "_port");
		conf.user = pp.getProperty(version + "_user");
		conf.pass = pp.getProperty(version + "_pass");
		conf.name = pp.getProperty(version + "_name");
		System.out.println(conf.name);
		//需要生成的表名
		conf.transferTablesFile = pp.getProperty("transfer.tables");
		//需要忽略的表名和字段
		conf.ignoredColumnsFile = pp.getProperty("ignored.columns");

		String resource = Transfer.getResource(conf.transferTablesFile);
		System.out.println(resource);
		// BufferedReader reader = new BufferedReader(new InputStreamReader(new
		// FileInputStream(resource)));
		// while(reader.ready()) {
		// String line = reader.readLine();
		// if(StringUtil.isEmpty(line))
		// continue;
		// System.out.println(line.trim());
		// }
		// reader.close();
		//读取配置文件
		Environment.parseFrom(conf);

		return conf;
	}

}
