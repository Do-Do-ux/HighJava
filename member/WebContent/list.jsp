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
<title>회원 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    td a {
        text-decoration: none;
        color: #333;
    }
    td a:hover {
        color: #555;
    }
    input[type="button"] {
        padding: 10px 20px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="button"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <div class="container">
        <table>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="추가하기" onclick="location.href='/memAdd.do'">
                </td>
            </tr>
            <tr>
                <th>ID</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>전화</th>
                <th>주소</th>
            </tr>
            <%
            for(MemberVO mv : memList){
            %>
            <tr>
                <td><a href="<%= request.getContextPath() %>/memberdetail.do?memId=<%= mv.getMem_id() %>"><%= mv.getMem_id() %></a></td>
                <td><%= mv.getMem_pass() %></td>
                <td><%= mv.getMem_name() %></td>
                <td><%= mv.getMem_tel() %></td>
                <td><%= mv.getMem_addr() %></td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>
