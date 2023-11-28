<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@page errorPage="error.jsp"  %>
<%@ page import="java.sql.*" 

import="project.ConnectionProvider"
%>
<% 
	String email=session.getAttribute("email").toString();
	String product_ID= request.getParameter("product_ID");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int customer_ID=0;
int z =0;
try {

Connection con=ConnectionProvider.getCon();


PreparedStatement ps=con.prepareStatement("SELECT * FROM product WHERE product_ID = ?");
ps.setString(1, product_ID);
ResultSet rs = ps.executeQuery();

while(rs.next()){
	product_price =rs.getInt(2);
	product_total=product_price;	

}
ps.close();
rs.close();



PreparedStatement ps1=con.prepareStatement("SELECT * FROM customer WHERE email = ?");
ps1.setString(1,email);
ResultSet rs1 = ps1.executeQuery();


while(rs1.next()){
customer_ID=rs1.getInt(1);
	
}


PreparedStatement ps2= con.prepareStatement( "SELECT * FROM product INNER JOIN cart INNER JOIN customer ON product.product_ID=cart.product_ID AND customer.customer_ID=cart.customer_ID WHERE customer.customer_ID=? AND product.product_ID=? AND cart.customer_ID=? AND cart.product_ID=?");
ps2.setInt(1, customer_ID);
ps2.setString(2, product_ID);
ps2.setInt(3, customer_ID);
ps2.setString(4, product_ID);
ResultSet rs2 = ps2.executeQuery();



while (rs1.next()){

cart_total=rs2.getInt(13);
cart_total=cart_total+product_total;
quantity=rs2.getInt(12);
quantity=quantity+1;
z=1;
}

if (z==1){
	

	PreparedStatement ps3 = con.prepareStatement("UPDATE customer INNER JOIN cart ON customer.customer_ID = cart.customer_ID INNER JOIN product ON cart.product_ID = product.product_ID SET cart.total_price_cart=?, quantity_cart=? WHERE customer.customer_ID=? AND product.product_ID=? AND cart.customer_ID=? AND cart.product_ID=?");
	ps3.setInt(1, cart_total);
	ps3.setInt(2, quantity);
	ps3.setInt(3, customer_ID);
	ps3.setString(4, product_ID);
	ps3.setInt(5, customer_ID);
	ps3.setString(6, product_ID);
	ps3.executeUpdate();
	response.sendRedirect("index.jsp");
	
	if (ps3 != null) {
	    try {
	        ps3.close();
	    } catch (SQLException e) {
	    	System.out.print(e);
	    }
	}
	
}



if(z==0){

	PreparedStatement ps4=con.prepareStatement("INSERT INTO cart(product_ID,customer_ID,quantity_cart,total_price_cart,orderDate,deliveryDate) values (?,?,?,?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY));");
	
	ps4.setString(1,product_ID);
ps4.setInt(2,customer_ID);	
ps4.setInt(3,quantity);
ps4.setInt(4,product_total);
ps4.executeUpdate();
response.sendRedirect("index.jsp?msg=added");

if (ps4 != null) {
    try {
        ps4.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}




}

if (ps2 != null) {
    try {
        ps2.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}if (rs2 != null) {
    try {
        rs2.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}



ps1.close();
rs1.close();

if (con != null) {
	try {
	      con.close();
	  } catch (SQLException e) {
	  	System.out.print(e);
	  }
}

}


catch(Exception e){
System.out.print(e);
response.sendRedirect("error.jsp?msg=invalid");

}



%>