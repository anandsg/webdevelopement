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
		
			<div class="card mt-3">
				<div class="card-header custom-bg text-white">
				<h3 class="">Sign IN </h3>
				</div>
			
				<div class="card-body">
					<%@include file="component/message.jsp" %>
					<form action="AuthServlet" method="post">

						<div class="form-group">
							<label for="email">User Email</label> <input type="email"
								class="form-control" id="email" name="email" aria-describedby="User Email"
								placeholder="Enter User Email">
						</div>

						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password" aria-describedby="Password"
								placeholder="Enter Password">
						</div>
						<a href="register.jsp" class="text-center d-block mb-4" >If not registered click here </a>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary custom-bg border-0">Login</button>
							<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
						</div>

					</form>

				</div>
				<div class="card-footer">
				<a href="forgotpassword.jsp" class="text-center d-block mb-4" >Forgot Password </a>
				</div>
			</div>

		</div>
	</div>
	</div>
</body>
</html>