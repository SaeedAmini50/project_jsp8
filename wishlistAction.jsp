<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@page import ="java.security.MessageDigest"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
String  product_ID=request.getParameter("product_ID");



// Ø§ÛØ¬Ø§Ø¯ ÛÚ© ArrayList Ø¨Ø±Ø§Û Ø°Ø®ÛØ±Ù product_ID ÙØ§
ArrayList<String> productIDs;

// Ø¯Ø±ÛØ§ÙØª ArrayList Ø§Ø² Session ÛØ§ Ø§ÛØ¬Ø§Ø¯ Ø¢Ù Ø¯Ø± ØµÙØ±Øª Ø¹Ø¯Ù ÙØ¬ÙØ¯
if (session.getAttribute("productIDs") != null) {
    productIDs = (ArrayList<String>) session.getAttribute("productIDs");
} else {
    productIDs = new ArrayList<String>();
}

// Ø¨Ø±Ø±Ø³Û ÙØ¬ÙØ¯ Ø¹Ø¯Ø¯ Ø¯Ø± ArrayList ÙØ¨Ù Ø§Ø² Ø§Ø¶Ø§ÙÙ Ú©Ø±Ø¯Ù
if (!productIDs.contains(product_ID)) {
    // Ø¹Ø¯Ø¯ ØªÚ©Ø±Ø§Ø±Û ÙÛØ³ØªØ Ø¨ÙØ§Ø¨Ø±Ø§ÛÙ Ø¨Ù ArrayList Ø§Ø¶Ø§ÙÙ Ú©ÙÛØ¯
    productIDs.add(product_ID);
}

// Ø°Ø®ÛØ±Ù ArrayList Ø¯Ø± Session
session.setAttribute("productIDs", productIDs);

// ÙÙØ§ÛØ´ ÙÙØ§Ø¯ÛØ± ÙÙØ¬ÙØ¯ Ø¯Ø± ArrayList
for (String id : productIDs) {
    out.println("Product ID: " + id + "<br>");
}
 
response.sendRedirect("index.jsp?msg=added");

			%>
		
	







%>