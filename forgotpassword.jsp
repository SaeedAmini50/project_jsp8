<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
    
    <%@ page import="java.sql.*" 
import="project.ConnectionProvider"
%>
    
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Admin panel smart store</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="libAdmin/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="libAdmin/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

   <!-- Customized Bootstrap Stylesheet -->
    <link href="cssAdmin/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="cssAdmin/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class=" bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="indexAdmin.jsp" class="">
                                <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Smart Store</h3>
                            </a>
                            <h3>forgotpassword</h3>
                            	 <%
	 String msg=request.getParameter("msg");
         if("done".equals(msg)){  
        	 System.out.print("welcome");
        	 
        	 %>
				 <h1 >پسورد تان تغییر کرد</h1>
				 <%}%>
				 	 <%
				 if("invalidPassword".equals(msg)){
					 System.out.print("soorrrry");
				 %>
				 <h1>پسورد را اشتباه وارد کردید</h1>
	<% } %>
				 <%
				 if("invalid".equals(msg)){
					 System.out.print("soorrrry");
				 %>
				 <h1>اطلاعات اشتباه هستند</h1>
	<% } %>
                        </div>
					<form action="forgotpasswordAction.jsp" methed="post">
                       
                       	<div class="form-floating mb-3">
                            <input type="email" name="email" class="form-control" id="floatingInput" placeholder="ایمیل آدرس " required>
                            <label for="floatingInput">ایمیل آدرس</label>
                        </div>
                        
                     
   <select name="Security_Question" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
					<option value="what was your first car?"  selected> اولین ماشین شما چی بود؟</option>
						<option value="what is the name of your first friend?">اسم اولین دوست شما چی بود؟</option>
						<option value="what was the first_neme of school that you attend?">اسم اولین مکتبی که شما در آن اشتراک کردید چه بود؟</option>
						<option value="what is the name of the town where you were born?">اسم شهری که شما در آن متولد شدید چه بود؟</option>
					</select>
		
		
					<div class="form-floating mb-3">
                            <input type="text" name="answer" class="form-control" id="floatingInput" placeholder="جواب خود برای سوال های بالا بنویسید" required>
                            <label for="floatingInput">جواب خود برای سوال  بالا بنویسید</label>
                        </div>
                        
                        <div class="form-floating mb-4">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="پسورد جدید خود را وارد کنید">
                            <label for="floatingPassword"> پسورد جدید خود را وارد کنید</label>
                        </div>
                        
                        
                        <div class="form-floating mb-4">
                            <input type="password" name="customer_password2" class="form-control" id="floatingPassword" placeholder="Password" required>
                            <label for="floatingPassword">دوباره رمز یا پسورد خود را وارد کنید</label>
                        </div>
                      
                         <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="person"
                                                id="gridRadios1" value="1" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                             <h4>مشتری
                                          </h4>  </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="person"
                                                id="gridRadios2" value="2">
                                            <label class="form-check-label" for="gridRadios2">
                                               <h4> ادمین
                                          </h4>  </label>
                                        </div>
                                    </div>
                      
                      
                      
                      
                        
                      <button type="submit" value="submit" class="btn btn-primary py-3 w-100 mb-4">save</button>
                      
                      
                      
                      
                        
						</form>
                        </div>
                                                  <p class="text-center mb-0">من قبلا حساب درست کردم <a href="singin.jsp">Sign in</a></p>
                        
                          <p class="text-center mb-0">من قبلا حساب درست نکردم <a href="singup.jsp">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Sign In End -->
    


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="libAdmin/chart/chart.min.js"></script>
    <script src="libAdmin/easing/easing.min.js"></script>
    <script src="libAdmin/waypoints/waypoints.min.js"></script>
    <script src="libAdmin/owlcarousel/owl.carousel.min.js"></script>
    <script src="libAdmin/tempusdominus/js/moment.min.js"></script>
    <script src="libAdmin/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="libAdmin/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="jsAdmin/main.js"></script>
</body>

</html>