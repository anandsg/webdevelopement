<%@page import="com.mycart.util.StringHelper"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.daoImpl.ProductOperationImpl"%>
<%@page import="com.mycart.dao.ProductOperation"%>
<%@page import="com.mycart.util.FactoryProvider"%>
<html>
<head>
<meta content="text/html; charset-UTF-8">
<title>MyCart-Home</title>

<%@include file="component/commanresource.jsp"%>
</head>

<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-4 ">
			<div class="col-md-2">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-home-list"  href="index.jsp?category=all"
						role="tab" aria-controls="home">All</a>
					<%
						ProductOperation po = new ProductOperationImpl();
						String cat=request.getParameter("category");
						List<Product> products =null;
						if(cat==null || "all".equalsIgnoreCase(cat.trim())){
							 products = po.productList();
						}else{
							products=po.getProductByCategory(Integer.parseInt(cat));
						}
						
						List<Category> categories = po.categorylist();
						for (Category category : categories) {
					%>
					<a class="list-group-item list-group-item-action"
						id="list-profile-list"  href="index.jsp?category=<%=category.getCategoryId()%>"
						role="tab" aria-controls="profile"><%=category.getCategoryTitle()%></a>
					<%
						}
					%>
				</div>
			</div>



		

			<div class="col-md-8">
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
							<%
								for (Product product : products) {
							%>
							<div class="card">
								<div class="container text-center mt-4">
									<img class="card-img-top"
										style="max-height: 200px; min-width: 100%; width: auto;"
										src="resources/images/products/<%=product.getProdcutPhoto()%>"
										alt="Card image cap">
								</div>
								<div class="card-body">
									<h5 class="card-title text-center" title="<%=product.getProductName()%>" ><%=StringHelper.get10Words(product.getProductName(), 3)%></h5>
								</div> 
								<p class="card-text text-center"><%=StringHelper.get10Words(product.getProductDescription(), 10)%>
								<a href="" class="text-primary" >View More </a>
								</p>

								<div class="card-footer">
									<button class="btn custom-bg text-white">Add To Card</button>
									<button class="btn btn-outline-primary">
										&#8360;
										<%=product.getProductPrice()%></button>
								</div>
							</div>


							<%
								}
							
							if(products.size()==0){
								out.print("<h3>no Item in this category</h3>");
							}
							%>
						</div>
					</div>
				</div>




			</div>

		</div>
	</div>
</body>
</html>
