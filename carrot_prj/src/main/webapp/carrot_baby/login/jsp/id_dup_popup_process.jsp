<%@page import="userDAO.JoinDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%
String msg= request.getParameter("msg");
String id = request.getParameter("id");

JSONObject json = new JSONObject();

JoinDAO jDAO=JoinDAO.getInstance();

boolean flag=jDAO.selectId(request.getParameter("id"));
pageContext.setAttribute("flag",flag);//true면 사용중, false면 미사용
if( flag == true ){
	json.put("msg", id+"는 사용중인 아이디입니다.");
} else if( flag== false){
	json.put("msg", id+"는 사용 가능한 아이디입니다.");
}
%>