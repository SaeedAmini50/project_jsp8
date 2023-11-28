<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%

String admin_email=session.getAttribute("admin_email").toString(); 
String admin_name=request.getParameter("admin_name");
String admin_last_name=request.getParameter("admin_last_name");
String Security_Question=request.getParameter("Security_Question");
String admin_answer=request.getParameter("answer");
String admin_phone =request.getParameter("admin_phone");
String password=request.getParameter("password");
try{
	

Connection con = ConnectionProvider.getCon();
String passwordHash = "";
// Hash 
String queryHash = "SELECT SHA2(?, 256) AS password_hash";
PreparedStatement ps1 = con.prepareStatement(queryHash);
ps1.setString(1, password);
ResultSet rs1 = ps1.executeQuery();

if (rs1.next()) {
    passwordHash = rs1.getString("password_hash");
}


PreparedStatement ps=con.prepareStatement("update admin set admin_name=?,admin_last_name=?,Security_Question=?,answer=?,admin_phone=?,password=? where email=?;");
ps.setString(1,admin_name);
ps.setString(2,admin_last_name);
ps.setString(3,Security_Question);
ps.setString(4,admin_answer);
ps.setString(5,admin_phone);
ps.setString(6,passwordHash);
ps.setString(7,admin_email);
ps.executeUpdate();

if (ps != null) {
    try {
        ps.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}

if (ps1 != null) {
    try {
        ps1.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}

if (rs1 != null) {
    try {
        rs1.close();
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

response.sendRedirect("profile_admin.jsp?msg=done");
}
catch(Exception e){
System.out.println(e);
}

%>
