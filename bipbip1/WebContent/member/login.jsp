<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	String root = request.getContentType();
%>

<script>
function login(){
	
	if(document.getElementById("id").value == "") {
		alert("���̵� �Է�!");
		return;
	} else if(document.getElementById("pass").value  == "") {
		alert("��й�ȣ �Է�!");
		return;
	} else {
		document.loginform.action = "/bipbip1/member";
		document.loginform.submit();
	}
}
</script>

	<div class="container" style="padding-top: 50px">
		<div class="col-lg-4"></div>
		<div class="col-lg-5">
			<div class="jumbotron" style="padding-top: 30px">
				<form name ="loginform" method="post" action="">
					<input type="hidden" name="act" value="login">
					<h3 style="text-align: center;">�α��� ȭ��</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="���̵�"
							name="id" id="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="��й�ȣ"
							name="pass" id="pass" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="�α���" onclick="javascript:login();">
				</form>
			</div>
		</div>
	</div>


