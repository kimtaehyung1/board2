<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/update.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h2 style="text-align: center;">수정</h2>
		<div class="div_list">
			<input type="button" onclick="window.location='list.do'" value="전체목록" class="list_button_input">
		</div>
		<form name="update" method="post" id="update" action="update.do"
			onsubmit="return check()">
			<input type="hidden" name="num" value="${vo.num }">
			<table width="20%" class="insert-table" border="1px">
				<tbody>
					<tr>
						<td><b class="insert_name">번호</b><span>${vo.num }</span></td>
						
					</tr>
					<tr>	
						<td><b class="insert_name">조회</b><span>${vo.read_count }</span></td>
					</tr>
					
					<tr>
						<td><b class="insert_name">이름</b> <input name="name"
							id="name"  class="name_input" value="${vo.name }" maxlength="15">
							<a style="    margin-left: 20px; color: red; text-decoration: none;" href="#"><span>TIP</span>
    						<p class="arrow_box">"이름은 전체 15글자 이하만 입력해주세요(공백포함)"</p></a>
							</td>
					</tr>
					
					<tr>
						<td><b class="insert_password">비밀번호<input class="input-checkbox" type="checkbox" id="checkbox"></b>
							<input name="password" id="password" onchange="passInput(this)" value="${vo.password }" type="password" class="insert_input" maxlength="10">
							<h4 style="color: red; font-size: 10px;margin-bottom: 0px; margin-top: 0px;" id="passCheck"></h4>
							<a style="  margin-left: 20px; color: red; text-decoration: none;" href="#"><span>TIP</span>
    						<p class="arrow_box">"최소8~10자리  숫자, 문자, 특수문자 각각 1개 이상 포함(공백없음)"</p></a>
    						
						</td>
					</tr>
					<tr>
						<td><b class="insert_title">제목</b> <input name="title"
							 id="title" class="title_input" value="${vo.title }" maxlength="50">
							<a style=" margin-left: 20px; color: red; text-decoration: none;" href="#"><span>TIP</span>
    						<p class="arrow_box">"한글, 영어,숫자포함 50자 이하 글자(공백포함)"</p></a></td>
					</tr>
					<tr>
						<td class="wrap"><b class="insert_content">내용</b> 
					<textarea  class="text_input"  maxlength="1300" name="content" id="content" >${vo.content }</textarea></td>
					</tr>
					<tr>
					<td style="text-align: center;">
					<span  id="counter" ></span>
					</td></tr>
					<tr>
					<td><b class="insert_name">날짜</b><fmt:formatDate value="${vo.write_date }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</table><!--  -->
			<div style="text-align: center;">
			<input type="submit" value="저장" id="save" > 
			</div>
		</form>
	
</body>
<script src="resources/jquery/jquery-3.3.1.min.js"
	type="text/javascript">
</script>
<script type="text/javascript">


/* 
function nameInput(obj){
	var val = obj.value;
	if (obj.value.length >= 10){
			alert("이름은 20글자이하로 작성해주세요(공백포함)");
			obj.value = val.substring(0,10);
			$('select[name=password]').focus();
			}
}
*/	
	function passInput(obj){
		var val = obj.value;
		var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,10}$/;
		
		 if (passReg.test(val)) {
			obj.value = val.replace(/^\s+/,'');
			
		}if (passReg.test(val)){
			obj.value = val.replace(/\-/g,'');
			
		}if (obj.value.length >= 11) {
			obj.value = val.substring(0,11);
			alert("비밀번호는 최소 8자리 이상 10자리 이하 자릿수를  입력하세요");
			}
		if (passReg.test(val)) {
			$('#passCheck').text("양식에 올바릅니다.");
			$('#passCheck').css("color", "green");
		} else {
			$('#passCheck').text("양식에 올바르지 않습니다.");
			$('#passCheck').css("color", "red");
		}
		$('select[name=title]').focus();
		}
