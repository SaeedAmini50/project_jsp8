<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
 
  
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>




    <% 
    try{
    	 String product_ID=request.getParameter("product_ID");	
    	Connection con=ConnectionProvider.getCon();

    	


  PreparedStatement pst2 = con.prepareStatement("SELECT * FROM product INNER JOIN product_category ON product.category_name = product_category.category_name WHERE product.product_ID = ?");
  pst2.setString(1, product_ID);
		
  ResultSet rs1 = pst2.executeQuery();

while(rs1.next()){%>
                   

<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<!-- Product main img -->
<div class="col-md-5 col-md-push-2">
<div id="product-main-img">
<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> "alt="">
</div>

<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>

<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>

<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>
</div>
</div>
<!-- /Product main img -->

<!-- Product thumb imgs -->
<div class="col-md-2  col-md-pull-5">
<div id="product-imgs">
<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>

<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>

<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>

<div class="product-preview">
<img src="./img/<%=rs1.getString(6) %> " alt="">
</div>
</div>
</div>
<!-- /Product thumb imgs -->

<!-- Product details -->
<div class="col-md-5">
<div class="product-details">
<h2 class="product-categore">   <%=rs1.getString(10) %> </h2>
<h2 class="product-name"> <%=rs1.getString(11) %> <%=rs1.getString(5) %>  <%=rs1.getString(3) %>   </h2>
<div>
<div class="product-rating">
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star-o"></i>
</div>
</div>
<div>
<h3 class="product-price">AF <%=rs1.getString(2) %></h3>
<span class="product-available">In Stock</span>
</div>
<p>محصول مورد نظر دارای کیفیت فوق العاده و صدایی با کیفیت و  گارانتی یک ساله میباشد و دارای زیبایی خاصی  میباشد</p>

<div class="add-to-cart">

<button class="add-to-cart-btn"><a href="AddToCartAction.jsp?product_ID=<%=rs1.getString(8) %>"><i class="fa fa-shopping-cart"></i> add to cart</a></button>
</div>

<ul class="product-btns">
<li><a href="wishlistAction.jsp?product_ID=<%=rs1.getString(8) %>"><i class="fa fa-heart-o"></i> add to wishlist</a></li>

</ul>





</div>
</div>
</div>
<!-- /row-->
</div>
<!-- /container -->
</div>
<!-- /section -->
<%} %>
<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <!-- Product main img -->
      
      <!-- Product tab -->
      <div class="col-md-12">
        <div id="product-tab">
          <!-- product tab nav -->
          <ul class="tab-nav">
            <li><a data-toggle="tab" href="#tab3">برای ارسال پیام انیجا را کلیک کنید</a></li>
          </ul>
          <!-- /product tab nav -->
          
          <!-- product tab content -->
          <div class="tab-content">
            
            <!-- tab3  -->
            <div id="tab3" class="tab-pane fade in">
              <div class="row">
                <!-- Reviews -->
                <div class="col-md-6">
                  <div id="reviews">
                    <ul class="reviews">
                      <%
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM  customer INNER JOIN message ON customer.customer_ID = message.customer_ID ;");
                        ResultSet rs2 = ps.executeQuery();
                        while(rs2.next()){
                      %>
                      <li>
                        <div class="review-heading">
                          <h5 class="name"><%=rs2.getString(3)%><%=" "%> <%=rs2.getString(4)%></h5>
                          <p class="date"><%=rs2.getString(14)%></p>
                          <div class="review-rating">
                            <%
                              int i = rs2.getInt(13);
                              int x = 0;
                              while (x < i){
                            %>
                            <i class="fa fa-star"></i>
                            <%
                              x++;
                            }
                            %>
                          </div>
                        </div>
                        <div class="review-body">
                          <p><%=rs2.getString(11)%></p>
                          <p><%=rs2.getString(12)%></p>
                        </div>
                      </li>
                      <%
                        }
                        ps.close();
                        rs2.close();
                      %>
                    </ul>
                    <ul class="reviews-pagination">
                      <li class="active">1</li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                  </div>
                </div>
                <!-- /Reviews -->
                
                <!-- Review Form -->
                <div class="col-md-3">
                  <div id="review-form">
                    <form class="review-form" action="message_action.jsp" method="post">	
                      <input class="input" name="subject" type="text" placeholder="عنوان موضوع">
                      <textarea class="input" name="body_message" placeholder="پیام شما"></textarea>
                      <div class="input-rating">
                        <span>Your Rating:</span>
                        <div class="stars">
                          <input id="star5" name="star" value="5" type="radio"><label for="star5"></label>
                          <input id="star4" name="star" value="4" type="radio"><label for="star4"></label>
                          <input id="star3" name="star" value="3" type="radio"><label for="star3"></label>
                          <input id="star2" name="star" value="2" type="radio"><label for="star2"></label>
                          <input id="star1" name="star" value="1" type="radio"><label for="star1"></label>
                        </div>
                      </div>
                      <button type="submit" class="primary-btn">Submit</button>
                    </form>
                  </div>
                </div>
                <!-- /Review Form -->
              </div>
            </div>
            <!-- /tab3  -->
          </div>
          <!-- /product tab content  -->
        </div>
      </div>
      <!-- /product tab -->
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /section -->


  <!-- NEWSLETTER -->
  <div id="newsletter" class="section">
   <!-- container -->
   <div class="container">
    <!-- row -->
    <div class="row">
     <div class="col-md-12">
      <div class="newsletter">
       <p>Sign Up for the <strong>NEWSLETTER</strong></p>
       <form>
        <input class="input" type="email" placeholder="Enter Your Email">
        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
       </form>
       <ul class="newsletter-follow">
        <li>
         <a href="#"><i class="fa fa-facebook"></i></a>
        </li>
        <li>
         <a href="#"><i class="fa fa-telegram"></i></a>
        </li>
        <li>
         <a href="#"><i class="fa fa-whatsapp"></i></a>
        </li>
       
       </ul>
      </div>
     </div>
    </div>
    <!-- /row -->
   </div>
   <!-- /container -->
  </div>
  <!-- /NEWSLETTER -->
  
  
                 <% 
                 
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
	
}
    
   
%>
  




    <%@ include file="footer.jsp" %>

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
