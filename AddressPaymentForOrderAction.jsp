<%@ page import="java.sql.*" 
import="project.ConnectionProvider"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

 <%

 

String email;
Object emailObject = session.getAttribute("email");
if (emailObject != null) {
    email= emailObject.toString();}
    else{  
    	email=null;
    	response.sendRedirect("error.jsp");  
    		
    }
    
    
    
    
 String address=request.getParameter("customer_address");
 String city=request.getParameter("customer_city");
 String country=request.getParameter("customer_country");
 String  phone=request.getParameter("customer_phone");
 String  amoung_payment=request.getParameter("amoung_payment");
 String  payment_method=request.getParameter("payment_method");
 String  transaction_ID="";
 transaction_ID=request.getParameter("transactionID");
 int payment_ID=0;
 int shipment_ID=0;
 
try {Connection con = ConnectionProvider.getCon();
int customer_ID=0;
PreparedStatement ps=con.prepareStatement("SELECT * FROM customer WHERE email = ?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
while(rs.next()){customer_ID=rs.getInt(1);}

if (ps != null) {
    try {
        ps.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
if (rs != null) {
    try {
        ps.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}



PreparedStatement ps1 = con.prepareStatement(" INSERT INTO shipment (customer_country,customer_city,customer_address,customer_phone,customer_ID,shipment_date) VALUES(?,?,?,?,?,now());");
	ps1.setString(1,country);
	ps1.setString(2,city);
	ps1.setString(3,address);
	ps1.setString(4,phone);
	ps1.setInt(5,customer_ID);
	ps1.executeUpdate(); 
	  if (ps1 != null) {
          try {
              ps1.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      }
PreparedStatement ps2 = con.prepareStatement("INSERT INTO payment (amoung_payment,payment_method,customer_ID,payment_date,deliveryDate,Due_DATE) VALUES(?,?,?,now(),DATE_ADD(payment_date,INTERVAL 10 DAY),DATE_ADD(payment_date,INTERVAL 30 DAY));");
			ps2.setString(1,amoung_payment);
			ps2.setString(2,payment_method);
			ps2.setInt(3,customer_ID);
			ps2.executeUpdate();
		
			  if (ps2 != null) {
		            try {
		                ps2.close();
		            } catch (SQLException e) {
		            	System.out.print(e);
		            }
		        }
	

PreparedStatement ps3 = con.prepareStatement("SELECT MAX(payment_ID) FROM payment");
ResultSet rs3 = ps3.executeQuery();

	while(rs3.next()){
		
		payment_ID=rs3.getInt(1); 
	}		
	  if (rs3 != null) {
          try {
              rs3.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      }  if (ps3 != null) {
          try {
              ps3.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      }

	  PreparedStatement ps4 = con.prepareStatement("select max(shipment_ID) from shipment;");
	  ResultSet rs4 = ps4.executeQuery();

while(rs4.next()){

shipment_ID=rs4.getInt(1); 
}




if (ps4 != null) {
    try {
        ps4.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}  if (rs4 != null) {
    try {
        rs4.close();
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
if (!response.isCommitted()) {
		response.sendRedirect("billAction.jsp?shipment_ID="+shipment_ID+"&payment_ID="+payment_ID);
}
}
catch(Exception e){System.out.print(e);}
 %>
 
 
 
 
 
 
 
 
 