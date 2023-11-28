<%@ page import="java.sql.*" 
import="project.ConnectionProvider"%>

 <%

 
 String cart_ID = session.getAttribute("cart_ID").toString();
 

 
 
 
 String  shipment_ID=request.getParameter("shipment_ID");
 String  payment_ID=request.getParameter("payment_ID");
 
 
 
 String email=session.getAttribute("email").toString();
 int total_price_order= 0 ;
 int total= 0 ;
 int order_ID= 0 ;
 int quantity_item= 0 ;
 int price_item= 0 ;
 int item_ID= 0 ;
 int product_ID= 0 ;

 String status="bill";
try {
	
	
Connection con = ConnectionProvider.getCon();

int customer_ID=0;




PreparedStatement ps=con.prepareStatement("SELECT * FROM customer WHERE email = ?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

while(rs.next()){
	
	customer_ID=rs.getInt(1);

}
if (rs != null) {
    try {
        rs.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
	
	
	



PreparedStatement ps2 = con.prepareStatement("SELECT amoung_payment FROM payment INNER JOIN orders INNER JOIN customer ON payment.payment_ID = orders.payment_ID AND orders.customer_ID = orders.customer_ID where payment.payment_ID=? ;");
ps2.setString(1, payment_ID);
ResultSet rs2 = ps2.executeQuery();

		
while (rs2.next()){
	total=rs2.getInt(1);
}

if (ps2 != null) {
    try {
        ps2.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
if (rs2 != null) {
    try {
        rs2.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}


	
	PreparedStatement ps4 = con.prepareStatement("INSERT INTO orders (total_price_order, customer_ID, payment_ID, shipment_ID, order_date) VALUES (?, ?, ?, ?, NOW())");
	ps4.setDouble(1, total);
	ps4.setInt(2, customer_ID);
	ps4.setString(3, payment_ID);
	ps4.setString(4, shipment_ID);
	ps4.executeUpdate();	
	
	

	  PreparedStatement ps41 = con.prepareStatement("select max(order_ID) from orders;");
	  ResultSet rs4 = ps41.executeQuery();
	  

	while(rs4.next()){
		 order_ID=rs4.getInt(1);
		   
	   }
	  if (ps41 != null) {
          try {
              ps41.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      } 
	  if (rs4 != null) {
          try {
              rs4.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      }
	
	
	
	  PreparedStatement ps5 = con.prepareStatement("SELECT * FROM product INNER JOIN cart ON product.product_ID=cart.product_ID  WHERE cart.cart_ID=?");
	  ps5.setString(1, cart_ID);
	  ResultSet rs5 = ps5.executeQuery();
	  
	  PreparedStatement ps6 =null;
	  while(rs5.next()){
		   
		   quantity_item=rs5.getInt(12);
		   price_item=rs5.getInt(2);
		   product_ID=rs5.getInt(8);

		   
		   ps6 = con.prepareStatement("INSERT INTO order_item (quantity_item, price_item, product_ID, order_ID) VALUES (?, ?, ?, ?)");
		   ps6.setInt(1, quantity_item);
		   ps6.setDouble(2, price_item);
		   ps6.setInt(3, product_ID);
		   ps6.setInt(4, order_ID);
		   ps6.executeUpdate();
		
	   }	

	  if (ps6 != null) {
          try {
              ps6.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      }
	  if (rs5 != null) {
          try {
              rs5.close();
          } catch (SQLException e) {
          	System.out.print(e);
          }
      }
	  

	  PreparedStatement ps7 = con.prepareStatement("select max(item_ID) from order_item;");

	  ResultSet rs6 = ps7.executeQuery();
	  
	 
		while(rs6.next()){
			 item_ID=rs6.getInt(1);
			   
		   }
		
		

		
		PreparedStatement pst = con.prepareStatement("DELETE FROM cart WHERE cart_ID = ?");
		pst.setString(1, cart_ID);
		 pst.executeUpdate();
		

		  if (pst != null) {
	            try {
	                pst.close();
	            } catch (SQLException e) {
	            	System.out.print(e);
	            }
	        }
		
		
		
		  if (rs6 != null) {
	            try {
	                rs6.close();
	            } catch (SQLException e) {
	            	System.out.print(e);
	            }
	        }
		  
		  
		  
		  
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
		
		  if (!response.isCommitted()) {
	response.sendRedirect("bill.jsp?order_ID="+order_ID+"&item_ID="+item_ID+"&payment_ID="+payment_ID);
}
}
catch(Exception e){
	
	System.out.print(e);
}
 
 
 
 
 
 
 %>