<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String root = request.getContentType();
%>
<script type="text/javascript" src="/bipbip1/js/myajax.js"></script>
<script type="text/javascript">
var view;
var flag = false;

function join(){
	
	if(document.getElementById("id").value == "") {
		alert("���̵� �Է�!");
		return;
	} else if(document.getElementById("name").value == "") {
		alert("�̸� �Է�!");
		return;
	} else if(document.getElementById("pass").value  == "") {
		alert("��й�ȣ �Է�!");
		return;
	}  else if(document.getElementById("pass").value != document.getElementById("passcheck").value) {
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.!");
		
		return;  
	} else {
		document.joinform.action = "/bipbip1/member";
		document.joinform.submit();
	}	
}

function idcheck(){
	view = document.getElementById("idresult");
	var idval = document.getElementById("id").value;
	//alert(idval);
	if(idval.length < 5 || idval.length > 16) {
		view.innerHTML = "<font color='orange'>���̵�� 5���̻� 16�������Դϴ�.</font>";
	} else {
		var param = "act=idsearch&id=" + encodeURI(idval);
		sendRequest("/bipbip1/member", param, idresult, "GET");
	}
}

function idresult() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var txt = httpRequest.responseText;
			view.innerHTML = txt;
		} else {
			alert("�����߻� : " + httpRequest.status);
		}
	}
}

function passwordCheck(){

	var password = document.getElementById("pass").value;
	var passwordCheck = document.getElementById("passcheck").value;

	if (password != passwordCheck) {
		document.getElementById("passresult").style.color = "red";
		document.getElementById("passresult").innerHTML = "������ ��й�ȣ�� �Է��ϼ���";
	} else {
		document.getElementById("passresult").style.color = "blue";
		document.getElementById("passresult").innerHTML = "��й�ȣ�� Ȯ�εǾ����ϴ�.";
	}
} 

</script>
<div class="container" style="padding-top: 50px">
	<div class="col-lg-4"></div>
	<div class="col-lg-5">
		<div class="jumbotron" style="padding-top: 30px">
			<form name="joinform" id="joinform" method="post" action="">
				<input type="hidden" name="act" value="register">
				<h3 style="text-align: center;">ȸ������ ȭ��</h3>
				<div class="form-group">

					<input type="text" class="form-control" placeholder="���̵�" name="id"
						id="id" value="" maxlength="20" onkeyup="javascript:idcheck();">
					<div id="idresult"></div>
				</div>
		
				<div class="form-group">
					<input type="password" class="form-control" placeholder="��й�ȣ�Է�"
						name="pass" id="pass" value="" maxlength="20"><!-- &nbsp;&nbsp;<font
						color="#3cb371">6~12</font>�ڸ��� ����(��ҹ��� ����)�̳� ���� -->
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="��й�ȣȮ��"
						name="passcheck" id="passcheck" value="" maxlength="20" onkeyup="javascript:passwordCheck();">
					<div id="passresult"></div>
			
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="�̸�"
						name="name" id="name" value="" maxlength="20">
				</div>
				<div class="form-group" style="text-align: center;"></div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="�̸���"
						name="email" id="email" value="" maxlength="20">
				</div>
				<div class="form-group">
					<input type="tel" class="form-control" placeholder="����ó"
						name="phone" id="phone" value="" maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="postcodify_address" placeholder="�ּ�"
						name="address" id="address" value="" maxlength="20">
						<button id="postcodify_search_button">�ּҰ˻�</button><br />
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="ȸ������" onclick="javascript:join();">
			</form>
		</div>
	</div>
</div>

<!-- jQuery�� Postcodify�� �ε��Ѵ� -->
<script src="/bipbip1/js/post/search.min.js"></script>

<!-- "�˻�" ���߸� ������ �˾� ���̾ �������� �����Ѵ� -->
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

