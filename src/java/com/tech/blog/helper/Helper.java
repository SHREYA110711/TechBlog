/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Shishir Roy
 */
public class Helper {
    public static boolean deleteFile(String path){
        try{
            File file=new File(path);
          return file.delete();
         
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean saveFile(InputStream in,String path){
        try{
           byte []b=new byte[in.available()]; 
           in.read(b);
           
           FileOutputStream fos=new FileOutputStream(path);
           
           fos.write(b);
           fos.flush();
           fos.close();
           return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
