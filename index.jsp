<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
 <%@ page import="java.util.ArrayList" %>
    
     
    
    <!DOCTYPE html>
<html lang="en">

<body>





<%





String msg = request.getParameter("msg");
if("added".equals(msg)){
%>
d<h1>
product added seuccessfully!
</h1>

<%} %>
<%
if ("exist".equals(msg)){%>

<h1>
product already exist in you cart! Quantity increased!
</h1>
<%} %>
<%
if ("invalid".equals(msg)){%>
<h1>
Some thing went wrong !Try Again!
</h1>


<%} %>

  <% 
  
  
  try{
		
Connection con=ConnectionProvider.getCon();


%>



<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<div class="col-md-12">
<div class="section-title">
<div class="section-nav">
<ul class="section-tab-nav tab-nav">
<h1><li class="active"><a  name="NEW"data-toggle="tab" href="#tab2">محصولات جدید</a></li></h1>

</ul>
</div>
</div>
</div>

          <%
     
          
          
          PreparedStatement pss = con.prepareStatement("SELECT p1.* FROM product_best p1 JOIN ( SELECT product_best_ID FROM product_best ORDER BY product_best_ID DESC LIMIT 3 ) p2 ON p1.product_best_ID = p2.product_best_ID;");
          ResultSet rss = pss.executeQuery();

          while (rss.next()) {
              %>

              <!-- shop -->
              <div class="col-md-4 col-xs-6">
                  <div class="shop">
                      <div class="shop-img">
                          <img src="./img/<%= rss.getString(7) %>" alt="">
                      </div>
                      <div class="shop-body">
                          <h3><%= rss.getString(2) %><br> AF<%= rss.getString(3) %></h3>
                          <a href="product.jsp?product_ID=<%=rss.getString(1) %>" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                      </div>
                  </div>
              </div>
              <!-- /shop -->

              <%
          }
  

%>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->
</div>





<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">

<!-- section title -->
<div class="col-md-12">
<div class="section-title">

<div class="section-nav">
<ul class="section-tab-nav tab-nav">
<h1><li class="active"><a name="TV" data-toggle="tab" href="storeTV.jsp">تلویزیون</a></li></h1>

</ul>
</div>
</div>
</div>
<!-- /section title -->

<!-- Products tab & slick -->
<div class="col-md-12">
<div class="row">
<div class="products-tabs">
<!-- tab -->
<div id="tab1" class="tab-pane active">
<div class="products-slick" data-nav="#slick-nav-1">




<%
String category = "TV";
String query = "";
PreparedStatement pst = con.prepareStatement("SELECT * FROM product INNER JOIN product_category ON product.category_name = product_category.category_name WHERE product.category_name = ?");
pst.setString(1, category);
ResultSet rsr = pst.executeQuery();
while(rsr.next()){%>
 <!-- product -->
       <div class="col-md-4 col-xs-6">
        <div class="product">
         <div class="product-img">
          <img src="./img/<%=rsr.getString(6) %> " alt=""> </div>
         <div class="product-body">
          <p class="product-category"> <%=rsr.getString(11) %> </p>
          <h3 class="product-name"><a href="#"><%=rsr.getString(5) %> <span style="color:red"><%=rsr.getString(3) %> </span>  </a></h3>
          <h4 class="product-price">AF <%=rsr.getString(2) %> </h4>
          <label class="hidden"><%=rsr.getString(8) %></label>
          <div class="product-rating">
           <i class="fa fa-star"></i>
           <i class="fa
            fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star-o"></i>
          </div>
          <div class="product-btns">
           <button class="add-to-wishlist"><a href="wishlistAction.jsp?product_ID=<%=rsr.getString(8) %>"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
           <button class="quick-view"><a href="product.jsp?product_ID=<%=rsr.getString(8) %>"><i class="fa fa-eye"></i></a><span class="tooltipp">quick view</span></button>
          </div>
         </div>
         <div class="add-to-cart">
          <button class="add-to-cart-btn"><a href="AddToCartAction.jsp?product_ID=<%=rsr.getString(8) %>"><i class="fa fa-shopping-cart"></i> add to cart</a></button>
         </div>
        </div>
       </div>
       <!-- /product -->
<%} %>





</div>
<div id="slick-nav-1" class="products-slick-nav"></div>
</div>
<!-- /tab -->
</div>
</div>
</div>
<!-- Products tab & slick -->
</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->
  
    <!-- HOT DEAL SECTION -->
    <div id="hot-deal" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="hot-deal">
              <ul class="hot-deal-countdown">
                <li>
                  <div>
                    <h3>02</h3>
                    <span>Days</span>
                  </div>
                </li>
                <li>
                  <div>
                    <h3>10</h3>
                    <span>Hours</span>
                  </div>
                </li>
                <li>
                  <div>
                    <h3>34</h3>
                    <span>Mins</span>
                  </div>
                </li>
                <li>
                  <div>
                    <h3>60</h3>
                    <span>Secs</span>
                  </div>
                </li>
              </ul>
              <h2 class="text-uppercase">hot deal this week</h2>
              <p>New Collection Up to 50% OFF</p>
              <a class="primary-btn cta-btn" href="#">Shop now</a>
            </div>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /HOT DEAL SECTION -->



<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">

<!-- section title -->
<div class="col-md-12">
<div class="section-title">
<div class="section-nav">
<ul class="section-tab-nav tab-nav">
<h1><li class="active"><a  name="MACHINE" data-toggle="tab" href="#tab2">لباسشویی</a></li></h1>

</ul>
</div>
</div>
</div>
<!-- /section title -->

<!-- Products tab & slick -->
<div class="col-md-12">
<div class="row">
<div class="products-tabs">
<!-- tab -->
<div id="tab2" class="tab-pane fade in active">
<div class="products-slick" data-nav="#slick-nav-2">


  <% 
 	

  String category2 = "MACHIN";

  PreparedStatement pst2 = con.prepareStatement("SELECT * FROM product INNER JOIN product_category ON product.category_name = product_category.category_name WHERE product.category_name = ?");
  pst2.setString(1, category2);
		
  ResultSet rs1 = pst2.executeQuery();

while(rs1.next()){%>
                
             <!-- product -->
       <div class="col-md-4 col-xs-6">
        <div class="product">
         <div class="product-img">
          <img src="./img/<%=rs1.getString(6) %> " alt="">
         </div>
         <div class="product-body">
          <p class="product-category"> <%=rs1.getString(11) %> </p>
          <h3 class="product-name"><a href="#"><%=rs1.getString(5) %> <span style="color:red"><%=rs1.getString(3) %> </span>  </a></h3>
          <h4 class="product-price">AF <%=rs1.getString(2) %> </h4>
          <label class="hidden"><%=rs1.getString(8) %></label>
          <div class="product-rating">
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star-o"></i>
          </div>
          <div class="product-btns">
           <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
           <button class="quick-view"><a href="product.jsp?product_ID=<%=rs1.getString(8) %>"><i class="fa fa-eye"></i></a><span class="tooltipp">quick view</span></button>
          </div>
         </div>
         <div class="add-to-cart">
          <button class="add-to-cart-btn"><a href="AddToCartAction.jsp?product_ID=<%=rs1.getString(8) %>"><i class="fa fa-shopping-cart"></i> add to cart</a></button>
         </div>
        </div>
       </div>
       <!-- /product -->
<% }


%>






</div>
<div id="slick-nav-2" class="products-slick-nav"></div>
</div>
<!-- /tab -->
</div>
</div>
</div>
<!-- /Products tab & slick -->
</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->


<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<div class="col-md-4 col-xs-6">
<div class="section-title">
<h4 class="title">تمام محصولات</h4>
<div class="section-nav">
<div id="slick-nav-3" class="products-slick-nav"></div>
</div>
</div>

<div class="products-widget-slick" data-nav="#slick-nav-3">
<div>
<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- product widget -->
</div>

<div>
<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>

<!-- product widget -->
</div>
</div>
</div>

<div class="col-md-4 col-xs-6">
<div class="section-title">
<h4 class="title">تمام محصولات</h4>
<div class="section-nav">
<div id="slick-nav-4" class="products-slick-nav"></div>
</div>
</div>

<div class="products-widget-slick" data-nav="#slick-nav-4">
<div>
<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- product widget -->
</div>

<div>
<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- product widget -->
</div>
</div>
</div>

<div class="clearfix visible-sm visible-xs"></div>

<div class="col-md-4 col-xs-6">
<div class="section-title">
<h4 class="title">تمام محصولات</h4>
<div class="section-nav">
<div id="slick-nav-5" class="products-slick-nav"></div>
</div>
</div>

<div class="products-widget-slick" data-nav="#slick-nav-5">
<div>
<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- product widget -->
</div>

<div>
<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">philips</p>
<h3 class="product-name"><a href="storeTV.html">TV</a></h3>

</div>
</div>
<!-- /product widget -->

<!-- product widget -->
<div class="product-widget">
<div class="product-img">
<img src="./img/machin6.webp" alt="">
</div>
<div class="product-body">
<p class="product-sumsong">sumsong</p>
<h3 class="product-name"><a href="storemachin.html">WASHIMG MACHINE</a></h3>

</div>
</div>
<!-- product widget -->
</div>
</div>
</div>

</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->







<!-- NEWSLETTER -->
<div id="newsletter" class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<div class="col-md-12">
<div class="newsletter">
<p>میتوانید از طریق ایمیل یا دیگر اپلیکشن های  پایین با ما در ارتباط باشید</p>
<form>
<input class="input" type="email" placeholder="لطفا ایمیل خود را وارد کنید">
<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
</form>
<ul class="newsletter-follow">
<li>
<h1><a href=".https://web.telegram.org/k/#@yaqubkhanyusofi"><i class="fa fa-facebook"></i></a></h1>
</li>
<li>
<h1><a href="https://chat.whatsapp.com/JVn9W7CZE3n2owlVResuEP"><i class="fa fa-whatsapp"></i></a></h1>
</li>
<li>
<h1><a href=".https://web.telegram.org/k/#@yaqubkhanyusofi"><i class="fa fa-telegram"></i></a></h1>
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
<!-- google map -->


<!-- NEWSLETTER -->
<div id="newsletter" class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<div class="col-md-12">
<div class="card" id="iframe_map" style="display:block"  >

<div class="card-title"><a name="location"></a>
<i class="fa fa-map-marker" style="color:red;" ></i><h4 style="display:inline;">موقعیت دوکان</h4>
</div>
<div class="card-text"><p align="center">موقعیت دوکان بین چهار راهی گل سرخ و چهار راهی پروژه تایمنی</p></div>
<div class="card-stats"  >
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3286.7640835595607!2d69.11680067454307!3d34.53420459213017!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38d16f6afc431847%3A0x9d6ecd20d2a495ed!2sPolytechnic%20University!5e0!3m2!1sen!2s!4v1692116283750!5m2!1sen!2s" width="1400" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>
</div>
</div>
</div>
<!-- row-->
</div>
<!-- container-->
</div>

<!-- section -->
    <%@ include file="footer.jsp" %>

                 <%  
  }
                            
catch(Exception e)  {
	System.out.print(e);
	
}
%>

</body>
</html>
    