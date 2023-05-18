
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;
public class PostDao {
     Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
     
    public ArrayList<Category> getAllCategory(){
        ArrayList<Category> arr=new ArrayList<>();
        
        try{
           String query="select * from categories";
           Statement st=this.con.createStatement();
           ResultSet res=st.executeQuery(query);
            
            while(res.next())
            {
                int cid=res.getInt("cid");
                String name=res.getString("name");
                String description=res.getString("description");
                
                Category c=new Category(cid,name,description);
                arr.add(c);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return arr;
    }
    
    
    public boolean savePost(Posts p){
        try{
            
            String query="insert into post(pTitle,pContent,pCode,pPic,pDate,catId,userId) values(?,?,?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1, p.getpTitle());
            pst.setString(2,p.getpContent());
            pst.setString(3,p.getpCode());
            pst.setString(4,p.getpPic());
            pst.setTimestamp(5, p.getpDate());
            pst.setInt(6,p.getCatId());
            pst.setInt(7,p.getUserId());
            
            pst.executeUpdate();
            return true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    
    public List<Posts> getAllPost(){
        List<Posts> l=new ArrayList<>();
        try{
            PreparedStatement pst=con.prepareStatement("select * from post order by pId desc");
            ResultSet s=pst.executeQuery();
            while(s.next()){
                int pId=s.getInt("pId");
                String pTitle=s.getString("pTitle");
                String pContent=s.getString("pContent");
                String pCode=s.getString("pCode");
                String pPic=s.getString("pPic");
                int catId=s.getInt("catId");
                Timestamp pDate=s.getTimestamp("pDate");
                int userId=s.getInt("userId");
                Posts pp=new Posts( pTitle, pContent, pCode, pPic, pDate, catId, userId, pId);
                l.add(pp);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return l;
    }
    
    
    public List<Posts> getPostByCatId(int catId){
        List<Posts> l=new ArrayList<>();
        try{
            PreparedStatement pst=con.prepareStatement("select * from post where catId=?");
            pst.setInt(1,catId);
            ResultSet s=pst.executeQuery();
            while(s.next()){
                int pId=s.getInt("pId");
                String pTitle=s.getString("pTitle");
                String pContent=s.getString("pContent");
                String pCode=s.getString("pCode");
                String pPic=s.getString("pPic");
                Timestamp pDate=s.getTimestamp("pDate");
                int userId=s.getInt("userId");
                Posts pp=new Posts( pTitle, pContent, pCode, pPic, pDate, catId, userId, pId);
                l.add(pp);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return l;
    } 
    
    
    public Posts getPostByPostId(int postId){
         Posts p=null;
        try{
           
        String query="select * from post where pId=?";
         PreparedStatement pst=this.con.prepareStatement(query);
         pst.setInt(1, postId);
         
         ResultSet s=pst.executeQuery();
         if(s.next()){
             int pId=s.getInt("pId");
                String pTitle=s.getString("pTitle");
                String pContent=s.getString("pContent");
                String pCode=s.getString("pCode");
                String pPic=s.getString("pPic");
                Timestamp pDate=s.getTimestamp("pDate");
                int catId=s.getInt("catId");
                int userId=s.getInt("userId");
                p=new Posts( pTitle, pContent, pCode, pPic, pDate, catId, userId, pId);
             
         }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return p;
    }
}
