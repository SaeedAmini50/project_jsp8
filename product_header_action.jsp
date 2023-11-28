<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<%
String product_ID = request.getParameter("product_ID");
String product_name = null;
String product_price = null;
String product_size = null;
String product_attribute = null;
String product_mark = null;
String product_photo = null;
String category_name = null;


try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM product WHERE product_ID=?");
    ps.setString(1, product_ID);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        product_name = rs.getString("product_name");
        product_price = rs.getString("product_price");
        product_size = rs.getString("product_size");
        product_attribute = rs.getString("product_attribute");
        product_mark = rs.getString("product_mark");
        product_photo = rs.getString("product_photo");
        category_name = rs.getString("category_name");
        
    }

    PreparedStatement ps1 = con.prepareStatement("INSERT INTO product_best (product_ID,product_name, product_price, product_size, product_attribute, product_mark, product_photo,category_name) VALUES (?,?, ?, ?, ?, ?, ?,?)");
    ps1.setString(1, product_ID);
    ps1.setString(2, product_name);
    ps1.setString(3, product_price);
    ps1.setString(4, product_size);
    ps1.setString(5, product_attribute);
    ps1.setString(6, product_mark);
    ps1.setString(7, product_photo);
    ps1.setString(8, category_name);
    ps1.executeUpdate();

    ps1.close();
    ps.close();
    rs.close();

    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
    response.sendRedirect("index.jsp");
} catch (Exception e) {
    System.out.print(e);
}
%>