
<%@page import="com.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.daoImpl.ProductOperationImpl"%>
<%@page import="com.mycart.dao.ProductOperation"%>
<%
	User userdetails = (User) session.getAttribute("logged-user");
	System.out.println("userdetails : " + userdetails);
	if (userdetails == null) {
		session.setAttribute("message",
				"<div class=\"alert alert-success\" role=\"alert\"> You are not logged In login first </div>");
		response.sendRedirect("LogoutServlet");
		return;
	} else {
		if (!userdetails.getUserType().equalsIgnoreCase("admin")) {
			session.setAttribute("message",
					"<div class=\"alert alert-success\" role=\"alert\"> You are not admin user!! denied access permision </div>");
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


	<div class="container ">
		<%@include file="component/message.jsp" %>
		<div class="row mt-3">
			<!-- Card 1 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body ">
						<div class="row">
							<div class="col-5">
								<img style="max-width: 60px;" class="img-fluid rounded-circle"
									alt="" src="resources/images/team.png">
							</div>
							<div class="col-7">
								<h2>345</h2>
								<h4 class="text-uppercase text-muted">Users</h4>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="row">

							<div class="col-3">
								<!-- <a href="">
						<img style="max-width: 35px;" class="img-fluid" alt="" src="resources/images/add.png">
						</a> -->
							</div>
							<div class="col-6 text-center"></div>
							<div class="col-3">
								<a href="users.jsp"> <img style="max-width: 35px;"
									class="img-fluid " alt="" src="resources/images/list-1.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Card 2 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-5">
								<img style="max-width: 60px;" class="img-fluid rounded-circle"
									alt="" src="resources/images/list.png">
							</div>
							<div class="col-7">
								<h2>345</h2>
								<h4 class="text-uppercase text-muted ">Categories</h4>
							</div>
						</div>
					</div>

					<div class="card-footer">
						<div class="row">

							<div class="col-3">
								<a href="#" data-toggle="modal" data-target="#categoryModal">
									<img style="max-width: 35px;" class="img-fluid" alt=""
									src="resources/images/add.png">
								</a>
							</div>
							<div class="col-6 text-center"></div>
							<div class="col-3">
								<a href="categories.jsp"> <img style="max-width: 35px;"
									class="img-fluid" alt="" src="resources/images/list-1.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>



			<!-- Card 3 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-5">
								<img style="max-width: 60px;" class="img-fluid rounded-circle"
									alt="" src="resources/images/package.png">
							</div>
							<div class="col-7">
								<h2>345</h2>
								<h4 class="text-uppercase text-muted ">products</h4>
							</div>
						</div>
					</div>

					<div class="card-footer">
						<div class="row">

							<div class="col-3">
								<a href="#" data-toggle="modal" data-target="#productModal">
									<img style="max-width: 35px;" class="img-fluid" alt=""
									src="resources/images/add.png">
								</a>
							</div>
							<div class="col-6 text-center"></div>
							<div class="col-3">
								<a href="products.jsp"> <img style="max-width: 35px;"
									class="img-fluid" alt="" src="resources/images/list-1.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>



	</div>




	<!-- Category Modal -->
	<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog"
		aria-labelledby="categoryModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-light">
					<h5 class="modal-title" id="exampleModalLabel">Add New
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<div class="form-group">
							<input type="text" class="form-control" name="categoryTitle"
								placeholder="Enter Category Title " required="required">
						</div>

						<div class="form-group">
							<textarea rows="" cols=""
								placeholder="Enter Category Description" class="form-control"
								style="height: 150px;" name="categoryDescription"
								required="required"></textarea>
						</div>
						<input type="hidden" name="operation" value="category">
						
						<div class="container">
							<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-success">Add Category</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Product Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog"
		aria-labelledby="productModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-light">
					<h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >

						<div class="form-group">
							<input type="text" name="productName" class="form-control"
								placeholder="Enter product name" required="required">
						</div>
						<%
							ProductOperation op=new ProductOperationImpl();
							List<Category> categories=op.categorylist();
						%>
						<div class="form-group">
							<select class="form-control" id="category" name="category" onclick="onSelectOperation();" >
								<option value="0">Select Category</option>
								<% 
									for(Category c:categories){
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%} %>
							</select>
						</div>

						<div class="form-group">
							<input type="text" name="productPrice" class="form-control"
								placeholder="Enter product price" required="required">
						</div>

						<div class="form-group">
							<input type="text" name="productDiscount" class="form-control"
								placeholder="Enter product discount" required="required">
						</div>

						<div class="form-group">
							<input type="text" name="productQuantity" class="form-control"
								placeholder="Enter product Quantity" required="required">
						</div>



						<div class="form-group">
							<textarea rows="" cols="" placeholder="Enter product description"
								class="form-control" style="height: 150px;"
								name="productDescription" required="required"></textarea>
						</div>
						
						<div class="form-group">
						<label for="productpic">Select product picture</label>
						<br>
							<input type="file" id="productpic" name="productpic" required="required">
						</div>
						<input type="hidden" name="operation" value="product">
						<div class="container">
						<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-success">Add Product</button>
					</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>

	<%-- <div class="row mr-0">
<div class="col-2">
<%@include file="component/menubar.jsp"%>
</div>
<div class="col-10">
<div class ="container-fluid">
<h2>Admin Dashboard</h2>
</div>

</div>

</div> --%>
	<script type="text/javascript">
		function onSelectOperation(){
			var categoryvalue=document.getElementById("category")[0].value;
			if(categoryvalue==0){
			document.getElementById("category")[0]. remove();
			}
		}
	</script>
</body>
</html>