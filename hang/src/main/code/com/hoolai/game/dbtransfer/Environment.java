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

    public static void parseFrom(Conf conf) throws IOException {
        parseFileAsLines(transferTables, conf.transferTablesFile);
        parseFileAsLines(ignoreColumns, conf.ignoredColumnsFile);
    } 

    private static void parseFileAsLines(List<String> container, String file) throws IOException {
    		container.clear();
    		if(container.isEmpty()) {
    			System.out.println("配置文件缓存已经清空："+container.isEmpty());
    		}
        String resource = Transfer.getResource(file);
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(resource)));
        while(reader.ready()) {
            String line = reader.readLine();
            if(StringUtil.isEmpty(line))
                continue;
            container.add(line.trim());
        }
        reader.close();
    }
     
}
