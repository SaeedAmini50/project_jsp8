<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">
  <head>
  
	<script>
	
	if(window.history.forward(1) !=null){
	window.history.forward(1);
	}
	
	
	
	</script>
	

	
  
  
    <meta charset="utf-8">
    <title>Smart Store</title>
   <style>
   
   @font-face {
  font-family: SourceSansPro;
  src: url(SourceSansPro-Regular.ttf);
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}

a {
  color: #0087C3;
  text-decoration: none;
}

body {
  position: relative;
  width: 21cm;  
  height: 29.7cm; 
  margin: 0 auto; 
  color: #555555;
  background: #FFFFFF; 
  font-family: Arial, sans-serif; 
  font-size: 14px; 
  font-family: SourceSansPro;
}

header {
  padding: 10px 0;
  margin-bottom: 20px;
  border-bottom: 1px solid #AAAAAA;
}

#logo {
  float: left;
  margin-top: 8px;
}

#logo img {
  height: 70px;
}

#company {
  float: right;
  text-align: right;
}


#details {
  margin-bottom: 50px;
}

#client {
  padding-left: 6px;
  border-left: 6px solid #0087C3;
  float: left;
}

#client .to {
  color: #777777;
}

h2.name {
  font-size: 1.4em;
  font-weight: normal;
  margin: 0;
}

#invoice {
  float: right;
  text-align: right;
}

#invoice h1 {
  color: #0087C3;
  font-size: 2.4em;
  line-height: 1em;
  font-weight: normal;
  margin: 0  0 10px 0;
}

#invoice .date {
  font-size: 1.1em;
  color: #777777;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 20px;
}

table th,
table td {
  padding: 20px;
  background: #EEEEEE;
  text-align: center;
  border-bottom: 1px solid #FFFFFF;
}

table th {
  white-space: nowrap;        
  font-weight: normal;
}

table td {
  text-align: right;
}

table td h3{
  color: #57B223;
  font-size: 1.2em;
  font-weight: normal;
  margin: 0 0 0.2em 0;
}

table .no {
  color: #FFFFFF;
  font-size: 1.6em;
  background: #57B223;
}

table .desc {
  text-align: left;
}

table .unit {
  background: #DDDDDD;
}

table .qty {
}

table .total {
  background: #57B223;
  color: #FFFFFF;
}

table td.unit,
table td.qty,
table td.total {
  font-size: 1.2em;
}

table tbody tr:last-child td {
  border: none;
}

table tfoot td {
  padding: 10px 20px;
  background: #FFFFFF;
  border-bottom: none;
  font-size: 1.2em;
  white-space: nowrap; 
  border-top: 1px solid #AAAAAA; 
}

table tfoot tr:first-child td {
  border-top: none; 
}

table tfoot tr:last-child td {
  color: #57B223;
  font-size: 1.4em;
  border-top: 1px solid #57B223; 

}

table tfoot tr td:first-child {
  border: none;
}

#thanks{
  font-size: 2em;
  margin-bottom: 50px;
}

#notices{
  padding-left: 6px;
  border-left: 6px solid #0087C3;  
}

#notices .notice {
  font-size: 1.2em;
}

