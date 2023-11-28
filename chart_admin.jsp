<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en">

<head>
<script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
// Salse & Revenue Chart
var ctx2 = $("#salse-revenue").get(0).getContext("2d");
var myChart2 = new Chart(ctx2, {
    type: "line",
    data: {
        labels: ["1", "2", "3", "4", "5", "6", "7","8", "9", "10", "11", "12", "13", "14"],
        datasets: [{
                label: "Salse",
                data: [15, 30, 55, 45, 70, 65, 85,66],
                backgroundColor: "rgba(235, 22, 22, .7)",
                fill: true
            },
            {
                label: "Revenue",
                data: [99, 135, 170, 130, 190, 180, 270,550],
                backgroundColor: "rgba(235, 22, 22, .5)",
                fill: true
            }
        ]
        },
    options: {
        responsive: true
    }
});


</script>

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



PreparedStatement ps = con.prepareStatement("select sum(quantity_item),sum(price_item) from order_item ;");
		
ResultSet rs = ps.executeQuery();

if(rs.next()){%>


      
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات </p>
                                <h6 class="mb-0"><%=rs.getString(1) %></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">کل قیمت فروشات </p>
                                <h6 class="mb-0">AF <%=rs.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                    <% }
                    
PreparedStatement ps1 = con.prepareStatement("SELECT sum(quantity_item),sum(price_item),sum(product_benefit) FROM orders INNER JOIN product INNER JOIN order_item ON  product.product_ID = order_item.product_ID AND orders.order_ID = order_item.order_ID where DATE(order_date) = CURDATE();");
ResultSet rs1 = ps1.executeQuery();
                    if(rs1.next()){%>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات امروز</p>
                                <h6 class="mb-0"><%=rs1.getString(1)%></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">قیمت فروشات امروز</p>
                                <h6 class="mb-0">AF <%=rs1.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                  <%   }
                    PreparedStatement ps2 = con.prepareStatement("SELECT sum(quantity_item),sum(price_item),sum(product_benefit) FROM orders INNER JOIN product INNER JOIN order_item ON  product.product_ID = order_item.product_ID AND orders.order_ID = order_item.order_ID where DATE(order_date) >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK);");
ResultSet rs2 = ps2.executeQuery();
                    if(rs2.next()){%>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات یک هفته  </p>
                                <h6 class="mb-0"><%=rs2.getString(1)%></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2"> قیمت فروشات یک هفته</p>
                                <h6 class="mb-0">AF <%=rs2.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                    
                     <%   }
                    PreparedStatement ps3 = con.prepareStatement("SELECT sum(quantity_item),sum(price_item),sum(product_benefit) FROM orders INNER JOIN product INNER JOIN order_item ON  product.product_ID = order_item.product_ID AND orders.order_ID = order_item.order_ID where DATE(order_date) >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);");
ResultSet rs3 = ps3.executeQuery();
                    if(rs3.next()){%>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">تعداد فروشات یک ماه  </p>
                                <h6 class="mb-0"><%=rs3.getString(1)%></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2"> قیمت فروشات یک ماه</p>
                                <h6 class="mb-0">AF <%=rs3.getString(2) %></h6>
                            </div>
                        </div>
                    </div>
                 
                </div>
            </div>
            <!-- Sale & Revenue End -->
<%}%>

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