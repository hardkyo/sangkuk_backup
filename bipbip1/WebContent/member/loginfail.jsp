<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:include page="/common/header.jsp"></jsp:include>
<jsp:include page="/common/bottom.jsp"></jsp:include>
<jsp:include page="/common/head.jsp"></jsp:include>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<!-- ȸ�� ���� ���н� -->
		<h3 style="padding: 30px">
			���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.<br> <br> ���̵� �Ǵ� ��й�ȣ Ȯ�� �� �ٽ� �α����ϼ���.
		</h3>
		<br> <a href="/bipbip1/member?act=mvlogin"><input
			type="submit" class="btn btn-primary " value="�α��� �������� �̵�"></a>


	</center>

</body>
</html>

<jsp:include page="/common/footer.jsp"></jsp:include>