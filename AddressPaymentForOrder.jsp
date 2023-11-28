
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>


<!DOCTYPE >

	<head>
	<script>
	
	if(window.history.forward(1) !=null){
	window.history.forward(1);
	}
	
	
	
	</script>
	
	</head>
	
	
	<body>

	<%
	int cart_ID;
	Object cartIDObj = session.getAttribute("cart_ID");
	if (cartIDObj != null) {
		cart_ID = (int) cartIDObj;
	} else {

		cart_ID = 0;
	}
	
	

	int total=0;
	int sno=0;
	int customer_ID=0;
	 try{

		 Connection con=ConnectionProvider.getCon();
	
	




		 
		 





PreparedStatement ps1 = con.prepareStatement("SELECT SUM(total_price_cart) FROM product INNER JOIN cart  ON product.product_ID = cart.product_ID where cart.cart_ID=? ");
ps1.setInt(1,cart_ID);
ResultSet rs1 = ps1.executeQuery();

while (rs1.next()){
	total=rs1.getInt(1);
}


if (rs1 != null) {
      try {
          rs1.close();
      } catch (SQLException e) {
      	System.out.print(e);
 
      }
  }

  if (ps1 != null) {
      try {
          ps1.close();
      } catch (SQLException e) {
      	System.out.print(e);
      }
  }
		 
		 
		 
		 
	%>
	
	
	
	
			<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">آدرس ارسال محصول</h3>
							</div>
							
							
							
							
						<!-- product_address -->
						<form  action="AddressPaymentForOrderAction.jsp" method="post">
						<div class="form-group">
								<input class="input" name="customer_country" placeholder="کشورتان را  وارد  کنید"  type="text"  required >
							</div>
							<div class="form-group">
								<input class="input" type="text"  name="customer_city" placeholder="شهر تان را وارد کنید"   required>
								
							</div>
							
							<div class="form-group">
								<input class="input" type="tel" name="customer_phone"  value=""  placeholder=" شماره تلفن خود را وارد کنید" required>
							</div>
				
						<div class="product_address">
							<textarea class="input" name="customer_address"     placeholder="آدرس  خود را  بنویسید" required></textarea>
						</div>
						
							
						<br>
								<br>
									<br>
						<div class="payment-method">
						<h3 class="title">نحوه پرداخت </h3>
								<br>
							
							<div class="input-radio">
								<input type="radio" value="cash_shopping"  name="payment_method"  id="payment-1">
								<label for="payment-1">
									<span></span>
									پول نقد
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" value="shop" name="payment_method" id="payment-2">
								<label for="payment-2">
									<span></span>
									از طریق صرافی
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input  type="radio"  value="online_payment" name="payment_method"  id="payment-3">
								<label for="payment-3">
									<span></span>
									از طریق بانک
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								
								<br>
								<input class="input" type="tel"   name="transaction_ID" placeholder="transaction ID">
			</div>
							
								</div>
							</div>
							
							<br>
								<br>
								<br>
								
								
								<h1 style="display:inline;color:#99C218;"><input  name="amoung_payment"  value="<%out.print(total); %>" readonly ></h1>
							
								<div style="display:inline;"><h1 style="display:inline;">مجموعه پول </h1></div>
							

					
								
								<br>
								<br>
							<button class="primary-btn order-submit" type="submit" > پرذاخت پول و ذخیره پرداخت  <i class="far fa-arrow-alt-circte-right"></i></button>
							
							</form>
						
						
						
							
						
							
						</div>
						</div>
						
						<!-- /Billing Details -->						
				




					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">سفارش شما</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>محصولات</strong></div>
								<div><strong>قیمت محصول</strong></div>
							</div>
							
							
 
							
							
							<div class="order-products">
							
							
							  <% 
							  PreparedStatement ps5 = con.prepareStatement("SELECT * FROM product INNER JOIN cart  ON product.product_ID = cart.product_ID where cart.cart_ID=?  ");
							   ps5.setInt(1,cart_ID);
							    ResultSet rs5 = ps5.executeQuery();
								  
								  while(rs5.next()){
								
    %>
   					 
								<div class="order-col">
							
									<div><%=rs5.getString(1) %>/<%=rs5.getString(3)%>/ <%=rs5.getString(4)%>/ <%=rs5.getString(4)%>   </div>
									<div><%=rs5.getString(12) %>x <%=rs5.getString(2) %></div>
								
								</div>
									<%} %>
							</div>
							
							
							
							
							
							<div class="order-col">
								<div>  انتقال محصول</div>
								<div><strong>رایگان</strong></div>
							</div>
	 			<% while(rs5.next()){ %>
	 			<div class="order-col">
								<div>  تاریخ امروز</div>
								<div><%= rs5.getDate(14) %></div>
							</div>
	 				
								<div class="order-col">
								<div>  تاریخ تحویل محصول</div>
								<div><%=rs5.getDate(15) %></div>
							</div>
	 				
		 	
		 	<%break;} 
		 	

						   
						       
						        if (con != null) {
						        	try {
						      	      con.close();
						      	  } catch (SQLException e) {
						      	  	System.out.print(e);
						      	  }
						        }
		 	
		 	%>
							<div class="order-col">
							
								<div><strong>مجموعه پول</strong></div>
								<div><strong class="order-total"><%out.print(total); %></strong></div>
							</div>
					
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								I've read and accept the <a href="#">terms & conditions</a>
							</label>
						</div>
						
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
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
		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>




    <% 
    
   
	 }
catch(Exception e)  {
System.out.print(e);

}
 %>   



	</body>
</html>










 <%@ include file="footer.jsp" %>