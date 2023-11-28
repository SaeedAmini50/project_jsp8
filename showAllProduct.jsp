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
                        <h6 class="mb-0">all orders this month</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            
                            
                            
                           <tr class="text-white">
                                  
                                      <th scope="col">Edit <i class="fas fa-pen-fancy"></i></th>
                                        <th scope="col">اسم محصول</th>
                                         <th scope="col">دسته بندی </th>
                                        <th scope="col">قیمت محصول</th>
                                        <th scope="col">سایز محصول</th>
                                        <th scope="col">صفت  محصول</th>
                                        <th scope="col">مارک محصول</th>
                                        <th scope="col">عکس محصول</th>
                                        <th scope="col">سود محصول</th>
                                        <th scope="col">فعالیت</th>
                                        <th scope="col">ID</th>
                                            <th scope="col">Edit <i class="fas fa-pen-fancy"></i></th>
                                </tr>
                                
                                
                            </thead>
                            <tbody>
                            <%

               PreparedStatement ps2 = con.prepareStatement("SELECT * FROM product");
               ResultSet rs = ps2.executeQuery();
               
while(rs.next()){%>
                            
                              <tr>
                             
                                    <th> <a href="EditProduct.jsp?product_ID=<%= rs.getString(8) %>">Edit <i class="fas fa-pen-fancy"></i></a> </th>
                                        <td name="name"><%=rs.getString(1) %></td>
                                        <td name="categoryID"><%=rs.getString(10) %></td>
                                        <td name="price"><%=rs.getString(2) %></td>
                                        <td name="size"><%=rs.getString(3) %></td>
                                        <td name="attribute"><%=rs.getString(4)  %></td>
                                        <td name="mark"><%=rs.getString(5)  %></td>
                                        <td name="photo"><%=rs.getString(6) %></td>
                                       <td name="benefit"><%=rs.getString(9) %></td>
                                           <td name="active"><%=rs.getString(7) %></td>
                                           <td name="ID"><%=rs.getString(8) %></td>
                                       <th> <a href="product_header_action.jsp?product_ID=<%= rs.getString(8) %>">Edit <i class="fas fa-pen-fancy"></i></a> </th>
                                  
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