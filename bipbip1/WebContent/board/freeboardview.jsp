<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*"
    import ="com.kitri.freeboard.model.*"
	import ="com.kitri.util.*"
	import ="com.kitri.member.model.*"     
%>
<%
FreeBoardDto freeBoardDto = (FreeBoardDto)request.getAttribute("article");
MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
if (freeBoardDto != null) {
%>     
<!--freeboard header -->
			<header>
				<h1>자유게시판</h1>
			</header>
<!--freeboard content-->
			<div class="content">
				<section>
					<article class="">
						<div class="board">
<!-- top ad page -->						
							<div class="container-fluid" style="margin-top: 1%; margin-bottom: 2%;">
								<div class="row" style="text-align: center;">
									<div class="hotchoice col-md-2" style="border:2px solid black">
										<div class="">
											<button class="btn btn-default" type="button">기본</button>
										</div>
										<div class="">
											<button class="btn btn-default" type="button">HOT</button>
										</div>
										<div class="">
											<button class="btn btn-default" type="button">Best</button>
										</div>
									</div>
									<div class="col-md-10" style="border:2px solid black;">
										<div style="font-size: 5.1em;">
											광고입니다.!!!
										</div>
									</div>
								</div>
							</div>

							<div class="boardlist">
								<form name="viewform" method="post" style="margin: 0px">
									<table class="table">
										<thead class="">
											<tr>
												<th class="" colspan="12"><%=freeBoardDto.getSubject()%></th>
												<th></th>								
											<tr>
												<th class="bg_board_title_02" height="1" colspan="12" style="overflow: hidden; padding: 0px"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="centercolumn" colspan="12"><%=freeBoardDto.getContent()%></td>
												<td></td>			
											</tr>
											<tr>
												<td bgcolor="#ededed" height="1" colspan="12" style="overflow: hidden; padding: 0px"></td>
											</tr>				
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</article>
					
<!-- search -->
					<div class="">
						<form name="searchForm" method="get" action="">
							<input type="hidden" name="act" value="list">
							<input type="hidden" name="bcode" value="1">
							<input type="hidden" name="pg" value="1">
							
							<div class="search-container" id="bs-example-navbar-collapse-1">
								<div class="search-wrapper">
									<div class="inner">
										<select name="key" class="form-control">
											<option value='subject' selected>제목</option>
											<option value='content'>내용</option>
											<option value='subject||content'>제목+내용</option>
											<option value='id'>회원아이디</option>
											<option value='name'>이름</option>
										</select>
									</div>
									<div class="inner word">
										<input class="form-control find" type="text" name="word" onkeypress="javascript:if(event.keyCode == 13) {searchArticle();}" />
									</div>
									<div class="inner">
										<button type="button" class="btn btn-info find" onclick="javascript:searchArticle();">
											<span class="glyphicon glyphicon-search"></span> Search
										</button>
									</div>
								</div>
							</div>
						</form>
						
<!-- write button for modal-->
						<div class="writebtn-containter">
							<div class="writebtn-wrapper">
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#writemodal">글쓰기</button>
							</div>
						</div>
					</div>
				</section>				
<!-- aside hot content-->
				<aside class="">
					<div style="margin-bottom: 5px; text-align: center;">
						<h3>* 인기글 *</h3>
					</div>
					<div class="hotlist">
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>여기는 추천수 100이상 되는 글이 오는 곳</p>
						<p>오렌지</p>
					</div>
				</aside>
				<aside class="">
					<div class="ads">
						<p>광고용 페이지 입니다.</p>
					</div>
				</aside>
			</div>
<!-- write modal -->
			<div class="modal fade" id="writemodal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
<!-- write modal header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">글쓰기</h4>
						</div>
<!-- write modal body -->
						<div class="modal-body">
							<form name="writeForm" method="post" action="" onsubmit="return false;">
								<input type="hidden" name="act" id="act" value="freewrite"/>
								<input type="hidden" name="bcode" value="1"/>
								<input type="hidden" name="pg" value=""/>
								<input type="hidden" name="key" value=""/>
								<input type="hidden" name="word" value=""/>
								<input type="hidden" name="seq" value=""/>
								<input type="hidden" name="content" value=""/>
								
								<div class="form-group">
									<div class="form-group" style="vertical-align: bottom;">
										<label for="usr">제목</label>
										<input type="text" class="form-control" id="subject" name="subject" />
									</div>
								</div>
								<label for="usr">내용</label>
								<div id="summernote">
									<p>왜 처음에 크기가 고정이 안 될까?</p>
									<p>왜 왜 제이쿼리를 인식 못 하는건지.. ㅠㅠ</p>
									<p>글 써주세요!!</p>
									<p>왜 안 될까요?</p>
									<p>ㅋㅋㅋㅋㅋ</p>
								</div>
<!-- write modal footer -->
								<div class="modal-footer">
									<button onclick="javascript:freeboardwrite();"
										type="button" class="btn btn-default" id="writebtn" name="writebtn"	value="writebtn">Write</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
<%
} else {
%>
<script>
alert("부적절한 URL 접근입니다.");
document.location.href = "/bipbip1/index.jsp";
</script>
<%
}
%>