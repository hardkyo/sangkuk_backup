<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*"
    import ="com.kitri.freeboard.model.*"
	import ="com.kitri.util.*"
	import ="com.kitri.member.model.*"     
%>
<%
List<FreeBoardDto> list = (List<FreeBoardDto>) request.getAttribute("freeList");
PageNavigation pageNavigation = (PageNavigation) request.getAttribute("navigator");
/* FreeBoardDto freeBoardDto = (FreeBoardDto)request.getAttribute("article");
MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo"); */
if (list != null) {
%>     
<!--freeboard header -->
			<header>
				<h1>切政惟獣毒</h1>
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
											<button class="btn btn-default" type="button">奄沙</button>
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
											韻壱脊艦陥.!!!
										</div>
									</div>
								</div>
							</div>

<!-- board list -->
							<div class="boardlist">
								<form name="listForm" method="post" style="margin: 0px">
									<table class="table">
	
<!-- board list head -->
										<thead class="">
											<tr>
												<th class="centercolumn" width="11%">#</th>
												<th nowrap class="board_bar">|</th>
												<th></th>								
												<th class="subject" width="54%">薦鯉</th>
												<th nowrap class="board_bar">|</th>												
												<th class="centercolumn" width="11%">越彰戚</th>
												<th nowrap class="board_bar">|</th>												
												<th class="centercolumn" width="10%">劾促</th>
												<th nowrap class="board_bar">|</th>								
												<th class="centercolumn" width="7%">繕噺</th>
												<th nowrap class="board_bar">|</th>
												<th class="centercolumn" width="7%">蓄探</th>
											</tr>
											<tr>
												<th class="bg_board_title_02" height="1" colspan="12" style="overflow: hidden; padding: 0px"></th>
											</tr>
										</thead>
	
<!-- board body -->
										<tbody>
<%
	int size = list.size();
	if (size != 0) {
		for (FreeBoardDto dto: list) {
		//	System.out.println(reboardDto.getSubject());
%>
										<tr>
												<td class="centercolumn"><%=dto.getSeq()%></td>
												<td></td>
												<td nowrap class="onetext" style="padding-right: 5px"></td>												
												<td class="subject" style="word-break: break-all;">
													<a href="javascript:viewArticle('<%=dto.getSeq()%>');">
													<img src="/bipbip1/img/board/blank.gif" width="<%=dto.getLev() * 10 %>" height="1">
														<%=dto.getSubject()%>&nbsp;&nbsp;&nbsp;
													</a>
												</td>
												<td></td>												
												<th class="centercolumn" style="word-break: break-all;"><%=dto.getName()%></th>	
														<td></td>
																															
												<td align="center" class="centercolumn"><%=dto.getLogtime()%></td>
														<td></td>
												
												<td align="center" class="centercolumn"><%=dto.getHit()%></td>
														<td></td>												
												<td align="center" class="centercolumn">蓄探</td>
											</tr>
											<tr>
												<td bgcolor="#ededed" height="1" colspan="12" style="overflow: hidden; padding: 0px"></td>
											</tr>											
<%
	}
} else {
%>
<!-- if there is no article searched -->
											<tr>
												<td  align="center" class="text_gray" colspan="11">
												<br/>
													惟獣越戚 蒸柔艦陥.
												<br/>
												</td>
											</tr>
											<tr>
												<td bgcolor="#ededed" height="1" colspan="12"
													style="overflow: hidden; padding: 0px"></td>
											</tr>
	
<%
}
%>
										</tbody>
									</table>
								</form>
<!-- paging navigation -->
								<div class="container-fluid">
									<div class="row" style="text-align: center;">
										<div class="col-md-12">
											<ul class="pagination">
 <%=pageNavigation.getNavigator()%>
												<li>
													<a><%=pageNavigation.getPageNo()%>/<%=pageNavigation.getTotalPageCount()%></a>
												</li>
											</ul>
										</div>
									</div>
								</div>				
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
											<option value='subject' selected>薦鯉</option>
											<option value='content'>鎧遂</option>
											<option value='subject||content'>薦鯉+鎧遂</option>
											<option value='id'>噺据焼戚巨</option>
											<option value='name'>戚硯</option>
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
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#writemodal">越床奄</button>
							</div>
						</div>
					</div>
				</section>				
<!-- aside hot content-->
				<aside class="">
					<div style="margin-bottom: 5px; text-align: center;">
						<h3>* 昔奄越 *</h3>
					</div>
					<div class="hotlist">
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>食奄澗 蓄探呪 100戚雌 鞠澗 越戚 神澗 員</p>
						<p>神兄走</p>
					</div>
				</aside>
				<aside class="">
					<div class="ads">
						<p>韻壱遂 凪戚走 脊艦陥.</p>
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
							<h4 class="modal-title">越床奄</h4>
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
										<label for="usr">薦鯉</label>
										<input type="text" class="form-control" id="subject" name="subject" />
									</div>
								</div>
								<label for="usr">鎧遂</label>
								<div id="summernote">
									<p>訊 坦製拭 滴奄亜 壱舛戚 照 吃猿?</p>
									<p>訊 訊 薦戚汀軒研 昔縦 公 馬澗闇走.. ばば</p>
									<p>越 潤爽室推!!</p>
									<p>訊 照 吃猿推?</p>
									<p>せせせせせ</p>
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
alert("採旋箭廃 URL 羨悦脊艦陥.");
document.location.href = "/bipbip1/index.jsp";
</script>
<%
}
%>