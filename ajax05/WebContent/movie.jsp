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
		var commList =document.getElementById("commList");
		
		xhrList.onreadystatechange =function(){
			if(xhrList.readyState==4 && xhrList.status==200){
				var json =JSON.parse(xhrList.responseText);
				commList.innerHTML ="";
				for(var i=0; i<json.length; i++){
					commList.innerHTML +="아이디:" + json[i].id + "<br>" +
					"댓글:" + json[i].comments + "<br>";
				}
			}
		}
		xhrList.open('get', 'comments.do?mnum=${vo.mnum}', true);
		xhrList.send();
	}
	
	var xhrInsert =null;
	function insertComm(){
		xhrInsert =new XMLHttpRequest();
		
		var id =document.getElementById("id").value;
		var comments =document.getElementById("comments").value;
		
		xhrInsert.onreadystatechange =function(){
			if(xhrInsert.readyState==4 && xhrInsert.status==200){
				var data =xhrInsert.responseText;
				var json =JSON.parse(data);
				if(json.insertResult){
					alert("댓글작성 성공!");
					getList();
				} else {
					alert("댓글작성 실패!");
				}
			}
		}
		xhrInsert.open('post', 'insert.do', true);
		xhrInsert.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhrInsert.send('mnum=${vo.mnum}' + '&id=' + id + '&comments=' + comments);
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
		댓글 <textarea id="comments" cols="30" rows="3"></textarea><br />
		<input type="button" value="등록" onclick="insertComm()"/>
		<!-- ajax로 댓글 등록하고 성공/실패 메시지 alert로 보이기 -->
	</div>
</div> 

</body>
</html>