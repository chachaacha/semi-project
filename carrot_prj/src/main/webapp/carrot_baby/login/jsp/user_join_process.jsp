<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%
session.setAttribute("joinFlag", "check");
session.setMaxInactiveInterval(60*60*60);
response.sendRedirect("user_join_form.jsp");
%>