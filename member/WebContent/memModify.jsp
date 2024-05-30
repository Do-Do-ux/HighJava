<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    MemberVO member = (MemberVO)request.getAttribute("mv"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
    }
    table tr td:first-child {
        width: 30%;
        font-weight: bold;
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>회원 정보 수정</h1>
        <form action="memModify.do" method="post" >
            <table>
                <tr>
                    <td>회원 ID</td>
                    <input type="hidden" name="memId" id="memId" value="<%= member.getMem_id() %>">
                    <td><%= member.getMem_id() %></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="text" name="memPass" value="<%= member.getMem_pass() %>"></td>
                </tr>
                <tr>
                    <td>회원 이름</td>
                    <td><input type="text" name="memName" value="<%= member.getMem_name() %>"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="memTel" value="<%= member.getMem_tel() %>"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="memAdr" value="<%= member.getMem_addr() %>"></td>
                </tr>
                <tr>
                    <td>프로필사진</td>
                    <td><input type="file" name="memPhoto"></td>
                </tr>
            </table>
            <input type="submit" value="수정">
        </form>
    </div>
</body>
</html>
