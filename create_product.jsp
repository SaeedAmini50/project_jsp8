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
				 
				 
                        </div>
	<form action="create_product_Action.jsp" method="post" >
						
						
						
                 <div class="form-floating mb-3">
                            <input type="text"  name="product_name" class="form-control" id="floatingText"  placeholder="اسم محصول" required>
                            <label for="floatingText">اسم محصول</label>
                        </div>
                        
                          
						<div class="form-floating mb-3">
                            <input type="text"  name="product_price" class="form-control" id="floatingInput" placeholder="قیمت محصول" required>
                            <label for="floatingInput"> قیمت محصول</label>
                        </div>
						<div class="form-floating mb-3">
                            <input type="text"  name="product_size" class="form-control" id="floatingInput" placeholder="صفت اول محصول" required>
                            <label for="floatingInput">سایز  محصول</label>
                        </div>
                      
                 
					<div class="form-floating mb-3">
                            <input type="text"  name="product_attribute" class="form-control" id="floatingInput" placeholder="صفت دوم محصول" required>
                            <label for="floatingInput">صفت  محصول</label>
                        </div>
                        
                          <div class="form-floating mb-4">
                            <input type="text"  name="product_mark" class="form-control" id="floatingInput" placeholder="مارک محصول" required>
                            <label for="floatingInput">مارک محصول</label>
                        </div>
                        
                       
                        
                                <label for="formFile"  class="form-label">تغییر عکس محصول</label>
                                <input class="form-control bg-dark"   type="file"  name="product_photo"  id="formFile">
                        
                            <br>
                        
                         <div class="form-floating mb-4">
                            <input type="text"  name="product_benefit" class="form-control" id="floatingInput" placeholder="سود محصول" required>
                            <label for="floatingInput">سود محصول</label>
                        </div>
                     
                       <select name="product_active" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                <option selected value="yes">بلی</option>
                                <option value="no">نه</option>
                                    </select>
                        
                        <select name="category_name" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                <option selected value="TV">TV</option>
                                <option value="MACHIN">MACHIN</option>
                                    </select>
                        
                         
                   
                        <input type="submit" value="create" class="btn btn-primary py-3 w-100 mb-4">

                         </form>

                         
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