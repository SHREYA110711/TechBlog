package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean insertUser(User user) {

        try {
            //user data--> database

            String query = "insert into user (name,email,password,gender,about,rdate) values(?,?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());

            pst.setTimestamp(6, user.getDateTime());

            pst.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();

        }
        return false;
    }

    //get user by user email and password
    public User getUserByEmailAndPass(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where email=? and password=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, email);

            pst.setString(2, password);

            ResultSet s = pst.executeQuery();

            if (s.next()) {
                user = new User();
                user.setId(s.getInt("id"));
                user.setName(s.getString("name"));
                user.setEmail(s.getString("email"));
                user.setPassword(s.getString("password"));
                user.setGender(s.getString("gender"));
                user.setAbout(s.getString("about"));
                user.setDateTime(s.getTimestamp("rdate"));
                user.setProfile(s.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean UpdateUser(User user) {
        try {

            String query = "update user set name=?, email=?, password=?, gender=?,about=?,profile=? where id=? ";

            PreparedStatement pst = con.prepareStatement(query);
         
            pst.setString(1,user.getName());
             pst.setString(2,user.getEmail());
            pst.setString(3,user.getPassword());
             pst.setString(4,user.getGender());
           pst.setString(5,user.getAbout());
          pst.setString(6,user.getProfile());
            pst.setInt(7,user.getId());
            
            pst.executeUpdate();
               return true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public User getUserByUserId(int userId){
        User user=null;
        
        
        
        try{
           String query="select * from user where id=?";
           PreparedStatement pst=this.con.prepareStatement(query);
           pst.setInt(1, userId);
           ResultSet s=pst.executeQuery();
           if(s.next()){
              
                user = new User();
                user.setId(s.getInt("id"));
                user.setName(s.getString("name"));
                user.setEmail(s.getString("email"));
                user.setPassword(s.getString("password"));
                user.setGender(s.getString("gender"));
                user.setAbout(s.getString("about"));
                user.setDateTime(s.getTimestamp("rdate"));
                user.setProfile(s.getString("profile"));
           }
           
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
