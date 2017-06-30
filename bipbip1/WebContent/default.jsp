<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="com.kitri.util.*"
    import="com.kitri.member.model.MemberDto"
    import="com.kitri.admin.model.PathDto"
%>
<%
String root = request.getContextPath();

int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String key = Encoding.nullToBlank(request.getParameter("key"));
//String word = request.getParameter("word");
String word = Encoding.isoToEuc(request.getParameter("word"));

MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
PathDto pathDto = (PathDto)request.getAttribute("pathInfo");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%if (pathDto.getTitleHead() == null) {%>
	<title>���� ������ �뿩�� �� ���ھ��� ����~</title>
<%} else {%>
	<title><%=pathDto.getTitleHead()%></title>
<%}%>
	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">
	<jsp:include page="/common/head.jsp"></jsp:include>
<%if (pathDto.getHeadPath() != null) {%>
	<jsp:include page="<%=pathDto.getHeadPath()%>"></jsp:include>
<%}%>
<script type="text/javascript">
var root = "<%=root%>";
var bcode = "<%=bcode%>";
var pg = "<%=pg%>";
var key = "<%=key%>";
var word = "<%=word%>";
</script>
	<jsp:include page="/common/header.jsp"></jsp:include>
	<jsp:include page="<%=pathDto.getContentPath()%>"></jsp:include>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	<jsp:include page="/common/bottom.jsp"></jsp:include>
<%if (pathDto.getBottomPath() != null) {%>
	<jsp:include page="<%=pathDto.getBottomPath()%>"></jsp:include>
<%}%>
</body>
</html>