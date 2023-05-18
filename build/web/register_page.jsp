

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 1%, 100% 93%, 60% 100%, 36% 93%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background  banner-background" style="padding-bottom:80px">

            <div class="container">
                <div class="col-md-4 offset-md-4">

                    <div class="card">

                        <div class="card-header text-center primary-background text-white"> <span class="fa fa-user-circle fa-3x"></span><p>Register Here..</p></div>
                        <br>
                        <div class="card-body">
                          
                            <form id="reg-form"action="registerServlet" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Username</label>
                                    <input name="user_name"type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter name">
              
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="form-group">
                                    <label for="gender">Gender: </label>
                                    
                                    <input type="radio" id="gender" name="user_gender" value="Female">Female
                                    <input type="radio" id="gender" name="user_gender" value="Male">Male
                                    
                                </div>
                                <div class="form-group">
                                    <textarea name="user_about" class="form-control" rows="5" placeholder="Enter something about yourself.."></textarea>
                                    
                                </div>
                                <div class="form-check">
                                    <input name="user_check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center " id="loader" style="display:none">
                                    <span class="fa fa-refresh fa-spin fa-4x"> </span>
                                        <h5>Please wait.....</h5> 
                                    
                                    
                                </div>
                                
                                <button id="submit-btn"type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    

                </div>


            </div>

            </div>

        </main>



        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
          <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded......");
                
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url:'registerServlet',
                        type:'POST',
                        data: form,
                        success:function(data,textStatus,jqXHR){
                            console.log(data);
                             $("#submit-btn").show();
                             $("#loader").hide();
                             
                             if(data.trim()==='done'){
                                 swal("registered successfully....")
                                         .then((value)=>{
                                             window.location="login_page.jsp";
                                 });
                             }
                             else{
                                 swal(data);
                             }
                        },
                        error:function(jqXHR,textStatus,errorThrown){
                            console.log(jqXHR);
                             $("#submit-btn").show();
                             $("#loader").hide();
                             swal("Something went wrong....Redirecting to Home")
                                         .then((value)=>{
                                             window.location="index.jsp";
                                 })
                            
                        },
                        processData:false,
                        contentType:false
                    });
                });
            });
            
        </script>
    
    </body>
</html>
