<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%

String product_name=request.getParameter("product_name");
String product_price=request.getParameter("product_price ");
String product_size=request.getParameter("product_size");
String product_attribute=request.getParameter("product_attribute");
String product_mark=request.getParameter("product_mark ");
String product_benefit=request.getParameter("product_benefit");
String product_photo=request.getParameter("product_photo");
String product_active=request.getParameter("product_active");
String category_name=request.getParameter("category_name");
try{		
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("INSERT INTO product (product_name,product_price,product_size,product_attribute,product_mark,product_photo,product_active,product_benefit,category_name) values(?,?,?,?,?,?,?,?,?);");
ps.setString(1,product_name);
ps.setString(2,product_price);
ps.setString(3,product_size);
ps.setString(4,product_attribute);
ps.setString(5,product_mark);
ps.setString(6,product_photo);
ps.setString(7,product_active);
ps.setString(8,product_benefit);
ps.setString(9,category_name);
ps.executeUpdate();
ps.close();
con.close();
response.sendRedirect("create_product.jsp?msg=valid");
}
catch(Exception e){
System.out.print(e);
response.sendRedirect("create_product.jsp?msg=invalid");}
%>
