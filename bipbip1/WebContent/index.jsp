<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="com.kitri.member.model.MemberDto"%>
<%
String root = request.getContextPath();
MemberDto memberDto = new MemberDto();
memberDto.setId("admin");
memberDto.setName("admin");
memberDto.setEmail("admin@admin.co.kr");  
/* session.setAttribute("loginInfo", memberDto); */
response.sendRedirect(root + "/admin?act=main");
%>     