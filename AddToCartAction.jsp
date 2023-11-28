<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.sql.*" import="project.ConnectionProvider"%>
<%@ page import="java.util.ArrayList"%>
<%
int cart_ID;
Object cartIDObj = session.getAttribute("cart_ID");
if (cartIDObj != null) {
	cart_ID = (int) cartIDObj;
} else {

	cart_ID = 0;
}

String product_ID = request.getParameter("product_ID");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;
int chackID = 0;
int chackID2 = 0;
int updateChack=0;
try {
	Connection con = ConnectionProvider.getCon();
	ResultSet rs;
	PreparedStatement ps;

	ps = con.prepareStatement("select * from product where product_ID=?");
	ps.setString(1, product_ID);
	rs = ps.executeQuery();

	while (rs.next()) {
		product_price = rs.getInt(2);
		product_total = product_price;

	}
	PreparedStatement ps1 = con.prepareStatement("select max(cart_ID) from cart;");
	ResultSet rs1 = ps1.executeQuery();
	if (rs1.next()) {
		chackID = rs1.getInt(1);
		chackID2 = chackID;
		chackID = chackID + 1;
	}

	
		if (chackID2 == cart_ID) {
			System.out.print("3");
			PreparedStatement ps2 = con.prepareStatement("SELECT * FROM product INNER JOIN cart  ON product.product_ID = cart.product_ID where cart.cart_ID=? and cart.product_ID=?");

			ps2.setInt(1, cart_ID);
			ps2.setString(2, product_ID);
			ResultSet rs2 = ps2.executeQuery();

			while (rs2.next()) {
				updateChack=rs2.getInt(13);
				cart_total = rs2.getInt(13);
				cart_total = cart_total + product_total;
				quantity = rs2.getInt(12);
				quantity = quantity + 1;

			}			
			

	PreparedStatement ps3 = con.prepareStatement(
			"UPDATE  cart  INNER JOIN product ON cart.product_ID = product.product_ID SET cart.total_price_cart=?, cart.quantity_cart=? WHERE   cart.cart_ID=? and cart.product_ID=? ");
	ps3.setInt(1, cart_total);
	ps3.setInt(2, quantity);
	ps3.setInt(3,cart_ID );
	ps3.setString(4,product_ID );
	int rowsAffected = ps3.executeUpdate(); // اجرای دستور UPDATE و دریافت تعداد ردیف‌های تحت تأثیر
    if (rowsAffected > 0) {
		session.setAttribute("cart_ID", cart_ID);
		response.sendRedirect("index.jsp?msg=added");
     
    } else {
    	
		PreparedStatement ps5 = con.prepareStatement(
				"INSERT INTO cart(cart_ID,product_ID,quantity_cart,total_price_cart,orderDate,deliveryDate) values (?,?,?,?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY));");
		ps5.setInt(1, cart_ID);
		ps5.setString(2, product_ID);
		ps5.setInt(3, quantity);
		ps5.setInt(4, product_total);
		ps5.executeUpdate();

		session.setAttribute("cart_ID", cart_ID);
		response.sendRedirect("index.jsp?msg=added");
	 }
	
		
		}
		else{
	 if (cart_ID == 0) {
		cart_ID = chackID;
		PreparedStatement ps4 = con.prepareStatement(
		"INSERT INTO cart(cart_ID,product_ID,quantity_cart,total_price_cart,orderDate,deliveryDate) values (?,?,?,?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY));");
		ps4.setInt(1, cart_ID);
		ps4.setString(2, product_ID);
		ps4.setInt(3, quantity);
		ps4.setInt(4, product_total);
		ps4.executeUpdate();


		session.setAttribute("cart_ID", cart_ID);
		response.sendRedirect("index.jsp?msg=added");

	}
		
	else {
		response.sendRedirect("index.jsp?msg=invaled");
	}
		}
		
		
} catch (Exception e) {
	System.out.print(e);
}
%>