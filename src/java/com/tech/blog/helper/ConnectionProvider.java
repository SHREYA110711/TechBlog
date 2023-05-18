package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            
            if(con==null){
            Class.forName("com.mysql.cj.jdbc.Driver");   //load driver class
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","123456"); //create a connection
             
            }
        } catch (Exception e) {
          e.printStackTrace();
        }
        return con;
    }
}
