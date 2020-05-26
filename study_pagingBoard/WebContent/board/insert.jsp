<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board - insert</title>
<link rel="stylesheet" href="${ cp }/css/main.css" />
</head>
<body>
	<h1>글쓰기</h1>
	<form action="${ cp }/board/insert" method="post">
	<!-- 답글인 경우 부모글에 대한 정보 보내기 -->
	<input type="hidden" name="num" value="${ param.num }">
	<input type="hidden" name="ref" value="${ param.ref }">
	<input type="hidden" name="lev" value="${ param.lev }">
	<input type="hidden" name="step" value="${ param.step }">
	
		<table>
			<tr>
				<th>글 쓴이</th>
				<td><input type="text" class="textf" name ="writer"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="textf" name="title"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" cols="30" rows="10" name="content"></textarea></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="등록 하기" />
	</form>
</body>
</html>