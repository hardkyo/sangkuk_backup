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
		if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?") == true ){
			document.location.href = "<%=root%>/member?act=logout";
		}else {
			return;
		}
	}

	function memberDelete() {
		if(confirm("ȸ��Ż�� �Ͻðڽ��ϱ�?") == true ){
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
							<li class=""><a href="javascript:moveRouteHot();">��õ���</a></li>
							<li class=""><a href="javascript:movePlanRoute();">��ΰ�ȹ</a></li>
							<li class=""><a href="javascript:moveGallerydList();">�ٹ�</a></li>
							<li class=""><a href="javascript:moveFreeBoardList();">�����Խ���</a></li>
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">����
							<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">���1</a></li>
									<li><a href="#">���2</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">
								<%= (memberDto == null ? "�����ϱ�" : "ȸ������" )%><strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<% if (memberDto == null) {%>
									<li><a href="javascript:moveLogin();">�α���</a></li>
									<li><a href="javascript:moveJoin();">ȸ������</a></li>
									<!-- <li class="divider"></li> -->
									<%} else { %>
									<li><a href="<%=root%>/member?act=mvmypage">����������</a></li>
									<li><a href="javascript:moveModify();">ȸ����������</a></li>
									<li><a href="javascript:memberDelete();">ȸ��Ż��</a></li>
									<li><a href="javascript:logout();">�α׾ƿ�</a></li>
									<%} %>
								</ul>
             				 </li>

						</ul>
						
					</div>
				</nav>
			</div>

			<br /> <br /> <br />
