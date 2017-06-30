<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- services�� clusterer, drawing ���̺귯�� �ҷ����� -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=6d432994bce4d7c8c4c3ad20a20c496b&libraries=services,clusterer,drawing"></script>
	<%@ include file="/common/public.jsp" %>
<script type="text/javascript" src="<%=root%>/js/mapfunction.js"></script>
<script type="text/javascript" src="<%=root%>/js/locationfunction.js"></script>

<link rel="stylesheet" type="text/css" href="<%=root%>/css/mapCss.css" />

<script type="text/javascript">
	var root = "<%=root%>";

	var addr = null; // �ʿ��� �ּҰ� ���� ������ ���� �� �ֵ��� �Լ��� �����ؾ��Ѵ�.

	var flag = false; //ī�װ� �˻� �� ���� ������������ �浹 ����
	var tag = ""; // ī�װ� ��
	var keyword = null;

	var latlng;
	
	// ������ ǥ�õ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
	var markers = [];

	
</script>

<body>
	<section id="map">
		<div id="map_place" style="width: 500px; height: 400px;"></div>
		<script>
			var cen1 = 37.57319;
			var cen2 = 126.96658;
			var container = document.getElementById('map_place');
			var options = {
				center : new daum.maps.LatLng(cen1, cen2),
				level : 3
			};
		
			var map = new daum.maps.Map(container, options);
			//////////////////////////
			// ������ ��Ʈ�ѷ��� �߰����ݴϴ�. //
			//////////////////////////
			// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
			var mapTypeControl = new daum.maps.MapTypeControl();
		
			// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
			// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
			// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
			// ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
			var marker = new daum.maps.Marker({});
			// ������ ��Ŀ�� ǥ���մϴ�
			//marker.setMap(map);
		
			//////////////////////
			// �ּҰ� ȣ���� ���� �ڵ� //
			//////////////////////
			infowindow = new daum.maps.InfoWindow({
				zindex : 1
			}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�
		
			//�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
			var geocoder = new daum.maps.services.Geocoder();
		
			// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
			// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
		
			////////////////////////////////////////////
			// ���콺 Ŭ�� �̺�Ʈ (Ŭ���� ��Ŀ�� ��ǥ ���� �����´�) //////
			////////////////////////////////////////////
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {
				// ������ ��Ŀ�� ǥ���մϴ�
				marker.setMap(map);
		
				// Ŭ���� ����, �浵 ������ �����ɴϴ� 
				latlng = mouseEvent.latLng;
		
				// ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
				marker.setPosition(latlng);
		
				//////////////////////////////////////////////
				// ���콺 Ŭ�� �̺�Ʈ (Ŭ���� �ش� ��ǥ�� �ּҸ� ��ȯ�Ѵ�.) //
				//////////////////////////////////////////////
		
				searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
					if (status === daum.maps.services.Status.OK) {
						var detailAddr = !!result[0].roadAddress.name ? '<div>���θ��ּ� : ' + result[0].roadAddress.name + '</div>' : '';
						detailAddr += '<div>���� �ּ� : ' + result[0].jibunAddress.name + '</div>';
		
						var content = '<div class="bAddr">' +
							'<span class="title">������ �ּ�����</span>' +
							detailAddr +
							'</div>';
		
						// ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
						infowindow.setContent(content);
						infowindow.open(map, marker);
		
		
						addr = result[0].jibunAddress.name;
					}
				});
			});		
		</script>
		
		
		<div class="right">
			<p>
				<input type="checkbox" id="chkBicycle"
					onclick="javascript:setOverlayMapTypeId();" /> �����ŵ��� ���� ����
			</p>

			<!-- ���� �ѱ�� ���� form -->
			<form id="draftForm" name="draftForm" method="post" action=""
				style="margin: 0px">
				<input type="hidden" name="act" value="mapwrite">
				<input type="hidden" name="loc1X" value="">
				<input type="hidden" name="loc1Y" value="">
				<input type="hidden" name="loc2X" value="">
				<input type="hidden" name="loc2Y" value="">
				<input type="hidden" name="sec1X" value="">
				<input type="hidden" name="sec1Y" value="">
				<input type="hidden" name="sec2X" value="">
				<input type="hidden" name="sec2Y" value="">
				<input type="hidden" name="sec3X" value="">
				<input type="hidden" name="sec3Y" value="">
				<input type="hidden" name="loc1" value="">
				<input type="hidden" name="loc2" value="">
				<input type="hidden" name="sec1" value="">
				<input type="hidden" name="sec2" value="">
				<input type="hidden" name="sec3" value="">
				<input type="hidden" name="memo" value="">
				
				<input type="hidden" name="bcode" value="">
				<input type="hidden" name="pg" value="1">
				<input type="hidden" name="key" value="">
				<input type="hidden" name="word" value="">
			</form>
			<section class="top">

				<!-- �޺� �ڽ� ���ÿ� ���� ī�װ��� ���� -->
				<div class="select">
					<select class="sel" id="tag" onselect="" onclick="removeMarker()">
						<option selected class="sele"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</font></option>
						<option class="selc" value="CS2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������</option>
						<option class="selc" value="FD6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�Ĵ�</option>
						<option class="selc" value="AD5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</option>
					</select>
				</div>

				<div class="search">
					<input type="search" class="ser" id=sertxt>
					<div class="q" onclick='search()'></div>
				</div>

			</section>
			<!--top-->

			<!-- �� ����ó�� �ּ� �� �� ��ǥ�� ���� -->
			<div class="nav">

				<div class="li lil">
					<div class="na_01 na">���</div>
					<div class="na_02 na">
						<input type="text" class="text" id="get1">
					</div>
					<div class="na_03 na" onclick='input_Text1()'>�Է�</div>
				</div>

				<div class="li">
					<div class="na_01 na">����</div>
					<div class="na_02 na">
						<input type="text" class="text" id="get2">
					</div>
					<div class="na_03 na" onclick='input_Text2()'>�Է�</div>
				</div>

				<div class="li">
					<div class="na_01 na sz">����1</div>
					<div class="na_02 na">
						<input type="text" class="text" id="get3">
					</div>
					<div class="na_03 na" onclick='input_Text3()'>�Է�</div>
				</div>

				<div class="li">
					<div class="na_01 na sz">����2</div>
					<div class="na_02 na">
						<input type="text" class="text" id="get4">
					</div>
					<div class="na_03 na" onclick='input_Text4()'>�Է�</div>
				</div>

				<div class="li">
					<div class="na_01 na sz">����3</div>
					<div class="na_02 na">
						<input type="text" class="text" id="get5">
					</div>
					<div class="na_03 na" onclick='input_Text5()'>�Է�</div>
				</div>
			</div>
			
			<!-- ��Ÿ ������ ���� ��� ĭ -->
			<div class="textarea">

				<div class="memo_top">&nbsp;&nbsp;�޸� 01</div>
				<textarea class="memo" id="memo"></textarea>

				<div class="button">
					<div class="ok" onclick="moveLoc()">���</div>
					<div class="no">���</div>
				</div>
			</div>
		</div>
		<!--right-->
	</section>

</body>
