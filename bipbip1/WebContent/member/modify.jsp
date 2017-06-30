<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" 
	import="com.kitri.member.model.MemberDto"
	%>
<%
	String root = request.getContentType();
	MemberDto memberDto2 = (MemberDto) request.getAttribute("modify");
	if(memberDto2!=null){
%>

<script>
function modify(){
	
	if(document.getElementById("id").value == "") {
		alert("아이디 입력!");
		return;
	} else if(document.getElementById("name").value == "") {
		alert("이름 입력!");
		return;
	} else if(document.getElementById("pass").value  == "") {
		alert("비밀번호 입력!");
		return;
	} else {
		document.joinform.action = "/bipbip1/member";
		document.joinform.submit();
	}
}
</script>
<div class="container" style="padding-top: 50px">
	<div class="col-lg-4"></div>
	<div class="col-lg-5">
		<div class="jumbotron" style="padding-top: 30px">
			<form name = "joinform" id = "joinform" method="post" action="">
			<input type="hidden" name="act" value="modify">
				<h3 style="text-align: center;">회원정보수정 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="id" id= "id" value = "<%=memberDto2.getId() %>" maxlength="20" readonly="readonly">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="pass" id= "pass" value = "<%=memberDto2.getPass() %>" maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="name" id= "name" value = "<%=memberDto2.getName() %>" maxlength="20" readonly="readonly">
				</div>
				<div class="form-group" style="text-align: center;"></div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일"
						name="email" id= "email" value = "<%=memberDto2.getEmail() %>" maxlength="20">
				</div>
				<div class="form-group">
					<input type="tel" class="form-control" placeholder="연락처"
						name="phone" id= "phone"  value = "<%=memberDto2.getPhone() %>" maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="주소"
						name="address" id= "address" value = "<%=memberDto2.getAddress() %>" maxlength="20">
				</div>							
				<input type="submit" class="btn btn-primary form-control"
					value="회원정보수정" onclick="javascript:modify();">
			</form>
		</div>
	</div>
</div>
<% }else {
	response.sendRedirect(root+"/member?act=mvlogin");

} %>

