<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/write.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>게시글작성</h2>
		<div class="div_list">
			<input type="button" onclick="window.location='list.do'" value="전체목록" class="list_button_input">
		</div>
		<form name="insert" method="post" action="insert.do"
			onsubmit="return check()">

			<table width="20%" class="insert-table" border="1px">
				<tbody>
					<tr>
						<td><b class="insert_name">작성자</b> <input name="name" maxlength="15"
							id="name"class="name_input">
							<a style=" color: red; text-decoration: none;" href="#"><span>TIP</span>
    						<p class="arrow_box">"이름은 전체 15글자 이하만 입력해주세요(공백포함)"</p></a>
							</td>
					</tr>
					
					<tr><!-- onchange="passInput(this)" -->
						<td><b class="insert_password">비밀번호<input class="input-checkbox" type="checkbox" id="checkbox"></b>
							<input name="password" id="password" type="password" class="insert_input" maxlength="10" onchange="passInput(this)">
							<h4 style="color: red; font-size: 10px;margin-bottom: 0px; margin-top: 0px;" id="passCheck"></h4>
							<a style=" color: red; text-decoration: none;" href="#"><span>TIP</span>
    						<p class="arrow_box">"최소8~10자리  숫자, 문자, 특수문자 각각 1개 이상 포함(공백없음)"</p></a>
    						
						</td>
					</tr>
					<tr>
						<td><b class="insert_title">제목</b> <input name="title"
							 id="title" class="title_input" maxlength="50">
							<a style=" color: red; text-decoration: none;" href="#"><span>TIP</span>
    						<p class="arrow_box">"한글, 영어,숫자포함 50자 이하 글자(공백없음)"</p></a></td>
					</tr>
					<tr>
						<td class="wrap"><b class="insert_content">내용</b> 
					<textarea  class="text_input"  maxlength="1300" name="content" id="content" ></textarea></td>
					</tr>
					<tr>
					<td>
					<span  id="counter" ></span>
					</td></tr>
				</tbody>
			</table><!--  -->
			<div>
			 <input type="submit" value="저장" >  
			 <input class="input_cancel" type="button" value="다시작성" onclick="reset()">
		</div>
	
		</form>
	</center>
</body>
<script src="resources/jquery/jquery-3.3.1.min.js"
	type="text/javascript">
</script>
<script type="text/javascript">
 
	function passInput(obj){
		var val = obj.value;
		var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,10}$/;
		
		 if (passReg.test(val)) {
			obj.value = val.replace(/^\s+/,'');
			
		}if (passReg.test(val)){
			obj.value = val.replace(/\-/g,'');
			
		}
		
		if (passReg.test(val)) {
			$('#passCheck').text("양식에 올바릅니다.");
			$('#passCheck').css("color", "green");
		} else {
			$('#passCheck').text("양식에 올바르지 않습니다.");
			$('#passCheck').css("color", "red");
			obj.value= val.replace(val,'');
			$('select[name=password]').focus();
			
		}
		$('select[name=title]').focus();
		} 
	/*function titleinput(obj){
		var val = obj.value;
		var titleReg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
		
		if (titleReg.test(val)){
				obj.value = val.replace(/\-/g,'');
		if (obj.value.length >= 60) {
				alert("제목은 전체 60글자 이하만 입력해주세요(공백없음)");
				obj.value = val.substring(0,60);
				$('select[name=content]').focus();
				}
			$('select[name=content]').focus();
	}
	function textarea(obj){
		var val = obj.value;
		if (obj.value.length >= 1300) {
				alert("전체 40글자 이하만 입력해주세요(공백포함)");
				obj.value = val.substring(0,1300);
				$('select[name=content]').focus();
				}
			$('select[name=content]').focus();
	} */
	
	function reset() {
	$('input[name=name]').focus();
	}
	
 	function check(){
 		var name = $('#name').val();
 		var password = $('#password').val();
 		
 		var title = $('#title').val();
 		var content = $('#content').val();
 		var blank = /[\s]/g;
 		var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,10}$/;
 		
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
 	
 
	/* //최소 8자리에 숫자, 문자, 특수문자 각각 1개 이상 포함
 		var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,10}$/;
 		
 		 
 		var myform = document.forms['insert'];
 		var blank = /\-/g;/* /[\s]/g; 	
 		var name = myform['name'].value;
 		
 		if( myform['name'].value == "") {
 	        alert( '이름을 입력하세요.');
 	        return false;
 	    }else if(!name == blank){
 	    	alert("띄어쓰기는 입력할수 없습니다 ");
 	    	name.focus();
 	    	return false;
 	    }	 
 		if(!passReg.test($('input[name=password]').val())){
 			alert("최소 8자리 이상 10자리 이하 비밀번호를 입력하세요");
 			$('input[name=password]').focus();
 			return false;
 		}  if( myform['title'].value.length < 1) {
 	        alert( '제목을 입력하세요.');
 	        return false;
 	    } if( myform['content'].value.length < 1) {
 	        alert( '내용을 입력하세요.');
 	        return false;
 	    }
 		 
 			else return true; 
 	}
 		
 */
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
/*  	function onFitSizeOfTextArea()
    {
        var textArea = event.srcElement;
        while( textArea.clientHeight < textArea.scrollHeight )
        {
            textArea.rows = textArea.rows + 1;
        }
        textArea.content = "NoScroll";
    } */
 	
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
</script>
</html>