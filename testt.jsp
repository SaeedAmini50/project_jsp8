<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<html>
   <head>
      <title>JSTL fmt:bundle Tag</title>
   </head>
   <body>
      <fmt:bundle basename = "com.tutorialspoint.Example" prefix = "count.">
         <fmt:message key = "one"/><br/>
         <fmt:message key = "two"/><br/>
         <fmt:message key = "three"/><br/>
      </fmt:bundle>
   </body>
</html>