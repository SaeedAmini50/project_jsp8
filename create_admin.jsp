<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
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



               <%@ include file="headerAdmin.jsp" %>



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
				 <% 
				  if("invalid".equals(msg)){  
        	 System.out.print("welcome");%>	 <h1 >do not create... </h1>
				 <%}%>
				 
				 
                        </div>
<form action="create_admin_Action.jsp" method="post" >
						
                 <div class="form-floating mb-3">
                            <input type="text" name="admin_name" class="form-control" id="floatingText"  placeholder="اسم" required>
                            <label for="floatingText"> اسم مدیر</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" name="admin_last_name" class="form-control" id="floatingInput" placeholder="فامیلی " required >
                            <label for="floatingInput">فامیلی</label>
                        </div>

						<div class="form-floating mb-3">
                            <input type="email" name="email" class="form-control" id="floatingInput" placeholder="ایمیل آدرس " required>
                            <label for="floatingInput">ایمیل آدرس</label>
                        </div>
                      
                      	<div class="form-floating mb-3">
                            <input type="text" name="admin_phone" class="form-control" id="floatingInput" placeholder=" شماره تلفن " required>
                            <label for="floatingInput">شماره تلفن</label>
                        </div>
                    
                       <select name="Security_Question" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
					<option value="what was your first car?"  selected> اولین ماشین شما چی بود؟</option>
						<option value="what is the name of your first friend?">اسم اولین دوست شما چی بود؟</option>
						<option value="what was the first_neme of school that you attend?">اسم اولین مکتبی که شما در آن اشتراک کردید چه بود؟</option>
						<option value="what is the name of the town where you were born?">اسم شهری که شما در آن متولد شدید چه بود؟</option>
					</select>
		
					<div class="form-floating mb-3">
                            <input type="text" name="admin_answer" class="form-control" id="floatingInput" placeholder="جواب خود برای سوال های بالا بنویسید" required>
                            <label for="floatingInput">جواب خود برای سوال  بالا بنویسید (لطفا چواب خوا بخاطر داشته باشید)د ر)</label>
                        </div>
                        
                          <div class="form-floating mb-4">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                            <label for="floatingPassword">رمز یا پسورد</label>
                        </div>
                        
                        <div class="form-floating mb-4">
                            <input type="password" name="password2" class="form-control" id="floatingPassword" placeholder="Password_agine" required>
                            <label for="floatingPassword">دوباره رمز یا پسورد خود را وارد کنید</label>
                        </div>
                        
                            <input type="submit" value="singup" class="btn btn-primary py-3 w-100 mb-4">
               
                         </form>
                        
                        
                         
                        </div>
                    
                         
                    </div>
                </div>
                
                
                

                
            </div>
            
             	 <%
				 if("valid".equals(msg)){
					 System.out.print("create...");
				 %>
				 <h1>create</h1>
	<% } %>
				 <%
				 if("invalid".equals(msg)){
					 System.out.print("soorrrry...");
				 %>
				 <h1 style="text_alige:center;">do not create</h1>
	<% } %>
		
        </div>
        <!-- Sign Up End -->
	
	
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