
package com.tech.blog.dao;

import java.sql.*;

public class likeDao {
  Connection con;

    public likeDao(Connection con) {
        this.con = con;
    }
    
    public boolean doLikeByUser(int pid,int uid){
        try{
            String query="insert into like_table(pId,uId) values(?,?)";
            PreparedStatement pst=this.con.prepareStatement(query);
            pst.setInt(1, pid);
              pst.setInt(2, uid);
              pst.executeUpdate();
              return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    
    
    public int countLike(int pid){
        int count=0;
        try{
        String query="select count(*) from like_table where pId=?";
         PreparedStatement pst=this.con.prepareStatement(query);
         pst.setInt(1,pid);
         ResultSet res=pst.executeQuery();
         if(res.next()){
             count=res.getInt("count(*)");
         }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean isLike(int pid,int uid){
        try{
            String query = "select * from like_table where pId=? and uId=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            ResultSet res=pst.executeQuery();
            if(res.next()) return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    
    public boolean deleteLike(int pid,int uid){
        try{
        String query = "delete from like_table where pId=? and uId=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeQuery();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
