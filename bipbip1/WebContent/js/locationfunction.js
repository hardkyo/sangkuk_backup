
		// 이곳은 map 패키지에서 좌표 값과 주소값을 보내기 위한 함수들을 정리한 곳입니다. //

/*	var loc1X;
	var loc1Y;
	var loc2X;
	var loc2Y;
	var sec1X;
	var sec1Y;
	var sec2X;
	var sec2Y;
	var sec3X;
	var sec3Y;
	var loc1;
	var loc2;
	var sec1;
	var sec2;
	var sec3;
	var memo;
	var mapHit;*/


////// 컨트롤러로 변수값 보내기 ///////////////////////
	function moveLoc() {
		var memo = "";
		document.getElementsByClassName("memo").value = memo;
		document.draftForm.memo.value = memo;
		document.draftForm.action = root + "/map";
		document.draftForm.submit();
	}