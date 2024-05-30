<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
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
        border-collapse: collapse;
        border: 2px solid #ddd;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    input[type="text"], input[type="password"], input[type="file"], input[type="button"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="file"] {
        padding-top: 12px;
    }
    input[type="button"] {
        width: auto;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 2px;
    }
    input[type="button"]:hover {
        background-color: #45a049;
    }
    #msg {
        display: none;
        color: red;
        margin-top: 5px;
    }
</style>

</head>
<body>
<table>
	<tr>
	<td>회원ID</td>
        <td><input type="text" id="idchk" name="memId"><input type="button" value="중복확인" id="idchkbutton">
            <br><h4 id="msg"></h4>
        </td>
    </tr>
    <tr>
        <td>비밀번호</td>
            <td><input type="password" id="memPass" name="memPass"></td>
        </tr>
        <tr>
            <td>비밀번호 확인</td>
            <td><input type="password" id="confirmPass">
            <br><h4 id="matchMsg">비밀번호가 일치합니다.</h4>
            </td>
        </tr>
        
    <tr>
        <td>회원이름</td>
        <td><input type="text" name="memName"></td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td><input type="text" name="memTel"></td>
    </tr>
    <tr>
        <td>회원주소</td>
        <td><input type="text" name="memAddr"></td>
    </tr>
    <tr>
        <td>프로필 사진</td>
        <td><input type="file" name="memPhoto" value="파일선택"></td>
	</tr>
	<tr>
	<td><input type="button" value="저장" id="memberAddButton"><input type="button" value="취소" onclick="location.href='/list.do'"><input type="button" value="회원목록" onclick="location.href='/list.do'"></td>
	</tr>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
		$(document).ready(function() {
		    $('#idchkbutton').on("click", function() {
		        let idchk = $('#idchk').val();
		
		        $.ajax({
		            url: '/idchk.do',
		            method: 'GET',
		            data: { idchk: idchk },
		            dataType: 'text',
		            success: function(data) {
		            	if(data === 'usable') {
								$('#msg').text('사용 가능한 아이디입니다.').show();
							} else {
								$('#msg').text('이미 존재하는 아이디입니다.').show();
							}
						},
						error : function(xhr, status, error) {
							console.error('AJAX Error:', error);
						}
					});
				});
			});
		$('#memberAddButton').on('click', function() {
		    let memId = $('#idchk').val();
		    let memPass = $('input[name="memPass"]').val();
		    let memName = $('input[name="memName"]').val();
		    let memTel = $('input[name="memTel"]').val();
		    let memAddr = $('input[name="memAddr"]').val();
		    let memPhoto = $('input[name="memPhoto"]').val(); // 프로필 사진 경로 등
		
		    $.ajax({
		        url: '/memAdd.do',
		        method: 'POST',
		        data: {
		            memId: memId,
		            memPass: memPass,
		            memName: memName,
		            memTel: memTel,
		            memAddr: memAddr,
		            memPhoto: memPhoto
		        },
		        dataType: 'text',
		        success: function(response) {
		            alert('회원 추가에 성공했습니다.');
		            location.href='/list.do';
		            // 추가한 후 다른 처리가 필요한 경우 여기에 작성
		        },
		        error: function(xhr, status, error) {
		            console.error('AJAX Error:', error);
		            alert('회원 추가에 실패했습니다.');
		        }
		    });
		});
		
		//비밀번호 확인 체크
		 $('#confirmPass').on('input', function() {
	            let pass = $('#memPass').val();
	            let confirmPass = $(this).val();

	            if(pass === confirmPass) {
	                $('#matchMsg').text('비밀번호가 일치합니다.').show();
	            } else {
	                $('#matchMsg').hide();
	            }
	        });
	    
</script>
</body>
</html>