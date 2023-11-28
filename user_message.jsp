<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>

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



  <% 
  try{
		
Connection con=ConnectionProvider.getCon();

%>








            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-12 col-xl-12">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <h6 class="mb-0">All Messages </h6>
                               
                            </div>
                            
                            
                            
                            
                            <% 


PreparedStatement ps3 = con.prepareStatement("SELECT * FROM  customer INNER JOIN message ON customer.customer_ID = message.customer_ID ");
		
ResultSet rs3 = ps3.executeQuery();

while(rs3.next()){

%>
     <div class="d-flex align-items-center border-bottom py-3">
                                <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-0" name="full name"><%=rs3.getString(3)%><%=" "%> <%=rs3.getString(4)%></h5>
                                        <h6>DATE : <small><%=rs3.getString(14)%></small> </h6>
                                    </div>
                                    <span>SUBJECT :<%=" "%><%=rs3.getString(11)%></span> 
                                      <br>
                                   <span>MESSAGE :<%=" "%><%=rs3.getString(12)%></span> 
                                </div>
                            </div>
                            
                            <%} %>
                            
                            
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Calender</h6>
                               
                            </div>
                            <div id="calender"></div>
                        </div>
                    </div>
                    </div>
                    </div>
                    


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
                 <%    if (con != null) {
                		try {
                		      con.close();
                		  } catch (SQLException e) {
                		  	System.out.print(e);
                		  }
                	}
  
  }
                            
catch(Exception e)  {
	System.out.print(e);
	
}
  %>
</body>

</html>