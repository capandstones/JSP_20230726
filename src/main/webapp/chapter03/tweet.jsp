<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("UTF-8");

Object username = session.getAttribute("user");

String msg = request.getParameter("msg");

ArrayList<String> msgs = (ArrayList<String>) application.getAttribute("msgs");

if (msgs == null) {
	msgs = new ArrayList<String>();
	application.setAttribute("msgs", msgs);
}
msgs.add(username+" : " +msg);

response.sendRedirect("twitter_list.jsp");
%>