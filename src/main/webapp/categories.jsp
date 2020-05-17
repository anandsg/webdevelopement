<%
User userdetails=(User)session.getAttribute("logged-user");
System.out.println("userdetails : "+userdetails);
if(userdetails==null){
	session.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> You are not logged In login first </div>");
	response.sendRedirect("LogoutServlet");
	return;
}else{
if(!userdetails.getUserType().equalsIgnoreCase("admin")){
	session.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> You are not admin user!! denied access permision </div>");
	response.sendRedirect("LogoutServlet");
	return;
}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/commanresource.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>


<div class="container bg-light">
<div class="row mt-3 custom-bg text-light text-center" >
	<img style="max-width: 60px; background: white;" class="img-fluid  ml-2" alt="" src="resources/images/list.png">
	 <h2 class="ml-5 mt-2">Product Categories </h2>
</div>
	<div class="row mt-3" >
	<div class="container">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
    
      <tr>
        <td>John</td>
        <td>cfhgfhfhdfgdf</td>
      </tr>
      
    </tbody>
  </table>
</div>
	</div>
	<div class="row mt-3 bg-light" >
</div>
	
	
</div>	
<script type="text/javascript">
</script>
</body>
</html>