footer {
  color: #777777;
  width: 100%;
  height: 30px;
  position: absolute;
  bottom: 0;
  border-top: 1px solid #AAAAAA;
  padding: 8px 0;
  text-align: center;
}

   
   
   
   </style>
  </head>
  <body>
     <%  String email=session.getAttribute("email").toString();  %> 
  <% 
  try{
	
	  
	  String order_ID=request.getParameter("order_ID");
	  String item_ID=request.getParameter("item_ID");
	  String paymentIDString = request.getParameter("payment_ID");
	 int payment_ID = Integer.parseInt(paymentIDString);
	  
Connection con=ConnectionProvider.getCon();
ResultSet rs;






int customer_ID=0;


PreparedStatement ps1 = con.prepareStatement("SELECT * FROM customer WHERE email=?");
ps1.setString(1, email);
ResultSet rs1 = ps1.executeQuery();
while(rs1.next()){	
customer_ID=rs1.getInt(1);
}
ps1.close();
rs1.close();

%>
  
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo.jpg">
      </div>
      <div id="company">
        <h2 class="name">Smart Store</h2>
        <div>455 Foggy Heights, AZ 85004, US</div>
        <div>+93799644575</div>
        <div><a href="mailto:company@example.com">smartstor575@email.com</a></div>
      </div>
    
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
        
        

  <% 
 	
  PreparedStatement ps2 = con.prepareStatement("SELECT * FROM customer INNER JOIN orders INNER JOIN shipment ON orders.customer_ID = customer.customer_ID AND shipment.shipment_ID = orders.shipment_ID WHERE customer.customer_ID = ? AND orders.order_ID = ?");
  ps2.setInt(1, customer_ID);
  ps2.setString(2, order_ID);
  ResultSet rs3 = ps2.executeQuery();
  
  
while(rs3.next()){%>
                
        
        
          <div class="to">INVOICE TO:</div>
          <h2 class="name">ID:<%=order_ID%><p style="display:inline;">-</p><%=item_ID%> </h2>
          <h2 class="name">NAME:<%=rs3.getString(3) %> <%=rs3.getString(4) %> </h2>
          <div class="address">ADDRESS:<%=rs3.getString(16) %>,<%=rs3.getString(17)%>,<%=rs3.getString(18)%>  </div>
          <div class="email"><a href="mailto:john@example.com">EMAIL:<%=rs3.getString(2) %> </a></div>
          <div class="phone">PHONE:<%=rs3.getString(19)%></div>
              <%break; }
              ps2.close();
              rs3.close();
             
              
               PreparedStatement ps4 = con.prepareStatement("SELECT * FROM customer INNER JOIN orders INNER JOIN payment ON orders.customer_ID = customer.customer_ID AND payment.payment_ID = orders.payment_ID WHERE orders.customer_ID = ? AND orders.order_ID = ?");
               ps4.setInt(1, customer_ID);
               ps4.setString(2, order_ID);
               ResultSet rs4 = ps4.executeQuery();
               
while(rs4.next()){%>
      
              
        </div>
        <div id="invoice">
          <h1>INVOICE </h1>
          <div class="date">Date of Invoice: <%=rs4.getDate(18) %></div>
           <div class="date">Delivery Date of Invoice: <%=rs4.getDate(19) %></div>
          <div class="date">Due Date of Invoice: <%=rs4.getDate(20) %></div>
        </div>
      </div>
      <%break;} 
      ps4.close();
      rs4.close();
      
      %>
                           
      
       
      
      
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="no">#</th>
            <th class="unit">NAME PRODUCT</th>
            <th class="qty">CATEGORY</th>
            <th class="unit">QUANTITY</th>
             <th class="qty">PRICE</th>
            <th class="total">SUB TOTAL</th>
          </tr>
        </thead>
        <tbody>
  <% int  sno=0;
  PreparedStatement ps5 = con.prepareStatement("SELECT * FROM product INNER JOIN order_item INNER JOIN orders ON product.product_ID = order_item.product_ID AND order_item.order_ID = orders.order_ID WHERE order_item.order_ID = ?");
  ps5.setString(1, order_ID);
  ResultSet rs5 = ps5.executeQuery();
while(rs5.next()){sno=sno+1; %>
          <tr>
            <td class="no"><%=sno %></td>
            <td class="unit"><%=rs5.getString(1) %></td>
           <td class="qty"><%=rs5.getString(10) %></td>
            <td class="unit"><%=rs5.getString(12) %></td>
             <td class="qty"><%=rs5.getString(2) %></td>
             <td class="total"><%=rs5.getInt(12) * rs5.getInt(2)%> </td>
          </tr><%} 
        ps5.close();
         rs5.close(); %>
        </tbody>
        <tfoot>
                 
  <% 
  PreparedStatement ps7 = con.prepareStatement("SELECT amoung_payment FROM payment INNER JOIN orders INNER JOIN order_item ON  payment.payment_ID = orders.payment_ID AND orders.order_ID = order_item.order_ID where orders.order_ID=? and order_item.item_ID=?");
  ps7.setString(1,order_ID );
  ps7.setString(2,item_ID );
  ResultSet rs7 = ps7.executeQuery();
  
while(rs7.next()){%>
     
          <tr>
          
            <td colspan="2"></td>
            <td colspan="2">TOTAL</td>
            <td><%=rs7.getString(1)%></td>
          </tr>
          <tr>	
          
            <td colspan="2"></td>
            <td colspan="2">TAX 0%</td>
            <td>0</td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">GRAND TOTAL</td>
            <td><%=rs7.getString(1)%></td>
          </tr>
          <%break;}

if (ps7 != null) {
	try {
	      con.close();
	  } catch (SQLException e) {
	  	System.out.print(e);
	  }
}
if (rs7 != null) {
	try {
	      con.close();
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
%>
        </tfoot>
      </table>
        
      <div id="thanks">Thank you!</div>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div>
     				
    </main>
    <br>	
		<br>
     <button type="submit">	<a href="index.jsp"> okey  </a> </button>
			
    <br>
    <br>
   
   
    <button onclick="window.print()">print</button>
	
	<br><br>
	
		<br>	
		<br>		
    <footer>
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
    
    
 
                 <% 
 }
                            
catch(Exception e)  {
	System.out.print(e);
	
}
%>
  </body>
</html>


