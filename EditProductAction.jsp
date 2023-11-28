<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<% 
String product_name=request.getParameter("product_name");
String product_price=request.getParameter("product_price");
String product_attribute=request.getParameter("product_size");
String product_size=request.getParameter("product_attribute");
String product_mark=request.getParameter("product_mark");
String product_photo=request.getParameter("product_photo");
String product_benefit=request.getParameter("product_benefit");
String product_active=request.getParameter("product_active");
String product_ID=request.getParameter("product_ID");
try{Connection con = ConnectionProvider.getCon();
String query = "UPDATE product SET product_name=?, product_price=?, product_attribute=?, product_size=?,product_mark=?, product_photo=?, product_benefit=?, product_active=? WHERE product_ID=?";
PreparedStatement pst = con.prepareStatement(query);
pst.setString(1, product_name);
pst.setString(2, product_price);
pst.setString(3, product_attribute);
pst.setString(4, product_size);
pst.setString(5, product_mark);
pst.setString(6, product_photo);
pst.setString(7, product_benefit);
pst.setString(8, product_active);
pst.setString(9, product_ID);
pst.executeUpdate();
pst.close();
con.close();
response.sendRedirect("showAllProduct.jsp?msg=done");}

catch(Exception e){
	response.sendRedirect("errer.jsp?msg=invalid");
	System.out.println(e);
}

 %>