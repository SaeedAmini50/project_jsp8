<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%


String admin_name=request.getParameter("admin_name");
String admin_last_name=request.getParameter("admin_last_name");
String email=request.getParameter("email");
String admin_phone=request.getParameter("admin_phone");
String Security_Question=request.getParameter("Security_Question");
String admin_answer=request.getParameter("answer");
String password=request.getParameter("password");
String password2=request.getParameter("password2");

Connection con = null;
ResultSet rs = null;
PreparedStatement ps = null;
PreparedStatement ps1 = null;
ResultSet rs1 = null;


String passwordHash = "";
   
	
try{

	if (password.equals(password2)){
		con = ConnectionProvider.getCon();
		    // Hash the password using SHA-2
		    String queryHash = "SELECT SHA2(?, 256) AS password_hash";
		    ps1 = con.prepareStatement(queryHash);
		    ps1.setString(1, password);
		    rs1 = ps1.executeQuery();
		    
		    if (rs1.next()) {
		        passwordHash = rs1.getString("password_hash");
		    }

		
		
		
	 
	 ps = con.prepareStatement("INSERT INTO admin (admin_name,admin_last_name,email,admin_phone,Security_Question,answer,password,admin_date) values(?,?,?,?,?,?,?,now());");
	ps.setString(1,admin_name);
	ps.setString(2,admin_last_name);
	ps.setString(3,email);
	ps.setString(4,admin_phone);
	ps.setString(5,Security_Question);
	ps.setString(6,admin_answer);
	ps.setString(7,passwordHash);
	ps.executeUpdate();
ps.close();
	
	String query = "SELECT * FROM admin WHERE email=? AND password=? AND admin_name=? AND admin_last_name=? AND admin_phone=? AND Security_Question=? AND answer=?";
	PreparedStatement pst = con.prepareStatement(query);
	pst.setString(1, email);
	pst.setString(2, passwordHash);
	pst.setString(3, admin_name);
	pst.setString(4, admin_last_name);
	pst.setString(5, admin_phone);
	pst.setString(6, Security_Question);
	pst.setString(7, admin_answer);
	 rs = pst.executeQuery();
	
	
	while (rs.next()){

		
		
		session.setAttribute("admin_email",email);
		
		response.sendRedirect("indexAdmin.jsp");
		
		
	}

	
	
	
response.sendRedirect("create_admin.jsp?msg=invalid");
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
