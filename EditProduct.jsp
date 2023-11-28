<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> Smart store</title>
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
    
                     <% 
                     String product_ID=request.getParameter("product_ID");
                     try{
Connection con=ConnectionProvider.getCon();


PreparedStatement ps = con.prepareStatement("SELECT * FROM product WHERE product_ID=?");
ps.setString(1, product_ID);
ResultSet rs = ps.executeQuery();


while(rs.next()){%>
    
    
    
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
                            <h3>Edit Product</h3>
                        </div>
					
						<form action="EditProductAction.jsp" method="post" >
						
						
						
                 <div class="form-floating mb-3">
                            <input type="text" value="<%=rs.getString(1) %>" name="product_name" class="form-control" id="floatingText"  placeholder="اسم محصول" required>
                            <label for="floatingText">اسم محصول</label>
                        </div>
                        
                          
						<div class="form-floating mb-3">
                            <input type="text" value="<%=rs.getString(2) %>" name="product_price" class="form-control" id="floatingInput" placeholder="قیمت محصول" required>
                            <label for="floatingInput"> قیمت محصول</label>
                        </div>
						<div class="form-floating mb-3">
                            <input type="text" value="<%=rs.getString(3) %>" name="product_size" class="form-control" id="floatingInput" placeholder="صفت اول محصول" required>
                            <label for="floatingInput">سایز  محصول</label>
                        </div>
                      
                 
					<div class="form-floating mb-3">
                            <input type="text" value="<%=rs.getString(4) %>" name="product_attribute" class="form-control" id="floatingInput" placeholder="صفت دوم محصول" required>
                            <label for="floatingInput">صفت  محصول</label>
                        </div>
                        
                          <div class="form-floating mb-4">
                            <input type="text" value="<%=rs.getString(5) %>" name="product_mark" class="form-control" id="floatingInput" placeholder="مارک محصول" required>
                            <label for="floatingInput">مارک محصول</label>
                        </div>
                        
                       
                        
                                <label for="formFile"  class="form-label">تغییر عکس محصول</label>
                                <input class="form-control bg-dark"  value="<%=rs.getString(6) %>"  name="product_photo" type="file" id="formFile">
                        
                            <br>
                        
                         <div class="form-floating mb-4">
                            <input type="text" value="<%=rs.getString(9) %>" name="product_benefit" class="form-control" id="floatingInput" placeholder="سود محصول" required>
                            <label for="floatingInput">سود محصول</label>
                        </div>
                     
                       <select name="product_active" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                <option selected value="yes">بلی</option>
                                <option value="no">نه</option>
                                    </select>
                        
                            <input type="hidden" value="<%=rs.getString(8) %>" name="product_ID"  required>
                            
           
                         
                   
                        <input type="submit" value="OK" class="btn btn-primary py-3 w-100 mb-4">

                         </form>
                                   <%
                                   
                                   if (ps != null) {
   						            try {
   						                ps.close();
   						            } catch (SQLException e) {
   						            	System.out.print(e);
   						            }
   						        }

                                   if (rs != null) {
   						            try {
   						                rs.close();
   						            } catch (SQLException e) {
   						            	System.out.print(e);
   						            }
   						        }
                                   if (con != null) {
                                		try {
                                		      con.close();
                                		  } catch (SQLException e) {
                                		  	System.out.print(e);
                                		  }
                                	}
                                   
                                   
}}

catch(Exception e){
System.out.print(e);

}
                     %>
                        
						
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign Up End -->
		
		
    </div>

	
	 <div class="Output_connection">

		   <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-8 col-sm-8 col-md-8 col-lg-8 col-xl-8">
                 
	
                 </div>
                 </div>
	</div>

	 <%
	 String msg=request.getParameter("msg");
         if("valid".equals(msg)){  
        	 System.out.print("welcome");
        	 
        	 %>
				 <h1 >Welcome... </h1>
				 <%}%>
				 <%
				 if("invalid".equals(msg)){
					 System.out.print("soorrrry");
				 %>
				 <h1>your password or email is wrong</h1>
	<% } %>
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