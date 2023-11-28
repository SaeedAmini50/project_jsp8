<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@page import ="java.security.MessageDigest"%>
<%@page import="java.util.Base64"%>


<%
String customer_name=request.getParameter("customer_name");
String customer_last_name=request.getParameter("customer_last_name");
String customer_email=request.getParameter("email");
String Security_Question=request.getParameter("Security_Question");
String customer_answer=request.getParameter("answer");
String customer_password=request.getParameter("password");
String customer_password2=request.getParameter("customer_password2");
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement ps = null;
PreparedStatement ps1 = null;
ResultSet rs1 = null;
try{if (customer_password.equals(customer_password2)){	
con = ConnectionProvider.getCon();
String passwordHash = "";
// Hash the password using SHA-2
String queryHash = "SELECT SHA2(?, 256) AS password_hash";
 ps1 = con.prepareStatement(queryHash);
ps1.setString(1, customer_password);
 rs1 = ps1.executeQuery();
if (rs1.next()) {
    passwordHash = rs1.getString("password_hash");
}
 ps = con.prepareStatement("INSERT INTO customer (customer_name, customer_last_name, email, Security_Question, answer, password, customer_date) VALUES (?, ?, ?, ?, ?, ?, NOW())");
ps.setString(1, customer_name);
ps.setString(2, customer_last_name);
ps.setString(3, customer_email);
ps.setString(4, Security_Question);
ps.setString(5, customer_answer);
ps.setString(6, passwordHash);
ps.executeUpdate();




 pstmt = con.prepareStatement("SELECT * FROM customer WHERE email=? AND password=? AND customer_name=? AND customer_last_name=? AND Security_Question=? AND answer=?");
pstmt.setString(1,customer_email);
pstmt.setString(2,passwordHash);
pstmt.setString(3,customer_name);
pstmt.setString(4,customer_last_name);
pstmt.setString(5,Security_Question);
pstmt.setString(6,customer_answer);

rs1 = pstmt.executeQuery();


while (rs1.next()){

	session.setAttribute("email",customer_email);
	response.sendRedirect("index.jsp");
	
	
}
if (rs1 != null) {
    try {
        rs1.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
response.sendRedirect("error.jsp?msg=valid");
}
	else {
		
		response.sendRedirect("singup.jsp?msg=invalidPassword");
	
	}
	
}

catch(Exception e){
System.out.print(e);
}
finally {

    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
    
    if (ps1 != null) {
        try {
            ps1.close();
        } catch (SQLException e) {
        	System.out.print(e);
        }
    }

  
    
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
