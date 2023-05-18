
<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>




<%    int post_id = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Posts p = d.getPostByPostId(post_id);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%></title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 1%, 100% 93%, 60% 100%, 36% 93%, 0 100%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
   
            }
            .post-code{
                
            }
            .post-content{
                 font-weight: 100;
                font-size: 22px;
            }
            .post-date{
                font-style: italic;
            }
            .post-user{
                font-size: 20px;
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(img/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span>Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structures</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-vcard-o"> </span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post"><span class="fa fa-plus-square-o" > </span> Add Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-circle"> </span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet"><span class="	fa fa-sign-out"> </span> Logout</a>
                    </li>

                </ul>
            </div>
        </nav>


        <!--main content of body-->

        <div class="container">

            <div class="row my-4 ">

                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white ">

                            <h4 class="post-title"><%=p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            
                            <img class="card-img-top my-2" src="blog_pics/<%=p.getpPic()%>">
                            <div class="row row-user">
                                <div class="col-md-8">
                                    <%
                                    UserDao ud=new UserDao(ConnectionProvider.getConnection());
                                    
                                    %>
                                    <a href="#" class="post-user" style="color:#4C3575"> <%=ud.getUserByUserId(p.getUserId()).getName()%></a> 
                                    
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%=p.getpDate().toLocaleString()%></p>
                                    
                                    
                                </div>
                                
                            </div>
                            <p class="post-content"><%=p.getpContent()%></p> 
                            <br>
                            <br>
                            <div class="post-code">
                            <pre><%=p.getpCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer ">
                            <%
                            likeDao ld=new likeDao(ConnectionProvider.getConnection());
                            
                            %>
                           
                            <a href="#!" onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)" class="btn btn-sm primary-background text-white"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=ld.countLike(p.getpId())%></span></a>
                            <a href="#!" class="btn btn-sm primary-background text-white"><i class="fa fa-commenting-o"><span> 20</span></i></a>


                        </div>



                    </div>



                </div>


            </div>


        </div>


        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 120px;">

                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

                            <!--details-->
                            <div id="profile-details">

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id :</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%=user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- profile edit -->


                            <div id="profile-edit" style="display:none">
                                <h3 class="mt-2">Please Edit Carefully..</h3>

                                <form action="editServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id :</td>
                                            <td><%=user.getId()%></td>
                                        </tr> 
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" name="user_name" class="form-control" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" name="user_email" class="form-control" value="<%=user.getEmail()%>"></td>
                                        </tr> 
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" name="user_password" class="form-control" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>

                                        <tr>
                                            <td>About :</td>
                                            <td><textarea rows="5"name="user_about" class="form-control"><%=user.getAbout()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>New Profile :</td>
                                            <td><input type="file" name="user_profile" class="form-control"></td>
                                        </tr>
                                    </table>


                                    <div class="container">
                                        <button type="submit" class="btn primary-background text-white">Save</button>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--post modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Post Details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="POST" id="add-post-form">

                            <div class="form-group">
                                <select class="form-control"name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategory();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%=c.getName()%></option>
                                    <%}%>  
                                </select>


                            </div>
                            <div class="form-group" >
                                <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control"/>
                            </div> 
                            <div class="form-group" >
                                <textarea class="form-control" name="pContent" placeholder="Enter your content..." style="height:200px"></textarea>
                            </div> 
                            <div class="form-group" >
                                <textarea class="form-control" name="pCode" placeholder="Enter your code(if any)..." style="height:200px"></textarea>
                            </div> 
                            <div class="form-group">
                                <label>Choose your pic :</label>
                                <input type="file" name="pic">
                            </div>
                            <div class="container text-center">
                                <button  class="btn primary-background text-white">POST</button>    
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
          <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $("#edit-profile-btn").click(function () {
                    if (editStatus === false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");

                    }
                })
            })


        </script>
        <!-- post js -->


        <script>

            $(document).ready(function (e) {

                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "successful") {
                                swal(
                                        'Great Job!!!',
                                        'Successfully Saved...',
                                        'success'
                                        );
                            } else {
                                swal(
                                        'Error!!!',
                                        'Something went wrong....',
                                        'error'
                                        );
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal(
                                    'Error!!!',
                                    'Something went wrong....',
                                    'error'
                                    );

                        },
                        processData: false,
                        contentType: false
                    })
                })
            })



        </script>
    </body>
</html>
