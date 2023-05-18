
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class editServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editServlet</title>");            
            out.println("</head>");
            out.println("<body>");
         
           
           //fetching the data 
            String userEmail=request.getParameter("user_email");
             String userName=request.getParameter("user_name");
              String userPass=request.getParameter("user_password");
               String userAbout=request.getParameter("user_about");
                
                Part userProfile=request.getPart("user_profile");
               out.println(userProfile);
                String imgName=userProfile.getSubmittedFileName();
               
             
           
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setAbout(userAbout);
            user.setName(userName);
            user.setPassword(userPass);
            String oldFile=user.getProfile();
            user.setProfile(imgName);
            
            
            //update in database
            
            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
             
            boolean res=userDao.UpdateUser(user);
            if(res){
                
                String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                 String oldFilePath=request.getRealPath("/")+"pics"+File.separator+oldFile;
                if(!oldFilePath.equals("default.png")){
                Helper.deleteFile(oldFilePath);
                }
                if(Helper.saveFile(userProfile.getInputStream(), path)){
                  
                    Message msg=new Message("Profile Details Updated...","success","alert-success");
                    s.setAttribute("msg",msg);
                }
                else{
                     Message msg=new Message("Something went wrong!!","error","alert-danger");
                     s.setAttribute("msg",msg);
                }
            }
            else{
                Message msg=new Message("Something went wrong!!!","error","alert-danger");
              s.setAttribute("msg",msg);
            }
            
            response.sendRedirect("profile_page.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
