package com.hoolai.game.dbtransfer;

import java.util.ArrayList;
import java.util.List;

import com.hoolai.util.log.Log;

public class Record {
    
    public Table table;
    public List<String> values = new ArrayList<String>();

    public Record(Table table) {
        this.table = table;
    }

    public Record replaceValByIdx(int idx, String val) {
        this.values.set(idx, val);
        return this;
    }
    
    public Record copy() {
        Record record = new Record(this.table);
        for (String val : values) {
            record.values.add(val);
        }
        return record;
    }

    @Override
    public String toString() {try {

        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO ").append(table.name).append(" VALUES (");
        boolean comma = false;//是否第一次，用来判断是否添加“，”
        for (int i = 0; i < values.size(); i++) {
            Column column = table.columns.get(i);//列字段
            if(column.isIgnored) continue;//该列字段是否被忽略
            if(comma) sb.append(",");
            String val = values.get(i);//值
            if(val == null) {
                sb.append("NULL");//为null
            } else if(column.type.equals("INTEGER")) {//Integer
                sb.append(val);
            } else if(firstQuotationIsSingle(val)){//是单？双？引号
                sb.append("\"").append(val).append("\"");
            } else {
                sb.append("'").append(val).append("'");
            }
            comma = true;
        }
        sb.append(");");
        return sb.toString();
	} catch (Exception e) {
		// TODO: handle exception
		Log.error(table.name+","+e.getMessage());
		return "";
	}
    }

    private boolean firstQuotationIsSingle(String val) {
        for(int i=0;i<val.length();i++) {
            char ch = val.charAt(i);
            if(ch == '\'') {
                return true;
            }
            if(ch == '"') {
                return false;
            }
        }
        return false;
    }


}
