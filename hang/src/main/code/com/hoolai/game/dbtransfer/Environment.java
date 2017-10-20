package com.hoolai.game.dbtransfer;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.hoolai.util.text.StringUtil;

public class Environment {
    
    public static final List<String> transferTables = new ArrayList<>();
    
    public static final List<String> ignoreColumns = new ArrayList<>();
    
    public static boolean isIgnoreColumn(String table, String column) {
        String tmp = table + "." + column;
        for (String ignoreColumn : ignoreColumns) {
            if(ignoreColumn.equals(tmp)) {
                return true;
            }
        }
        return false;
    }
    
    /**
     *读取配置文件
     *
     **/
    public static void parseFrom(Conf conf) throws IOException {
        parseFileAsLines(transferTables, conf.transferTablesFile);
        parseFileAsLines(ignoreColumns, conf.ignoredColumnsFile);
    } 
    
    /**
     *将"transfer.tables" 和 "ignored.columns" 的数据 读取到ransferTables和ignoreColumns 列表
     *@param container 存放数据的列表
     *@param file 存放的元数据
     * 
     **/

    private static void parseFileAsLines(List<String> container, String file) throws IOException {
    		//清空配置缓存，避免重复加载transferTables和ignoreColumns
    		container.clear();
    		if(container.isEmpty()) {
    			System.out.println("配置文件缓存已经清空："+container.isEmpty());
    		}
        String resource = Transfer.getResource(file);
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(resource)));
        //读取文件数据，存放在list里
        while(reader.ready()) {
            String line = reader.readLine();
            if(StringUtil.isEmpty(line))
                continue;
            container.add(line.trim());
        }
        reader.close();
    }
     
}
