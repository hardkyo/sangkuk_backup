<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.kitri.member.model.MemberDto"%>
<jsp:include page="/common/header.jsp"></jsp:include>

<jsp:include page="/common/bottom.jsp"></jsp:include>
<jsp:include page="/common/head.jsp"></jsp:include>

<%
	String root = request.getContextPath();

	MemberDto memberDto = (MemberDto) request.getAttribute("userInfo");
	if (memberDto != null) {
%>
<script>
function mvlogin() {
	document.commonForm.act.value = "mvlogin";
	document.commonForm.action = root +"/member";
	document.commonForm.submit();
}
</script>
<div class="container" style="padding-top: 50px">
	<div class="col-lg-4"></div>
	<div class="col-lg-5">
		<form name="loginform" id="loginform" method="post" action="">
			<input type="hidden" name="act" value="mvlogin">
			<div class="jumbotron" style="padding-top: 30px">
				<h2>ȸ������ ���ϵ帳�ϴ�.</h2>
				<br>

				<!-- ȸ�� ���� ������ -->
				<%=memberDto.getName()%>�� ȸ�������� ȯ�� �մϴ�.<br> ���� �Ͻ� ������ �Ʒ��� �����ϴ�.<br>
				<ul>
					<li>���̵� : <%=memberDto.getId()%>
					<li>�̸��� : <%=memberDto.getEmail()%>
					<li>�޴��ȣ : <%=memberDto.getPhone()%>
					<li>�ּ� : <%=memberDto.getAddress()%>
				</ul>
				�α��� �� ���񽺸� �̿��ϽǼ� �ֽ��ϴ�.<br> <input type="submit"
					class="btn btn-primary " value="�α��� �������� �̵�"
					onclick="javascript:mvlogin();">

			</div>
	</div>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>

<%
	} else {
%>
<script>
alert("�������� URL�����Դϴ�.");
document.location.href = "<%=root%>";
</script>
<%
	}
%>