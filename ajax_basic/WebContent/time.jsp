<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Date, java.text.*"%>
    
<%
	DateFormat df = new SimpleDateFormat("HH:mm:ss");
%>
<font color="pink" size="15"><%=df.format(new Date()) %></font>