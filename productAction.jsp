<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%
String product_name=request.getParameter("product_name");
String category_name=request.getParameter("category_name");
String product_price=request.getParameter("product_price");
String product_attribute=request.getParameter("product_attribute");
String product_attribute2=request.getParameter("product_attribute2");
String product_mark=request.getParameter("product_mark");
String product_photo=request.getParameter("product_photo");
String product_benefit=request.getParameter("product_benefit");


try{


Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("INSERT INTO product (product_name,category_name,product_price,product_attribute,product_attribute2,product_mark,product_photo,product_benefit) VALUES(?,?,?,?,?,?,?,?);");
ps.setString(1,product_name);
ps.setString(2,category_name);
ps.setString(3,product_price);
ps.setString(4,product_attribute);
ps.setString(5,product_attribute2);
ps.setString(6,product_mark);
ps.setString(7,product_photo);
ps.setString(8,product_benefit);
ps.executeUpdate();


if (ps != null) {
    try {
        ps.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
if (con != null) {
	try {
	      con.close();
	  } catch (SQLException e) {
	  	System.out.print(e);
	  }
}


response.sendRedirect("EditProduct.jsp?msg=product");
}


catch(Exception e)  {
System.out.print(e);

} 	


%>