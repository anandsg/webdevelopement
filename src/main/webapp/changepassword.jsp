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

	<div class="container-fluid">
	

	<div class="row mt-3">
		<div class="col-md-4 offset-md-4">
		<%@include file="component/message.jsp" %>
			<div class="card mt-3">
				<div class="card-header custom-bg text-white">
				<h3 class="">Change Password </h3>
				</div>
			
				<div class="card-body">
					
					<form action="RegisterServlet" method="post">

						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password" aria-describedby="Password"
								placeholder="Enter Password">
						</div>

						<div class="form-group">
							<label for="password">Re-Password</label> <input type="password"
								class="form-control" id="repassword" name="repassword" aria-describedby="Password"
								placeholder="Enter Password">
						</div>
						<a href="register.jsp" class="text-center d-block mb-4" >If not registered click here </a>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary custom-bg border-0">Change Password</button>
						</div>

					</form>

				</div>
			</div>

		</div>
	</div>
	</div>
</body>
</html>