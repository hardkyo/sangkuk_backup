<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.kitri.member.model.*"%>
<%  
	String root = request.getContextPath();
	MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
	
%>
<script type="text/javascript">
   	function moveFreeBoardList() {
   		document.location.href = "<%=root%>/freeboard?act=freeboard&bcode=1&pg=&key=&word=";
	}
   	
   	function moveGallerydList() {
		document.location.href = "<%=root%>/gallery?act=mvgallerylist";
	}
   	
   	function moveLogin() {
   		document.location.href = "<%=root%>/member?act=mvlogin";
	}
   	
   	function moveJoin() {
   		document.location.href = "<%=root%>/member?act=mvjoin";
	}
   	function moveRouteHot() {
   		document.location.href = "<%=root%>/admin?act=mvroutehot";
	}
   	
   	function movePlanRoute() {
   		document.location.href = "<%=root%>/map?act=mvshowmap";
	}

	function logout() {
		if(confirm("로그아웃 하시겠습니까?") == true ){
			document.location.href = "<%=root%>/member?act=logout";
		}else {
			return;
		}
	}

	function memberDelete() {
		if(confirm("회원탈퇴를 하시겠습니까?") == true ){
			document.location.href = "<%=root%>/member?act=memberdelete";
		}else {
			return;
		}
	} 

	function moveModify() {
   		document.location.href = "<%=root%>/member?act=mvmodify";
	}
</script>
</head>
<body>
	<!-- board common form -->
	<form name="commonForm" method="get" action="">
		<input type="hidden" name="act" value=""/> 
		<input type="hidden" name="bcode" value=""/> 
		<input type="hidden" name="pg" value=""/> 
		<input type="hidden" name="key" value=""/> 
		<input type="hidden" name="word" value=""/> 
		<input type="hidden" name="seq" value=""/>
	</form>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default navbar-fixed-top"	role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/bipbip1/admin?act=main"><strong>Bike</strong></a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class=""><a href="javascript:moveRouteHot();">추천경로</a></li>
							<li class=""><a href="javascript:movePlanRoute();">경로계획</a></li>
							<li class=""><a href="javascript:moveGallerydList();">앨범</a></li>
							<li class=""><a href="javascript:moveFreeBoardList();">자유게시판</a></li>
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">모임
							<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">기능1</a></li>
									<li><a href="#">기능2</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">
								<%= (memberDto == null ? "접속하기" : "회원관리" )%><strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<% if (memberDto == null) {%>
									<li><a href="javascript:moveLogin();">로그인</a></li>
									<li><a href="javascript:moveJoin();">회원가입</a></li>
									<!-- <li class="divider"></li> -->
									<%} else { %>
									<li><a href="<%=root%>/member?act=mvmypage">마이페이지</a></li>
									<li><a href="javascript:moveModify();">회원정보수정</a></li>
									<li><a href="javascript:memberDelete();">회원탈퇴</a></li>
									<li><a href="javascript:logout();">로그아웃</a></li>
									<%} %>
								</ul>
             				 </li>

						</ul>
						
					</div>
				</nav>
			</div>

			<br /> <br /> <br />
