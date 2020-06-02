<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>영화 상세 페이지</h2>
<h3>토르</h3>
<img src="../images/001.jpg"><br>
<input type="hidden" value="1" id="mnum" />
아이디<input type="text" id="id"/><br>
내용<textarea id="content" cols="30" rows="10"></textarea><br>
<input type="button" value="댓글 등록" id="btn1" />

<script type="text/javascript">
	$("#btn1").click(function(){
		//alert('test');
		var id = $("#id").val();
		var content = $("#content").val();
		var mnum = $("#mnum").val();
		
		//console.log(id);
		//console.log(content);
		
		$.getJSON("/study_jquery/comment/insert" ,{ id: id, content: content, mnum: mnum })
		.done(function( json ){
			
		})
		.fail(function(error){
			console.log(error);
		});
	});
</script>