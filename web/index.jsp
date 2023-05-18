

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <!-- nav-bar -->
        <%@include file="normal_navbar.jsp" %>   


        <!-- banner -->

        <div class="container-fluid p-0 m-0 banner-background">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>  
                    <p>A technical blog stands out from a regular blog in that it focuses on a technical subject. Typically, it traces and thus explains the development/ rise or the functioning of a particular thing, say a technical invention or an application.</p>
                    <p>Technology is the application of knowledge for achieving practical goals in a reproducible way. The word technology can also mean the products resulting from such efforts, including both tangible tools such as utensils or machines, and intangible ones such as software.</p>

                    <button class="btn btn-outline-light btn-lg "><span class="fa fa-user-plus">  </span>  Start ! its Free</button>
                    <a href="login_page.jsp"class="btn btn-outline-light btn-lg "><span class="fa fa-user-circle fa-spin"></span>  Login</a>
                     <a href="register_page.jsp"class="btn btn-outline-light btn-lg "><span class="fa fa-user-plus"></span>  Sign Up</a>


                </div>
            </div>

        </div>

        <br>
        <!--cards-->
        <div class="container mb-2">

            <div class="row">
                <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more</a>
                    </div>
                </div>

                </div>
                
                <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more</a>
                    </div>
                </div>

                </div>
                
                <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more</a>
                    </div>
                </div>

                </div>

            </div>              
                </div>
            



           

        </div>
        
        <div class="container mb-2">

            <div class="row">
                <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more</a>
                    </div>
                </div>

                </div>
                
                <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more</a>
                    </div>
                </div>

                </div>
                
                <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more</a>
                    </div>
                </div>

                </div>

            </div>              
                </div>
            



           

        </div>


        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
