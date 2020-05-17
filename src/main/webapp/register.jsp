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
			<div class="card">
				<div class="card-body">
					<h3 class="text-center my-3">Sign up here!!</h3>
					
					<form action="RegisterServlet" method="post">
						<div class="form-group">
							<label for="name">User Name</label> <input type="text"
								class="form-control" id="name" name="name" aria-describedby="User Name"
								placeholder="Enter User Name">
						</div>

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
						</
						<div class="col-md-6">
						
						<div class="form-group">
							<label for="phone">Phone Number</label> <input type="text"
								class="form-control" id="phone" name="phone" aria-describedby="Phone Number"
								placeholder="Enter Phone Number">
						</div>

						<div class="form-group">
							<label for="address">User Address</label>
							<textarea style="height: 100px;" class="form-control"
								id="address" name="address" aria-describedby="User Address"
								placeholder="Enter User Address"></textarea>
						</div>

						<div class="container">
							<button type="submit" class="btn btn-outline-success">Register</button>
							<button type="button" class="btn btn-outline-warning">Reset</button>
						</div>

					</form>
					</div>	
				</div>
			</div>

		</div>
	</div>
	</div>
</body>
</html>