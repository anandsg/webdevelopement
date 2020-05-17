<%@page import="com.mycart.util.FactoryProvider"%>
<html>
<body>
<h2>Ecommerce Project Using Jsp servlet with hibernate</h2>

<%
	out.print(FactoryProvider.getFactory());
%>
</body>
</html>
