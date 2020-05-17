<%

String message=(String)session.getAttribute("message");

if(message!=null){

%>
	
  <%=message%>
<%
	session.removeAttribute("message");
}
	
%>

