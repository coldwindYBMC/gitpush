package com.hoolai.game.dbtransfer;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Column {
    
    public String name;//字段名
    public String type;//类型（integer等）
    public boolean iskey;//是否是主键
    public boolean isIgnored;//是否忽略
    
    public Column parseFromRS(String tableName, ResultSet rs) throws SQLException {
        this.name = rs.getString(1);
        this.type = TypeTransfer.mysql2sqlite(rs.getString(2));
        this.iskey = "PRI".equals(rs.getString(4));
        this.isIgnored = Environment.isIgnoreColumn(tableName, this.name);
        return this;
    }

    public String toString(boolean ignoreKey) {
        StringBuilder sb = new StringBuilder();
        sb.append("\"" + this.name + "\"")
            .append(" ").append(this.type);
        return (iskey && !ignoreKey) ? sb.append(" PRIMARY KEY").toString() : sb.toString();
    }
    
}
