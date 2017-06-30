<%@page import="com.kitri.util.Encoding"%>
<%@page import="com.kitri.util.NumberCheck"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String root = request.getContextPath();
int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String key = Encoding.nullToBlank(request.getParameter("key"));
String word = Encoding.isoToEuc(request.getParameter("word"));
%>
<head>
  
  
   <!-- Custom CSS -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    <script type="text/javascript">
function writeArticle(){
	if(document.writeForm.subject.value == ""){
		alert("제목을 입력하세요");
		return;
	}else if(document.writeForm.content.value == ""){
		alert("내용을 입력하세요");
		return;
	}else{
		document.writeForm.action = "<%=root%>/picture";
		document.writeForm.submit();
	}
}
</script>
    
</head>
<body>

  
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">gallery
                    <small></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="\bipbip1\upload\album\170627\book41.jpg" alt="111">
                </a>
            </div>
        </div>
        
        <!-- /.row -->

        <hr>

        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->


<!-- write button & write modal -->
		<div class="container">
			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">
				글쓰기
			</button>
			
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					
<!-- write modal header -->			
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">글쓰기</h4>
						</div>
<!-- write modal body -->			
						<div class="modal-body">
							<form name="writeForm" method="post" action=""
							enctype="multipart/form-data">
							  	<input type="hidden" name="act" value="write">
								<!-- <input type="hidden" name="bcode" value="3"> -->
								<input type="hidden" name="pg" value="1">
								<input type="hidden" name="key" value="">
								<input type="hidden" name="word" value="">
								
							    
							    <div class="form-group">
							      <label for="usr">제목</label>
							      <input type="text" class="form-control" id="subject" name="subject">
							    </div>
							    <div class="form-group">
							      <label for="usr">사진첨부</label>
							      <input type="file" class="form-control" id="picturename" name="picturename" size="76" >
							    </div>
							    <div class="form-group">
									<label for="comment">Comment:</label>
									<textarea class="form-control" rows="15" id="content" name="content"></textarea>
								</div> 
							</form>
						</div>
<!-- write modal body -->						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="writeBtn">
							<a href="javascript:writeArticle();">Write</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">
							 <a href="javascript:history.back();">  Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
      

        

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
