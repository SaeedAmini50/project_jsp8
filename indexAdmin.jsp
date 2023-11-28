<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@page  import ="java.text.SimpleDateFormat"%>
<%@page  import ="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.Time" %>
<%@page import="java.time.LocalTime" %>

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



PreparedStatement ps = con.prepareStatement("SELECT sum(quantity_item),sum(price_item) FROM orders INNER JOIN product INNER JOIN order_item ON  product.product_ID = order_item.product_ID AND orders.order_ID = order_item.order_ID where DATE(order_date) = CURDATE();");
		
ResultSet rs = ps.executeQuery();

if(rs.next()){%>


      
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات امروز  </p>
                                <h6 class="mb-0"><%=rs.getString(1) %></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">کل قیمت فروشات امروز</p>
                                <h6 class="mb-0">AF <%=rs.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                    <% }
                    
                    
PreparedStatement pss = con.prepareStatement("SELECT sum(quantity_item),sum(price_item) FROM orders INNER JOIN product INNER JOIN order_item ON  product.product_ID = order_item.product_ID AND orders.order_ID = order_item.order_ID where product.category_name='TV' and  DATE(order_date) = CURDATE();");
		
ResultSet rss = pss.executeQuery();

if(rss.next()){%>


      
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات تلویزیون امروز  </p>
                                <h6 class="mb-0"><%=rss.getString(1) %></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">کل قیمت فروشات باسشویی امروز</p>
                                <h6 class="mb-0">AF <%=rss.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                    <% }
                    
                                    
PreparedStatement psp = con.prepareStatement("SELECT sum(quantity_item),sum(price_item) FROM orders INNER JOIN product INNER JOIN order_item ON  product.product_ID = order_item.product_ID AND orders.order_ID = order_item.order_ID where product.category_name='MACHIN' and  DATE(order_date) = CURDATE();");
		
ResultSet rsp = psp.executeQuery();

if(rsp.next()){%>


      
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات تلویزیون امروز  </p>
                                <h6 class="mb-0"><%=rsp.getString(1) %></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">کل قیمت فروشات باسشویی امروز</p>
                                <h6 class="mb-0">AF <%=rsp.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                    <% }%>
                    
                    
                    
            <!-- Sales Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Worldwide Sales</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="worldwide-sales"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Salse and Revenue</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="salse-revenue"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sales Chart End -->

            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Recent Salse</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="">ID_bill</th>
                                    <th scope="">full_name</th>
                                    <th scope="">date </th>
                                    <th scope="">email </th>
                                    <th scope="">status_payment</th>
                                    <th scope="">total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%

               PreparedStatement ps2 = con.prepareStatement("SELECT * FROM customer INNER JOIN orders INNER JOIN payment ON orders.customer_ID = customer.customer_ID AND payment.payment_ID = orders.payment_ID where DATE(order_date) = CURDATE(); ");
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


            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <h6 class="mb-0">Messages last 24 hours</h6>
                                <a href="user_message.jsp">Show All message</a>
                            </div>
                            
      <%                       
                            
                            
PreparedStatement ps3 = con.prepareStatement("SELECT *, TIME(message.message_date) AS message_time FROM customer INNER JOIN message ON customer.customer_ID = message.customer_ID WHERE DATE(message.message_date) >= DATE_SUB(NOW(), INTERVAL  24 HOUR)");
ResultSet rs3 = ps3.executeQuery();

while (rs3.next()) {
	String messageTime = rs3.getString("message_time");
	LocalTime time = Time.valueOf(messageTime).toLocalTime();
	String hour = String.valueOf(time.getHour());
	String minute = String.valueOf(time.getMinute());
    %>
 

                            <div class="d-flex align-items-center border-bottom py-3">
                                <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h6 class="mb-0" name="full name"><%=rs3.getString(3)%><%=" "%> <%=rs3.getString(4)%></h6>
                                        <small><%=rs3.getDate(14)%>[<%=hour%>:<%=minute%>]</small>
                                    </div>
                                      <span><%=rs3.getString(11)%></span>
                                      <br>
                                    <span><%=rs3.getString(12)%></span>
                                </div>
                            </div>
    <hr class="dropdown-divider">
    <%}%>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Calender</h6>
                                <a href="">Show All</a>
                            </div>
                            <div id="calender"></div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">To Do List</h6>
                                <a href="">Show All</a>
                            </div>
                            <div class="d-flex mb-2">
                                <input class="form-control bg-dark border-0" type="text" placeholder="Enter task">
                                <button type="button" class="btn btn-primary ms-2">Add</button>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox" checked>
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span><del>Short task goes here...</del></span>
                                        <button class="btn btn-sm text-primary"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center pt-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Widgets End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
              <a href="index.jsp">Smart Store</a> 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                            <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
      
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