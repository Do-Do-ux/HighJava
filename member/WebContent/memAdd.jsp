<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, tr, td {
border: 2px solid black;

}
</style>
</head>
<body>
<table>
	<tr>
	<td>회원ID</td>
	<td><input type="button" value="중복확인"></td>
	</tr>
	<tr>
	<td>비빌번호</td>
	<td><input type="text"></td>
	</tr>
	<tr>
	<td>비빌번호 확인</td>
	<td><input type="text"></td>
	</tr>
	<tr>
	<td>회원이름</td>
	<td><input type="text"></td>
	</tr>
	<tr>
	<td>전화번호</td>
	<td><input type="text"></td>
	</tr>
	<tr>
	<td>회원주소</td>
	<td><input type="text"></td>
	</tr>
	<tr>
	<td>프로필 사진</td>
	<td><input type="file" value="파일 선택"></td>
	</tr>
	<tr>
	<td><input type="button" value="저장"><input type="button" value="취소"><input type="button" value="회원목록"></td>
	</tr>
</table>
</body>
</html>