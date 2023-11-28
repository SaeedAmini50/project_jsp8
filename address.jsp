

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">
	<head>
	<script>
	if(window.history.forwart(1) !=null){
	window.history.forword(1);
	}
	
	
	</script>
	    </head>
	<body>
		<!-- HEADER -->
		<%@ include file="header.jsp" %>
				<!-- /HEADER -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Billing address</h3>
						<ul class="breadcrumb-tree">
							
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->


	<%
	String customer_email=session.getAttribute("email").toString();
	int total=0;
	int sno=0;
	 try{

		 Connection con=ConnectionProvider.getCon();
		 Statement st=con.createStatement();
	
		 
	%>
	
	
	
	<%
	ResultSet rs2=st.executeQuery("select * from customer where email='"+customer_email+"'");
	while(rs2.next()){
	
	
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
								<h3 class="title">Billing address</h3>
							</div>
							
								<form  action="AddressPaymentForOrderAction.jsp" method="post">
					
					<div class="form-group">
								<input class="input" name="product_country"  type="text" value=" <%=rs2.getString(4) %>" required >
							</div>
							<div class="form-group">
								<input class="input" type="text" value="<%=rs2.getString(3) %>"  name="city" placeholder="شهر"   required>
								
							</div>
							
							<div class="form-group">
								<input class="input" type="tel" name="product_phone"  value="<%=rs2.getString(1) %>"  placeholder="شماره تلفن" required>
							</div>
				
						<div class="product_address">
							<textarea class="input" name="product_address"     placeholder="آدرس  خود را  بنویسید" required><%=rs2.getString(10) %></textarea>
						</div>
				
					<h3 class="title">نحوه پرداخت </h3>
								<br>
							
							<div class="input-radio">
								<input type="radio" value="cash_shopping"  name="paymentMethod"  id="payment-1">
								<label for="payment-1">
									<span></span>
									پول نقد
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" value="shop" name="paymentMethod" id="payment-2">
								<label for="payment-2">
									<span></span>
									از طریق صرافی
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input  type="radio"  value="online_payment" name="paymentMethod"  id="payment-3">
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
					
					
							<br>
								<br>
								<br>
							<button class="primary-btn order-submit" type="submit" > پرذاخت پول و ذخیره پرداخت  <i class="far fa-arrow-alt-circte-right"></i></button>
							
					
					
						</form>
							<%} %>
						
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="create-account">
									<label for="create-account">
										<span></span>
										Create Account?
									</label>
									<div class="caption">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
										<input class="input" type="password" name="password" placeholder="Enter Your Password">
									</div>
								</div>
							</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">سفارش شما</h3>
							</div>
							
							
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address">
								<label for="shiping-address">
									<span></span>
									Ship to a diffrent address?
								</label>
								<div class="caption">
									<div class="form-group">
										<input class="input" type="text" name="first-name" placeholder="First Name">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="last-name" placeholder="Last Name">
									</div>
									<div class="form-group">
										<input class="input" type="email" name="email" placeholder="Email">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="address" placeholder="Address">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="city" placeholder="City">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="country" placeholder="Country">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="zip-code" placeholder="ZIP Code">
									</div>
									<div class="form-group">
										<input class="input" type="tel" name="tel" placeholder="Telephone">
									</div>
								</div>
							</div>
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input" placeholder="Order Notes"></textarea>
						</div>
						<!-- /Order notes -->
					</div>


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
    ResultSet rs=st.executeQuery("select * from product;");
   while(rs.next()){
	  
    
    %>
								<div class="order-col">
									<div><%=rs.getString(3) %>x<%=rs.getString(1)%>   </div>
									<div><%=rs.getString(3) %>x <%=rs.getString(3) %></div>
								</div>
								<%} %>
							</div>
							
							
							
							
							
							<div class="order-col">
								<div>  انتقال محصول</div>
								<div><strong>رایگان</strong></div>
							</div>
							<% 
								 ResultSet rs1=st.executeQuery("select * from cart ;");
		 while (rs1.next()){
		 	total=rs1.getInt(1);
		 	%>
		 	
							<div class="order-col">
							
								<div><strong>مجموعه پول</strong></div>
								<div><strong class="order-total"><%out.print(total); %></strong></div>
							</div>
							<%} %>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								I've read and accept the <a href="#">terms & conditions</a>
							</label>
						</div>
						<a href="#" class="primary-btn order-submit">Place order</a>
					</div>
					<!-- /Order Details -->
					
					
									</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

    <% 
    
   
	 }
catch(Exception e)  {
System.out.print(e);

}
 %>   

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
									<a href="#"><i class="fa fa-whatsapp"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-telegram"></i></a>
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

		<!-- FOOTER -->
<%@ include file="footer.jsp" %>
	<!--/ FOOTER -->
		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>

	</body>
</html>
