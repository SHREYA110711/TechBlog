<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.likeDao"%>

<div class="row">
    <%
         User user=(User)session.getAttribute("currentUser");
          Thread.sleep(300);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
         List<Posts> l=null;
        int cid=Integer.parseInt(request.getParameter("cid"));
        if(cid==0){
       l = d.getAllPost();
        }
        else{
        l=d.getPostByCatId(cid);
        }
        if(l.size()==0){
        out.println("<h4 class='display-3 text-center'>No post in this category...</h4>");
        return;
        
        }
        for (Posts p : l) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
         
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle()%></b>
                <p><%=p.getpContent()%></p>
            </div>
            <div class="card-footer ">
                 <% 
                    likeDao ld = new likeDao(ConnectionProvider.getConnection());
                %>
                <a href="showBlog_page.jsp?post_id=<%=p.getpId()%>" class="btn btn-sm primary-background text-white">Read More</a>
                <a href="#" onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)" class="btn btn-sm primary-background text-white"><i class="fa fa-thumbs-o-up"></i><span> <%= ld.countLike(p.getpId())%></span></a>
                 <a href="#" class="btn btn-sm primary-background text-white"><i class="fa fa-commenting-o"><span> 20</span></i></a>
                
                
            </div>

        </div>

    </div>


    <%
        }
    %>
</div>