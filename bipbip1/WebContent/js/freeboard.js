$(document).ready(function() {
    $('#summernote').summernote({
  	  height: 400,
	  minHeight: 200,
	  maxHeight: null,
	  focus: true
    });
});

/*$('#summernote').summernote({
	  height: 350,
	  minHeight: 200,
	  maxHeight: null,
	  focus: true
	});*/

//function write() {
//	document.location.href = "/admin?act=main";
////	document.writeForm.action.value = "<%=root%>/freeboard";
////	document.writeForm.submit();
//}

function freeboardwrite() {
	var markupStr = $('#summernote').summernote('code');
	alert(markupStr);
	alert(document.getElementById("subject").value);
	document.writeForm.content.value = markupStr;
	document.writeForm.action = "./freeboard";
	document.writeForm.submit();
}

function searchArticle () {
		document.searchForm.action = "./freeboard";
		alert(document.searchForm.key.value);
		alert(document.searchForm.word.value);
		document.searchForm.submit();
}

// ���� ���� ���� �� ����
//function myArticle(id) {	
//	document.commonForm.act.value = "list";
//	document.commonForm.bcode.value = "<%=bcode%>";
//	document.commonForm.pg.value = "1";
//	document.commonForm.key.value = "id";
//	document.commonForm.word.value = id;
//	document.commonForm.action = "<%=root%>/freeboard";
//	document.commonForm.submit();
//}

// ���â�� ����ؼ� �ʿ� ������
//function moveWrite() {
//	document.commonForm.act.value = "mvwrite";
//	//���Ϸ� ���������� bcode, pg, key, word�� �׷��� ��� ��������?
//	document.commonForm.bcode.value = bcode;
//	document.commonForm.pg.value = "1";
//	document.commonForm.key.value = "";
//	document.commonForm.word.value = "";
//	
//	document.commonForm.action = root + "/freeboard";
//	document.commonForm.submit();
//}

function firstArticle() {
	document.commonForm.act.value = "list";
	document.commonForm.bcode.value = bcode;
	document.commonForm.pg.value = "1";
	document.commonForm.key.value = "";
	document.commonForm.word.value = "";
	document.commonForm.action = root + "/freeboard";
	document.commonForm.submit();
}

function listArticle(mpg) {
	document.commonForm.act.value = "list";
	document.commonForm.bcode.value = bcode;
	document.commonForm.pg.value = mpg;
	document.commonForm.key.value = key;
	document.commonForm.word.value = word;
	document.commonForm.action = root +"/freeboard";
	document.commonForm.submit();
}

function viewArticle(seq) {
	document.commonForm.act.value = "view";
	document.commonForm.bcode.value = bcode;
	document.commonForm.pg.value = pg;
	document.commonForm.key.value = key;
	document.commonForm.word.value = word;
	document.commonForm.seq.value = seq;
	document.commonForm.action = root + "/freeboard";
	document.commonForm.submit();
}