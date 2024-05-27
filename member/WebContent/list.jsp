<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	List<MemberVO> memList = (List<MemberVO>)request.getAttribute("memList");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,tr {
	border: 2px solid black;
	width: auto;
	height: auto;
}
td {
	border-bottom: solid black;
}


</style>
</head>
<body>
	<table>
		<tr>
		<td align="right"><input type="button" value="추가하기" onclick="location.href='/memAdd.do'"></td>
		</tr>
		<tr style="font-weight: bold;">
		<td>ID</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>전화</td>
		<td>주소</td>
		</tr>
		<%
		for(MemberVO mv : memList){
			
		%>
		<tr>
			<td><a href="<%=request.getContextPath()%>/memberdetail.do?memId=<%=mv.getMem_id()%>"><%=mv.getMem_id() %></td>
			<td><%=mv.getMem_pass() %></td>
			<td><%=mv.getMem_name() %></td>
			<td><%=mv.getMem_tel() %></td>
			<td><%=mv.getMem_addr() %></td>
		</tr>	
		<%
		}
		%>	
		
	</table>
</body>
</html>