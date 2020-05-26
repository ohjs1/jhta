<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.comm {
		width: 400px;
		height: 100px;
		border: 1px solid #aaa; 
		margin-bottom: 5px;
	}
</style>
<script type="text/javascript">
	var xhrList =null;
	function getList(){
		xhrList =new XMLHttpRequest();
		xhrList.onreadystatechange =listOk;
		xhrList.open('get', 'comments.do?mnum=${vo.mnum}', true);
		xhrList.send();
	}
	
	function listOk(){
		if(xhrList.readyState==4 && xhrList.status==200){
			delAll(); //기존댓글 지우기
			var xml =xhrList.responseXML;
			//alert(xml);
			var comm =xml.getElementsByTagName("comm");
			var commList =document.getElementById("commList");
			
			for(var i=0; i<comm.length; i++){
				var id =comm[i].getElementsByTagName("id")[0].firstChild.nodeValue;
				var comments =comm[i].getElementsByTagName("comments")[0].firstChild.nodeValue;
				var div =document.createElement("div");
				
				var num =xml.getElementsByTagName("num")[i].firstChild.nodeValue;
				
				div.innerHTML ="아이디:" + id + "<br>" + "내용:" + comments +
									"<br>" + "<input type='button' value='삭제' onclick='delComm( + " + num + ")'>";
				
				div.className ="comm";
				commList.appendChild(div);
			}
		}
		
	}
	
	var xhrDel =null;
	function delComm(num){
		xhrDel =new XMLHttpRequest();
		xhrDel.onreadystatechange =delOk;
		xhrDel.open('post', 'delete.do', true);
		
		//post방식인 경우 콘텐츠타입 지정하기
		xhrDel.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhrDel.send('num=' + num);
	}
	
	function delOk(){
		if(xhrDel.readyState==4 && xhrDel.status==200){
			var xml =xhrDel.responseXML;
			var code =xml.getElementsByTagName("code")[0].firstChild.nodeValue;
			
			if(code=='sucess'){
				getList();
			}
		}
	}

	
	var xhr =null;
	function insertComm(){
		xhr =new XMLHttpRequest();
		xhr.onreadystatechange =insertOk;
		var id =document.getElementById("id").value;
		var comments =document.getElementById("comments").value;
		
		xhr.open('post', 'insert.do', true);
		//post방식인 경우 콘텐츠타입 지정하기
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send('id=' + id + '&comments=' + comments + '&mnum=${vo.mnum}');
	}

	function insertOk(){
		if(xhr.readyState==4 && xhr.status==200){
			var xml =xhr.responseXML;
			var code =xml.getElementsByTagName("code")[0].firstChild.nodeValue;
			
			if(code=='sucess'){
				alert("글등록 성공!");
				
				getList();
			} else {
				alert("글등록 실패!");
			}
		}
	}
	
	function delAll(){ //전체댓글 지우기
		var commList =document.getElementById("commList");
		var childs =commList.childNodes; //전체자식 노드 얻어오기 (전체댓글)
		
		var len =childs.length;
		
		for(var i=len-1; i>=0; i--){
			var comments =childs.item(i);
			commList.removeChild(comments);
		}
	}

</script>
</head>
<body onload="getList()">
<h1>영화 상세 페이지</h1>
<div>
	<h1>${ vo.title }</h1>
	<p>
		내용 : ${ vo.content }<br>
		감독 : ${ vo.director }
	</p>
</div>
<div><!-- 댓글이 보여질 div -->
	<div id="commList"></div>
	<div>
		아이디 <input type="text" id="id" /><br />
		댓글 <textarea name="" id="comments" cols="30" rows="3"></textarea><br />
		<input type="button" value="등록" onclick="insertComm()"/>
		<!-- ajax로 댓글 등록하고 성공/실패 메시지 alert로 보이기 -->
	</div>
</div> 

</body>
</html>