/*	function titleinput(obj){
		var val = obj.value;
		if (obj.value.length >= 60) {
				alert("전체 50글자 이하만 입력해주세요(공백포함)");
				obj.value = val.substring(0,60);
				$('select[name=title]').focus();
				}
			$('select[name=content]').focus();
	} 
 	function textarea(obj){
		var val = obj.value;
		if (obj.value.length >= 1300) {
				alert("전체 1300글자 이하만 입력해주세요(공백포함)");
				obj.value = val.substring(0,1300);
				$('select[name=content]').focus();
				}
			$('select[name=content]').focus();
	}
	 */
	

		 	function check(){
		 		var name = $('#name').val();
		 		var password = $('#password').val();
		 		var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,10}$/;
		 		var title = $('#title').val();
		 		var content = $('#content').val();
		 		var blank = /[\s]/g;
		 		
		 		if(name == ""){
		 			alert("이름을 입력하세요");	
		 			 $('#name').focus();
		 			return false;
		 			
		 		}else if(name.length == 0 || !name.trim()){
		 			alert("연속적인 공백은 입력이 안됩니다");
		 			return false;
		 	
		 		}else if(blank.exec(name)){
		 			alert("공백은 입력할수 없습니다");
		 			 $('#name').focus();
		 			return false; 
		 			 
		 		}else if(password == ""){
		 	 		alert("비밀번호를 입력하세요");
		 	 		$('#password').focus();
		 	 		return false;
		 	 		
		 		}else if(blank.exec(password)){
		 			alert("비밀번호를 입력하세요 ");
		 			$('#password').focus();
		 			return false;	
		 	
		 		}else if(title == ""){
		 			alert("제목을 입력하세요");
		 			$('#title').focus();
		 	 		return false;
		 		}else if(title.length == 0 || !title.trim()){
		 			alert("연속적인 공백은 입력이 안됩니다");
		 			return false;
		 		
		 		}else if(content == ""){
		 			alert("내용을 입력하세요");
		 			$('#content').focus();
		 			return false;	
		 		}else if(content.length == 0 || !content.trim()){
		 			alert("연속적인 공백은 입력이 안됩니다");
		 			return false;
		 		
		 		}
		 		else return true;
		 	}
	$('#save').click(function(){
		alert("수정되었습니다");
	})	 	
 
 	$('#content').bind('input propertychange', function() {
 	   console.log($(this).val());
 	});
 	// textarea에 입력된 문자의 바이트 수를 체크
 		$(function() {
 		    $("#content").keyup(function (e){
 		        var content = $(this).val();
 		        $("#counter").html("("+ content.length + "/1300"+")");
 		    });
 		    
 		    $("#content").keyup();
 		});
 	
 	
 	
 	// 비밀번호 체크 숨기기/보이기
 	jQuery('#toggle').click(function () {  
 	    if($("#id").css("display") == "none"){   
 	        jQuery('#id').show();  
 	    } else {  
 	        jQuery('#id').hide();  
 	    }  
 	});  
 	$(document).ready(function() {
		$("#checkbox").change(function() {

			// Check the checkbox state, 체크박스 상태 체크
			if ($(this).is(':checked')) {
				// Changing type attribute
				$("#password").attr("type", "text");

				// Change the Text, 텍스트 변경
				$("#toggleText").text("Hide");
			} else {
				// Changing type attribute, 입력 속성 변경하기
				$("#password").attr("type", "password");

				// Change the Text, 텍스트 변경하기
				$("#toggleText").text("Show");
			}
		});
	});
 	$('#content').bind('input propertychange', function() {
  	   console.log($(this).val());
  	});
  	// textarea에 입력된 문자의 바이트 수를 체크
  		$(function() {
  		    $("#content").keyup(function (e){
  		        var content = $(this).val();
  		        $("#counter").html("("+ content.length + "/1300"+")");
  		    });
  		    $("#content").keyup();
  		});
</script>
</html>