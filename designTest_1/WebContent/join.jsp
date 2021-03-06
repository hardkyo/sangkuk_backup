<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="<%=root%>/js/myajax.js"></script>
<script type="text/javascript">
	var view;
	var flag = false;

	function join() {
		if (document.getElementById("id").value == "") {
			alert("아이디 입력!");
			return;
		} else if (document.getElementById("name").value == "") {
			alert("이름 입력!");
			return;
		} else if (document.getElementById("pass").value == "") {
			alert("비밀번호 입력!");
			return;
		} else if (document.getElementById("pass").value != document.getElementById("passcheck").value) {
			alert("비밀번호 확인!");
			return;
		} else {
			document.joinform.action = "<%=root%>/user";
			document.joinform.submit();
		}
	}

	function openzip() {
		window.open("<%=root%>/user?act=mvzip", "zip", "top=200, left=300, width=400, height=300, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes");
	}



	function idcheck() {
		view = document.getElementById("idresult");
		var idval = document.getElementById("id").value;
		//alert(idval);
		if (idval.length < 5 || idval.length > 16) {
			view.innerHTML = "<font color='orange'>아이디는 5자이상 16자이하입니다.</font>";
		} else {
			var param = "act=idsearch&id=" + encodeURI(idval);
			sendRequest("<%=root%>/user", param, idresult, "GET");
		}
	}

	function idresult() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var txt = httpRequest.responseText;
				view.innerHTML = txt;
			} else {
				alert("문제발생 : " + httpRequest.status);
			}
		}
	}
</script>
</head>

<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href=login.jsp>로그인</a></li>
						<li class="active"><a href=join.jsp>회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-5">
			<div class="jumbotron" style="padding-top: 30px">
				<h3>회원가입</h3>
				<form name="joinform" method="post" action="">
					<input type="hidden" name="act" value="register">
					<table width="780" height="700" cellspacing="4" cellpadding="5">
						<tr>
							<td class="td1">이름<font color="red">*</font></td>
							<td class="td3"><input type="text" name="name" id="name"
								value="" size="12"></td>
						</tr>

						<!--
			<tr>
			 <td class="td2">주민등록번호<font color="red">*</font></td>
			 <td class="td4"><input type="text" name="reginum1" value="" size="12" maxlength="6"> -
			 <input type="text" name="reginum2" value="" size="12" maxlength="7"></td>
			</tr>

			<tr>
			 <td class="td1">닉네임(별명)<font color="red">*</font></td>
			 <td class="td3"><input type="text" name="nickname" value="" size="12">&nbsp;&nbsp; 실명을 사용하지 않는 서비스에서 사용되는 <font color="#3cb371">별명</font>입니다.<br>입력하지 않으실 경우 회원님의 이름이 등록됩니다.</td>
			</tr>
-->

						<tr>
							<td class="td2">아이디(ID)<font color="red">*</font></td>
							<td class="td4"><input type="text" name="id" id="id"
								value="" size="12" onkeyup="javascript:idcheck();">
								<div id="idresult"></div></td>
						</tr>

						<tr>
							<td class="td1">비밀번호입력<font color="red">*</font></td>
							<td class="td3"><input type="password" name="pass" id="pass"
								size="12" maxlength="12">&nbsp;&nbsp;<font
								color="#3cb371">6~12</font>자리의 영문(대소문자 구별)이나 숫자</td>
						</tr>

						<tr>
							<td class="td2">비밀번호확인<font color="red">*</font></td>
							<td class="td4"><input type="password" name="passcheck"
								id="passcheck" size="12" maxlength="12">&nbsp;&nbsp;비밀번호를
								한번더 입력하세요</td>
						</tr>
						<!--
            <tr>
			 <td width="120" class="td1">비밀번호 재발급<font color="red">*</font><br>질문 선택</td>
			 <td class="td3">
			  <select name="question">
			   <option value="">가장 좋아하는 색상은?(예: 빨강)</option>
			   <option value="">어릴 적 단짝 친구의 이름은?</option>
			   <option value="">가장 좋아하는 음식은?</option>
			   <option value="">가장 여행하고 싶은 나라는?</option>
			   <option value="">기억에 남는 추억의 장소는?</option>
			   <option value="">가장 좋아하는 연예인은?</option>
			  <option value="">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
			  </select><br>
			  혹시 비밀번호를 잊어버리신 경우 여기에서 선택한 질문을 하게됩니다.
			 </td>
			</tr>

			<tr>
			 <td width="120" class="td2">비밀번호 재발급<font color="red">*</font><br>답변 입력</td> 
	         <td class="td4"><input type="text" name="answer" size="35"><br>
			 위에서 선택하신 질문에 대한 답변을 입력하세요.<br>
			 비밀번호를 잊어버리신 경우 이 답변을 이용하여 비밀번호를 재발급 받으실 수 있습니다.</td>
			</tr>
