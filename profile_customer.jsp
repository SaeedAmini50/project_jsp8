<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
       <%@ include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>
 <meta charset="utf-8">
 
</head>
<body  >

           
               <%       try{

            		 email=session.getAttribute("email").toString();
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE email=?");


	 ps.setString(1, email);
	 ResultSet rs = ps.executeQuery();
	

while(rs.next()){


%>
           
            


<div class="container">
<div class="row gutters">
	<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12" >
		<div class="card h-100">
			<div class="card-body">
				<div class="account-settings" >
					<div class="user-profile">
						<div class="user-avatar">
							<img src="./img/testimonial-2.jpg" alt="Maxwell Admin">
						</div>
						<h4 class="user-name"><%=rs.getString(3) %></h4>
						<h4 class="user-email"><%=rs.getString(4) %></h4>
					</div>
					<div class="about">
						<h5 class="mb-2 text-primary">توجه</h5>
						<p >میتوانید عکس خود را در بالا اضافه کنید</p>
					</div>
				</div>
			</div>
		</div>
	</div>
		     		
	<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
		<div class="card h-100">
			<div class="card-body">
			
					<form action="profile_customerAction.jsp" method="post">
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<h3 class="mb-3 text-primary">مشخصات پروفایل شما</h3>
					</div>		
					
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="ID">ID</label>
							<input type="text" value="<%=rs.getString(1) %>" readonly name="customer_ID" class="form-control" id="ID">
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="name">اسم</label>
							<input type="text" value="<%=rs.getString(3) %>" name="customer_name"  class="form-control" id="fullName" placeholder="اسم شما">
						</div>
					</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="last_name">تخلص</label>
							<input type="text" value="<%=rs.getString(4) %>" class="form-control" name="customer_last_name" id="fullName" placeholder="تخلص شما">
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="email">ایمیل</label>
							<input type="email" value="<%=rs.getString(2) %>" readonly name="email" class="form-control" id="email" placeholder="ایمیل شما">
						</div>
					</div>
		
				 <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				 <div class="form-group">
                      <label for="customer_answer">سوال امنیتی شما</label><br>
                       <select name="Security_Question" class="form-select " aria-label=".form-select-lg example">
					<option value="<%=rs.getString(5) %>"  selected> <%=rs.getString(5) %></option>
					<option value="what was your first car?"  > اولین ماشین شما چی بود؟</option>
						<option value="what is the name of your first friend?">اسم اولین دوست شما چی بود؟</option>
						<option value="what was the first_neme of school that you attend?">اسم اولین مکتبی که شما در آن اشتراک کردید چه بود؟</option>
						<option value="what is the name of the town where you were born?">اسم شهری که شما در آن متولد شدید چه بود؟</option>
					</select>
					</div>
					</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="answer">جواب شما به سوال امنیتی </label>
							<input type="text" value="<%=rs.getString(6) %>" name="customer_answer" class="form-control" id="customer_answer" placeholder="جواب شما به سوال امنیتی ">
						</div>
					</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="date">تاریخ ایجاد پروفایل شما </label>
							<input  readonly value="<%=rs.getString(7) %>" type="date" name="customer_date" class="form-control" id="date" placeholder="تاریخ ایجاد پروفایل شما">
						</div>
					</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="password"> پسورد</label>
						<input type="text" value="<%=rs.getString(8) %>" name="password" class="form-control" id="password" placeholder="پسورد شما">
						</div>
					</div>
					
				</div>
			
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="text-right">
							<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
							<button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	
	 <%}
if (ps != null) {
    try {
        ps.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}

if (rs != null) {
    try {
       rs.close();
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
                     }

catch(Exception e){
System.out.print(e);

}
                     %>
	
</div>
</div>

</body>
</html>
  <%@ include file="footer.jsp" %>