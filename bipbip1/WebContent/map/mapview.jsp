<%@page import="java.io.Console"%>
<%@page import="com.kitri.map.model.MapDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- services�� clusterer, drawing ���̺귯�� �ҷ����� -->
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
<h3>�ȳ��ϻ���<br>
����� �� ����������</h3>
	</section><!--top-->
    
    
    <div class="nav">
    
    	<div class="li lil">
    	<div class="na_01 na">���</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getLoc1() %></div>
        <div class="na_03 na">�Է�</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na">����</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getLoc2() %></div>
        <div class="na_03 na">�Է�</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na sz">����1</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getSec1() %></div>
        <div class="na_03 na">�Է�</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na sz">����2</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getSec2() %></div>
        <div class="na_03 na">�Է�</div>
    	</div>
        
        <div class="li">
    	<div class="na_01 na sz">����3</div>
        <div class="na_02 na"> <input type="text" class="text"><%=mapDto.getSec3() %></div>
        <div class="na_03 na">�Է�</div>
    	</div>
        
        
        
    </div>
    
    <div class="textarea">
    	
        <div class="memo_top">&nbsp;&nbsp;�޸� 01</div>
           <textarea class="memo"><%=mapDto.getMemo() %></textarea>
         
         <div class="button">
            <div class="ok">���</div>
            <div class="no">���</div>
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