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
    <title>회원 정보</title>
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
                <td colspan="2">
            <% 
				if(member.getMem_photo() == null){
%>
				사진 없음
<%
				} else {
%>
			<img id="img" alt="프로필 사진" src="<%=request.getContextPath()%>/images/<%=member.getMem_photo()%>">
<% 
				}
				%>
				</td>
            </tr>
            <tr>
                <td>회원ID</td>
                <td><%= member.getMem_id() %></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%= member.getMem_pass() %></td>
            </tr>
            <tr>
                <td>회원이름</td>
                <td><%= member.getMem_name() %></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><%= member.getMem_tel() %></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%= member.getMem_addr() %></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="수정" onclick="location.href='/memModify.do?memId=<%= member.getMem_id() %>'">
                    <input type="button" id="delete" value="삭제">
                    <input type="button" value="회원목록" onclick="location.href='/list.do'">
                </td>
            </tr>
        </table>
    </div>
		<script type="text/javascript">
		
		document.querySelector('#delete').addEventListener('click', function(){
				if(confirm("삭제하시겠습니까?")){
					location.href = "<%=request.getContextPath()%>/memberDelete.do?memId=<%= member.getMem_id() %>";
					alert("삭제가 완료되었습니다.")
				} else {
					alert("삭제를 취소했습니다.")			
				}
			});
		</script>
</body>
</html>