-->
						<tr>
							<td class="td1">연락처<font color="red">*</font></td>
							<td class="td3">휴 대 폰&nbsp;&nbsp;<select name="tel1">
									<option value="">----</option>
									<option value="010">010</option>
									<option value="010">011</option>
									<option value="010">016</option>
									<option value="010">017</option>
									<option value="010">018</option>
							</select> - <input type="text" name="tel2" value="" size="4" maxlength="4">
								- <input type="text" name="tel3" value="" size="4" maxlength="4"><br>
								<!--
			  유선전화&nbsp;<select name="tel1">
			   <option value="">----</option>
		       <option value="010">02</option>
			   <option value="010">031</option>
			   <option value="010">032</option>
			   <option value="010">033</option>
			   <option value="010">041</option>
			  </select> -
					<input type="text" name="tel2" value="" size="4" maxlength="4" > -
					<input type="text" name="tel3" value="" size="4" maxlength="4" >
					<input type="radio" name="location" value="집" checked>집
        	        <input type="radio" name="location" value="회사">회사
					<br>휴대폰이나 유선전화 중에서 <font color="#3cb371">하나는 반드시 입력하셔야 합니다.</font>
-->
							</td>
						</tr>

						<tr>
							<td class="td2">우편번호<font color="red">*</font></td>
							<td class="td4"><input type="text" name="zip1" id="zip1"
								value="" size="5" maxlength="3" readonly="readonly"> - <input
								type="text" name="zip2" id="zip2" value="" size="5"
								maxlength="3" readonly="readonly"> <input type="button"
								value="우편번호검색" onclick="javascript:openzip();"></td>
						</tr>
						<tr>
							<td class="td1">주소<font color="red">*</font></td>
							<td class="td3"><input type="text" name="addr1" id="addr1"
								value="" size="100" readonly="readonly"></td>
						</tr>

						<tr>
							<td class="td2">상세주소<font color="red">*</font></td>
							<td class="td4"><input type="text" name="addr2" size="100"></td>
						</tr>

						<tr>
							<td class="td1">주로 쓰는 이메일<font color="red">*</font></td>
							<td class="td3"><input type="text" name="email1" value=""
								size="12"> @ <!--<input type="text" name="direct" value="" size=12>-->
								<select name="email2">
									<!--<option value="naver.com">직접입력</option>-->
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
							</select></td>
						</tr>
						<!--			
			<tr>
			 <td class="td2">성별<font color="red">*</font></td> 
	         <td class="td4"><input type="radio" name="gender" value="남" checked>남자
        	        <input type="radio" name="gender" value="여">여자</td>
			</tr>

			<tr>
			 <td class="td1">결혼여부<font color="red">*</font></td> 
	         <td class="td3"><input type="radio" name="married" value="미혼" checked>미혼 
				<input type="radio" name="married" value="기혼">기혼</td>
        	   
			</tr>

			<tr>
			 <td class="td2">취미 & 관심사항</td>
			 <td class="td4"><input type="checkbox" name="컴퓨터">컴퓨터&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="게임">게임&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="음악">음악&nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="checkbox" name="연예">연예&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="뉴스">뉴스&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="IT">IT&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="맛집">맛집&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="IT">맛집
			</tr>
-->
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="회원가입" onclick="javascript:join();"> &nbsp;&nbsp;
								<input type="reset" value="취소"></td>
						</tr>
					</table>
				</form>

				<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="js/bootstrap.js "></script>
</body>
</html>