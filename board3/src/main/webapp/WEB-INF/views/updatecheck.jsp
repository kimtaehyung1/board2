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
				<td align="center" style="font-size: 12px;font-weight:bold;color:red;">비밀번호를 입력해 주세요</td>
			</tr>
			<tr>
				<td align="center">
				 <input type="password" name="password" id="password"/>
				 <input type="hidden" name="num" value="${vo.num }">
				 <input type="button" value="확인" onclick="updatecheck()"/>
				 <input type="button" value="취소" onclick="window.close()" >
				 </td>
			</tr>
		</table>
</body>
<script src="resources/jquery/jquery-3.3.1.min.js"
	type="text/javascript">
</script>
<script type="text/javascript">
function updatecheck(){
	var con = confirm("정말로 수정하시겠습니까"); 
	var pass = $('#password').val();
	var num = "${vo.num}";
	
	if(con == true){
		
		  $.ajax({
		         type:"POST"
		         , url: "updateCheck.do"
		         , dataType:"json"
		         , data: {
		            num: num,
		            password: pass
		         }
		         , success: function(result) {
		            if( result.pc == true ) {
		               alert("비밀번호가 확인되었습니다 수정페이지로 이동하겠습니다");
		               window.opener.location.href="update.do?num="+"${vo.num}"
		               self.close();
		            } 
		            else if( result.pc == false ) {
		               alert("비밀번호가 틀렸습니다. 다시 확인해주세요")
		            }
		         }
		         , error: function(result) {
		            alert("비번확인 에러!");
		         }
		      });
	 }else {
		self.close();
	} 
}

</script>
</html>