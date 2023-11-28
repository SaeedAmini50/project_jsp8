<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
String person = request.getParameter("person");
int z = 0;
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement ps = null;
PreparedStatement ps1 = null;
ResultSet rs1 = null;
try {
	con = ConnectionProvider.getCon();
	String passwordHash = "";
	String queryHash = "SELECT SHA2(?, 256) AS password_hash";
	ps1 = con.prepareStatement(queryHash);
	ps1.setString(1, password);
	rs1 = ps1.executeQuery();
	if (rs1.next()) {
		passwordHash = rs1.getString("password_hash");
	}
	
	
	  
    if(person.equals("1")){
	String query = "SELECT * FROM customer WHERE email=? AND password=?";
	pstmt = con.prepareStatement(query);
	pstmt.setString(1, email);
	pstmt.setString(2, passwordHash);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		session.setAttribute("email", email);
		session.setAttribute("", email);
		response.sendRedirect("index.jsp");
		
	}
    }
    
    else if (person.equals("2")) {
		String queryAdmin = "SELECT * FROM admin WHERE email=? AND password=?";
		ps = con.prepareStatement(queryAdmin);
		ps.setString(1, email);
		ps.setString(2, passwordHash);
		ResultSet rsAdmin = ps.executeQuery();
		while (rsAdmin.next()) {
	session.setAttribute("admin_email", email);
	response.sendRedirect("indexAdmin.jsp");
		}
		}
	 else {
		response.sendRedirect("singin.jsp?msg=notexist");
	}
} catch (Exception e) {
	System.out.println(e);
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
	if (ps != null) {
		try {
	ps.close();
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
	e.printStackTrace();
		}
	}
}
%>