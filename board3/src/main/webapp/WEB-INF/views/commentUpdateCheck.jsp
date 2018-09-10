<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
		<table border="1" align="center">

		<tr>
			<td align="center"
				style="font-size: 12px; font-weight: bold; color: red;">비밀번호를 입력해 주세요</td>
		</tr>
		<tr>
			<td align="center">
			<input type="hidden" name="num" value="${vo.num }">
			<input type="password" name="password" id="password"  /> 
			<input type="hidden" name="comment_num" value="${cvo.comment_num }"> 
			<input type="button" value="확인" onclick="commentUpdate()" id="update" /> 
			<input type="button" value="취소" onclick="window.close()"></td>
		</tr>
	</table>
</body>
<script src="resources/jquery/jquery-3.3.1.min.js"
	type="text/javascript">
</script>
<script type="text/javascript">
	function commentUpdate() {
		var con = confirm("정말로 수정 하시겠습니까");
		var num = "${vo.num}";
		var comment_num = "${cvo.comment_num}";
		
		var name = $('#name').val();
		var password = $('#password').val();
		var content = $('#content').val();
	
		

		if (con == true) {
			$.ajax({
				url : "commentUpdateCheck.do",
				type : "post",
				dataType:"json",
				
				 data: {
					 comment_num:comment_num,
					 password: password
					
					
					 	}
				, success : function(data) {

					if (data.pc == true) {
						alert("비밀번호 확인되었습니다.");
						  opener.parent.commentUpdate(comment_num,password);
						 //opener.location.reload();
						self.close();
					} else if (data.pc == false) {
						alert("비밀번호가 틀렸습니다 다시 입력해주세요");
					}
				},
				error : function(data) {
					alert("비밀번호를 확인해주세요");
				}
			});
		} else {
			self.close();
		}
	}
	
</script>
</html>