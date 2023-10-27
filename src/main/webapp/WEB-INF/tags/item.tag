<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ tag import="jspbook.Product" %>
<%@ attribute name="bgcolor" %>
<%@ attribute name="border" %>
<jsp:useBean class="jspbook.Product" id="product"/>

<h2><jsp:doBody/></h2>
<table border="${border }" bgcolor="${bgcolor}" width="150">
<%
for(String item : product.getProductList()) {
   out.println("<tr><td>"+item+"</td></tr>");
}
%>
</table>