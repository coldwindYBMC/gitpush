package com.hoolai.game.dbtransfer;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import com.hoolai.util.text.StringUtil;

public class Conf {
    
    public String host = "192.168.1.14";
    public String port = "3306";
    public String user = "root";
    public String pass = "root";
    public String name = "db_templates_luzj_001";
    public String transferTablesFile;
    public String ignoredColumnsFile;
    
    public static Conf parseFrom(Properties pp) throws IOException {
        Conf conf = new Conf();
        conf.host = pp.getProperty("host");
        conf.port = pp.getProperty("port");
        conf.user = pp.getProperty("user");
        conf.pass = pp.getProperty("pass");
        conf.name = pp.getProperty("name");
        
        conf.transferTablesFile = pp.getProperty("transfer.tables");
        conf.ignoredColumnsFile = pp.getProperty("ignored.columns");
        
        String resource = Transfer.getResource(conf.transferTablesFile);
        System.out.println(resource);
     //   BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(resource)));
//        while(reader.ready()) {
//            String line = reader.readLine();
//            if(StringUtil.isEmpty(line))
//                continue;
//           System.out.println(line.trim());
//        }
//        reader.close();
        Environment.parseFrom(conf);
        
        return conf;
    }
    
}
