<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberVO member = (MemberVO)request.getAttribute("memberdetail");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
	<td>뭘라 사진 넣어 그냥</td>
	</tr>
	<tr>
	<td>회원ID</td>
	<td><%=member.getMem_id() %></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><%=member.getMem_pass() %></td>
	</tr>
	<tr>
	<td>회원이름</td>
	<td><%=member.getMem_name() %></td>
	</tr>
	<tr>
	<td>전화번호</td>
	<td><%=member.getMem_addr() %></td>
	</tr>
	<tr>
	<td><input type="button" value="수정" onclick="location.href='/modify.do'"><input type="button" value="삭제" onclick="location.href='/delete.do'"><input type="button" value="회원목록" onclick="location.href='/list.do'"></td>
	</tr>
	
	
	
	</table>
	
</body>
</html>