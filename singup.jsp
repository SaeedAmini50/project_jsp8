<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Admin panel Smart store</title>
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


        <!-- Sign Up Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="indexAdmin.jsp" class="">
                                <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Smart Store</h3>
                            </a>
                            <h3>Sign Up</h3>
                            	 <%
	 String msg=request.getParameter("msg");
         if("valid".equals(msg)){  
        	 System.out.print("welcome");%>	 <h1 >Welcome... </h1>
				 <%}%>
				 
				 
                        </div>
						<form action="singupAction.jsp" method="post" >
						
                 <div class="form-floating mb-3">
                            <input type="text" name="customer_name" class="form-control" id="floatingText"  placeholder="اسم" required>
                            <label for="floatingText">اسم</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" name="customer_last_name" class="form-control" id="floatingInput" placeholder="فامیلی " required >
                            <label for="floatingInput">فامیلی</label>
                        </div>

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
                            <label for="floatingInput">جواب خود برای سوال  بالا بنویسید (لطفا چواب خود را بخاطر داشته باشید))</label>
                        </div>
                        
                          <div class="form-floating mb-4">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                            <label for="floatingPassword">رمز یا پسورد</label>
                        </div>
                        
                        <div class="form-floating mb-4">
                            <input type="password" name="customer_password2" class="form-control" id="floatingPassword" placeholder="Password" required>
                            <label for="floatingPassword">دوباره رمز یا پسورد خود را وارد کنید</label>
                        </div>
                        
                        
                        
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="floatingInput">!ایمیل و پسورد را بخاطر بسپار</label>
                            </div>
						
                         
                        </div>
                        <input type="submit" value="singup" class="btn btn-primary py-3 w-100 mb-4">
                        <p class="text-center mb-0">من قبلا حساب درست نکردم<a href="singin.jsp">Sign In</a></p>
                         </form>
                    </div>
                </div>
                
                
                

                
            </div>
            
             	 <%
				 if("invalidPassword".equals(msg)){
					 System.out.print("soorrrry your password is wrong");
				 %>
				 <h1>پسورد خود را درست وارد نکردید</h1>
	<% } %>
				 <%
				 if("invalid".equals(msg)){
					 System.out.print("soorrrry");
				 %>
				 <h1 style="text_alige:center;">اشتباه وارد کردید اطلاعات را</h1>
	<% } %>
		
        </div>
        <!-- Sign Up End -->
		
				
    </div>

	
	 <div class="Output_connection">

		   <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-8 col-sm-8 col-md-8 col-lg-8 col-xl-8">
                 
	
                 </div>
                 </div>
	</div>
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