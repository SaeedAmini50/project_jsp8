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
            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4" >
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">all orders</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="">ID_bill</th>
                                    <th scope="">"full_name"</th>
                                    <th scope="">date </th>
                                    <th scope="">email </th>
                                    <th scope="">status_payment</th>
                                    <th scope="">total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%

               PreparedStatement ps2 = con.prepareStatement("SELECT * FROM customer INNER JOIN orders INNER JOIN payment ON orders.customer_ID = customer.customer_ID AND payment.payment_ID = orders.payment_ID ");
               ResultSet rs2 = ps2.executeQuery();
               
while(rs2.next()){%>
                            
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td name="ID_bill"><%=rs2.getString(2) %></td>
                                    <td name="full_name"><%=rs2.getString(3)%><%=" "%> <%=rs2.getString(4)%></td>
                                     <td name="email"><%=rs2.getString(2) %></td>
                               <td name="date"><%=rs2.getString(18) %></td>
                                <td name="status_payment"><%=rs2.getString(21) %></td>
                                         <td name="total"><%=rs2.getString(17) %></td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                
                                
                                <%} %>
                                                           </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->



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