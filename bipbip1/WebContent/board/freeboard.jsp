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
				<h1>�����Խ���</h1>
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
											<button class="btn btn-default" type="button">�⺻</button>
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
											�����Դϴ�.!!!
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
												<th class="subject" width="54%">����</th>
												<th nowrap class="board_bar">|</th>												
												<th class="centercolumn" width="11%">�۾���</th>
												<th nowrap class="board_bar">|</th>												
												<th class="centercolumn" width="10%">��¥</th>
												<th nowrap class="board_bar">|</th>								
												<th class="centercolumn" width="7%">��ȸ</th>
												<th nowrap class="board_bar">|</th>
												<th class="centercolumn" width="7%">��õ</th>
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
												<td align="center" class="centercolumn">��õ</td>
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
													�Խñ��� �����ϴ�.
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
											<option value='subject' selected>����</option>
											<option value='content'>����</option>
											<option value='subject||content'>����+����</option>
											<option value='id'>ȸ�����̵�</option>
											<option value='name'>�̸�</option>
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
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#writemodal">�۾���</button>
							</div>
						</div>
					</div>
				</section>				
<!-- aside hot content-->
				<aside class="">
					<div style="margin-bottom: 5px; text-align: center;">
						<h3>* �α�� *</h3>
					</div>
					<div class="hotlist">
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>����� ��õ�� 100�̻� �Ǵ� ���� ���� ��</p>
						<p>������</p>
					</div>
				</aside>
				<aside class="">
					<div class="ads">
						<p>����� ������ �Դϴ�.</p>
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
							<h4 class="modal-title">�۾���</h4>
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
										<label for="usr">����</label>
										<input type="text" class="form-control" id="subject" name="subject" />
									</div>
								</div>
								<label for="usr">����</label>
								<div id="summernote">
									<p>�� ó���� ũ�Ⱑ ������ �� �ɱ�?</p>
									<p>�� �� ���������� �ν� �� �ϴ°���.. �Ф�</p>
									<p>�� ���ּ���!!</p>
									<p>�� �� �ɱ��?</p>
									<p>����������</p>
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
alert("�������� URL �����Դϴ�.");
document.location.href = "/bipbip1/index.jsp";
</script>
<%
}
%>