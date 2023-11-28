<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%String email=session.getAttribute("email").toString();
String customer_name=request.getParameter("customer_name");
String customer_last_name=request.getParameter("customer_last_name");
String Security_Question=request.getParameter("Security_Question");
String customer_answer=request.getParameter("answer");
String password=request.getParameter("password");
try{Connection con = ConnectionProvider.getCon();
String passwordHash = "";
//Hash 
String queryHash = "SELECT SHA2(?, 256) AS password_hash";
PreparedStatement ps1 = con.prepareStatement(queryHash);
ps1.setString(1, password);
ResultSet rs1 = ps1.executeQuery();
if (rs1.next()) {passwordHash = rs1.getString("password_hash");}
PreparedStatement ps=con.prepareStatement("update customer set customer_name=?,customer_last_name=?,Security_Question=?,answer=?,password=?  where email=?;");
ps.setString(1,customer_name);
ps.setString(2,customer_last_name);
ps.setString(3,Security_Question);
ps.setString(4,customer_answer);
ps.setString(5,passwordHash);
ps.setString(6,email);
ps.executeUpdate();
ps.close();ps1.close();rs1.close();con.close();
response.sendRedirect("profile_customer.jsp?msg=done");}
catch(Exception e){response.sendRedirect("errer.jsp?msg=invalid");
	System.out.println(e);}%>
