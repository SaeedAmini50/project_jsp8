<%@ page import="java.sql.*" 
import="project.ConnectionProvider"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
 <%
 String email=session.getAttribute("email").toString();
 String message_subject=request.getParameter("subject");
 String body_message=request.getParameter("body_message");
 String star=request.getParameter("star");
 int  customer_ID=0;

 
 

 try {Connection con = ConnectionProvider.getCon();
 
 PreparedStatement ps=con.prepareStatement("SELECT * FROM customer WHERE email = ?");
 ps.setString(1, email);
 ResultSet rs = ps.executeQuery();
 while(rs.next()){
	 customer_ID=rs.getInt(1);
	 }
	
 
 
 PreparedStatement ps1 = con.prepareStatement(" INSERT INTO message (customer_ID,subject,body_message,star,message_date) VALUES(?,?,?,?,NOW());");
	ps1.setInt(1,customer_ID);
	ps1.setString(2,message_subject);
	ps1.setString(3,body_message);
	ps1.setString(4,star);
	ps1.executeUpdate();

	ps.close();
	rs.close();
	ps1.close();
	con.close();
	response.sendRedirect("product.jsp");
 }
 
catch(Exception e){System.out.print(e);}
 %>
 