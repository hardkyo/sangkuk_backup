<?xml version="1.0" encoding="utf-8"?>
<%@page import="ajax_basic.BookDto"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	BookDto bookDto = (BookDto)request.getAttribute("book");
%>    
<book>
	<title><%=bookDto.getTitle() %></title>
	<price><%=bookDto.getPrice() %></price>
</book>