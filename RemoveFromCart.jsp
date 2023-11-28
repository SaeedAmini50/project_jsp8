<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%
String product_ID=request.getParameter("product_ID");


int cart_ID;
Object cartIDObj = session.getAttribute("cart_ID");
if (cartIDObj != null) {
	cart_ID = (int) cartIDObj;
} else {

	cart_ID = 0;
}
try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("DELETE FROM cart WHERE cart_ID = ? and product_ID=?");
	pst.setInt(1, cart_ID);
	pst.setString(2, product_ID);
	 pst.executeUpdate();
	 

	 
	 if (pst!= null) {
		 try { pst.close();}
	 catch (SQLException e) {System.out.print(e);}}
	 
	 
	 if (con != null) {try {
			      con.close(); }
	 catch (SQLException e) {System.out.print(e); }}
	 
	 
		response.sendRedirect("myCart.jsp?msg=removed");  }
catch(Exception e)  {System.out.print(e);}
%>