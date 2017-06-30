<%@page import="java.io.Console"%>
<%@page import="com.kitri.map.model.MapDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=6d432994bce4d7c8c4c3ad20a20c496b&libraries=services,clusterer,drawing"></script>

	<%@ include file="/common/public.jsp" %>
<%
	MapDto mapDto = (MapDto) request.getAttribute("mapDto");
	if(mapDto!=null){
%>



<link rel="stylesheet" type="text/css" href="<%=root%>/css/mapCss.css" />
<body>

<section id="map">


<div class="map_place"></div>

<div class="right">

	<section class="top">
<h3>안녕하새오<br>
여기는 뷰 페이지에오</h3>
	</section><!--top-->
    
    
    <div class="nav">
    
    	<div class="li lil">
    	<div class="na_01 na">출발</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getLoc1() %></div>
        <div class="na_03 na">입력</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na">도착</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getLoc2() %></div>
        <div class="na_03 na">입력</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na sz">경유1</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getSec1() %></div>
        <div class="na_03 na">입력</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na sz">경유2</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getSec2() %></div>
        <div class="na_03 na">입력</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na sz">경유3</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getSec3() %></div>
        <div class="na_03 na">입력</div>
    	</div>
        
        
        
    </div>
    
    <div class="textarea">
    	
        <div class="memo_top">&nbsp;&nbsp;메모 01</div>
           <textarea class="memo"><%=mapDto.getMemo() %></textarea>
         
         <div class="button">
            <div class="ok">등록</div>
            <div class="no">취소</div>
        </div>
    </div>
    
    
</div><!--right-->

</section>

</body>
<%
	} else { 

%>


<script>
alert("Unathorized URL access.");

</script>

	<%
}
%>