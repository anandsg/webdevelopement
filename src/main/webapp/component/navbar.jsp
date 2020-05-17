
<%@page import="com.mycart.entities.User"%>
<%
	User user=(User)session.getAttribute("logged-user");
	if (session.getAttribute("sid") == null) {
%>
<nav class="navbar navbar-expand-lg navbar-dark  custom-bg">

	<div class="container">
		<a class="navbar-brand" href="index.jsp?category=all">MyCart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<!-- <li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li> -->
			</ul>

			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register </a></li>
			</ul>

		</div>
	</div>
</nav>
<%
	} else {
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

	<div class="container">
		<a class="navbar-brand" href="index.jsp?category=all"><strong> MyCart</strong></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				 <li class="nav-item active"><a class="nav-link"
					href="dashboard.jsp">Dashboard <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li> 
			</ul>


			<!-- Example single danger button -->
			<div class="btn-group">
				<a class="btn  dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <img
					src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg"
					width="40" height="40" class="rounded-circle">
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"><%=user.getUserName()%></a> <a
						class="dropdown-item" href="#"></a> <a class="dropdown-item"
						href="#">Change Password</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="LogoutServlet">Logout</a>
				</div>
			</div>


		</div>
	</div>
</nav>

<%
	}
%>