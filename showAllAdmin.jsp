<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" 
import="project.ConnectionProvider"
%>


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
          <!--start jsp -->
        
        
         <div>
	 <%
	 String msg=request.getParameter("msg");
         if("done".equals(msg)){  
        	 System.out.print("show product");
        	 
        	 %>
				 <h1 >Welcome... show product</h1>
				 <%}%>
				 <%
				 if("wrongedit".equals(msg)){
					 System.out.print("soorrrry system can not show product");
				 %>
				 <h1>soorrrry system can not show product</h1>
	<% } %>
        
        
        </div>
        
          <!-- End jsp-->
        
        
        
       
					<!-- start table -->
                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">اضافه کردن محصول</h6>
                            <table class="table">
                                <thead>
                                 <tr>
                                        <th scope="col">Edit <i class="fas fa-pen-fancy"></i></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">اسم </th>
                                        <th scope="col">تخلص</th>
                                        <th scope="col">ایمیل آدرس</th>
                                         <th scope="col">تاریخ درست شدن ادمین</th>
                                      
                                </tr>
                                </thead>
                                <tbody>
                                <% 
                                try{
                                	

String search="";
Connection con=ConnectionProvider.getCon();
String query = "SELECT * FROM admin WHERE email LIKE ? ";
PreparedStatement pst = con.prepareStatement(query);
pst.setString(1, "%" + search + "%");
ResultSet rs = pst.executeQuery();

while(rs.next()){%>
                                    <tr>
                                    <th> Edit <i class="fas fa-pen-fancy"></i></th>
                                          <td name="ID"> <%=rs.getString(1) %></td>
                                        <td name="name"> <%=rs.getString(2) %></td>
                                    <td name="Last name"><%=rs.getString(3) %></td>
                                        <td name="email"><%=rs.getString(4) %></td>
                                       <td name="data"><%=rs.getString(9)  %></td>
                                       
                                        
                                        
                                    </tr>
                                    <% 
                            }
if (rs != null) {
    try {
        rs.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
  
if (pst != null) {
    try {
        pst.close();
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
                                }
                            
catch(Exception e)  {
	System.out.print(e);
	
}%>
       
                                </tbody>
                            </table>
                                                       
                        </div>
                    </div>
					<!-- table end -->

					
					</div>


        <!-- Content End -->


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
</body>

</html>