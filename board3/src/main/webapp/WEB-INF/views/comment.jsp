<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<script>
	 var num = "${vo.num}"; //게시글 번호
		 
	
	 
	/* $('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
			var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
			commentInsert(insertData); //Insert 함수호출(아래)
		}); */
 			
		//댓글 목록 
		function commentList() {
			$.ajax({
						url : 'commentList.do',
						type : 'get',
						data : {'num' : num 
						},
						success : function(data) {
							var a = '';
							
							
							$.each(data,function(key, value) {
								
												a += '<div class="commentArea" style="width:555px; border-bottom:1px solid darkgray; margin-bottom: 15px;heght:140px;" >';
												a += '<div style="margin-top:10px" class="commentInfo'+value.comment_num+'">'
												a += '<input type="hidden" calss="commentPassword" value="'+value.password+'" />'
												if(value.depth >0){
													for(var i=0;i<value.depth;i++){
												a += '&nbsp;&nbsp;'
													}
												a += '<b style="color:red;font-size:17px;">┗ RE</b>';	
												
												}
												a += '<div style="display: inline-block;">'
														+ '<pre style="font-size: 17px;margin-left:10px; white-space:pre;"'
														+ 'class="commentName"><b style="font-size: 20px;margin-right: 10px;color: mediumblue;">'+value.name+'</b></pre>'
												a += '</div>'
												a += '<div style="display: inline-block;">'
														+ '<sub style="margin-left:10px;margin-right: 10px;">'+value.comment_date+'</sub>';	
												a += '</div>'
												a += '<div style="float: right;">'
												a += '<a style="margin-right: 5px;"><input type="button" value="댓글" onclick="cocomentForm('+value.comment_num+','+value.ref+','+value.step+','+value.depth+')"/></a>';
												a += '<a style="margin-right: 5px;"><input type="button" value="수정" onclick="commentUpdatecheck('+value.comment_num+')"/></a>';
												a += '<a "style="margin-left: 5px;"><input type="button" value="삭제" onclick="commentDeletecheck('+value.comment_num+')"/></a> </div>';
												a += '</div>'
												a += '<div style="font-size:18px;' 
														+ 'margin-left:10px;height: 75px;"'
														+ 'class="commentContent'+value.comment_num+'">'
														+ '<pre style="white-space:pre;">'+ value.content +'</pre>'
														+ '</br>';
												a += '</div></div>';
												
												/* onclick="commentUpdate('
													+ value.comment_num
													+ ',\''
													+ value.name
													+ '\''
													+ ',\''
													+ value.content
													+ '\');" */					
												
											});

							$(".commentList").html(a);
						}
					});
		}

		//댓글 등록
		function commentInsert() {
			var num = "${vo.num}"; 
			var name = $('#name').val();
			var passReg = /^[0-9]*$/;
			var password = $('#password').val();
			var content = $('#content').val();
			var blank = /[\s]/g;
		
		
			
			 if(name == "") {
				 alert("이름을 입력하세요");
				 $('#name').focus();
				return false;
			  }else if(name.length == 0 || !name.trim()){
				 alert("연속적인 공백은 입력이 안됩니다");
				 name.focus(); 
				 return false; 
			/*   } else if(name.value){
			 	name.value= gg.replace(gg,"익명");
			 	return false;  */
			 }else if(password == ""){
				 alert("비밀번호를 입력하세요");
				 $('#password').focus();
				 return false;
			 }else if(password.length == 0 || !password.trim()){
					 alert("연속적인 공백은 입력이 안됩니다");
					 password.focus();
					 return false; 
			 }else if(!passReg.test(password)){
				 alert("1~4자리 숫자만 입력해주세요");
				 return false; 
			
			 } else if(content == ""){
				 alert("내용을 입력하세요");
				 $('#content').focus();
				 return false;
			 }else if(content.length == 0 || !content.trim()){
		 			alert("연속적인 공백은 입력이 안됩니다");
		 			return false;	
			 }else{
					 
					//key/value = 키이름이 컨트롤러에 있는 이름이랑 같아야 한다. 
						$.ajax({
							url : 'commentInsert.do',
							type : 'post',
							data : {num:num,
								name : name, 
								password : password, 
								content : content
								
								
							},
							success : function(data) {
								if (data == 1) {
									commentList(); //댓글 작성 후 댓글 목록 reload
									$('[name=name]').val('');
									$('[name=password]').val('');
									$('[name=content]').val('');
								}
							}
						})
					 return true
				};
		}
		
		function commentUpdatecheck(comment_num){
			
			 window.open("commentUpdateCheck.do?comment_num="+comment_num,
							"commentupdate","width=500,height=150");
		}
		
		 //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		 function commentUpdate(comment_num,password) {
			var password = $('#password').val();
			var content = $('#content').val();
			var a = '';
			a += '<div class="input-group" id="input-group">';
			a += '작성자 : <input style="height: 20px;margin-right: 10px;" type="text" class="commentName" maxlength="10" name="name_'+comment_num+'"  />';
		    a += '비밀번호 : <input style="height: 20px;margin-right: 40px;" type="password" class="commentPassword" maxlength="10" name="password_'+comment_num+'" />'; 
			a += '내 &nbsp;용 : <input style="height: 20px;margin-left:5px;margin-top: 8px;width:420px;" type="text" maxlength="30" class="commentContent" name="content_'+comment_num+'"  />';
			a += '<input value="저장" style="height: 25px;margin-left: 5px;" class="btn btn-default" type="button" onclick="commentUpdateProc('+ comment_num +');" />'
			a += '</div>';
			$('.commentName' + comment_num).html(a);
			$('.commentContent' + comment_num).html(a);
			$('.commentPassword' +comment_num).html(a);
			 
			
			
			
		 }
		//댓글 수정
		function commentUpdateProc(comment_num) {
			var updateContent = $('[name=content_' + comment_num + ']').val();
			var updateName = $('[name=name_' + comment_num +']').val();
			var updatePassword = $('[name=password_'+ comment_num +']').val();
			
			$.ajax({
				url : 'commentUpadate.do',
				type : 'post',
				data : {
					'name' : updateName,
					'content' : updateContent,
					'comment_num':comment_num,
					'password':updatePassword
				},
				success : function(data) {
					if (data == 1)
						commentList(num); //댓글 수정후 목록 출력 
				}
			});
		} 
		
		function commentDeletecheck(comment_num){
			
			 window.open("commentPassCheck.do?comment_num="+comment_num,
							"commentdelete","width=500,height=150");
		}
		/* //댓글 삭제 
		function commentDelete(comment_num) {
			var pass = $('#password').val();
			var num = "${vo.num}"; //게시글 번호
			
			
			$.ajax({
				url : 'commentDelete.do?comment_num='+comment_num ,
				type : 'post',
				success : function(data) {
					if (data == 1)
						commentList(num); //댓글 삭제후 목록 출력 
				}
			});
			}
 */
 
		$(document).ready(function() {
			commentList(); //페이지 로딩시 댓글 목록 출력 
		});

 
 //대댓글 
 function cocomentForm(comment_num,ref,step,depth){
		var password = $('#password').val();
		var content = $('#content').val();
		var a = '';
																													
		a += '<div class="input-group" id="input-group">';
		a += '작성자 : <input style="height: 20px;margin-right: 10px;" type="text" class="commentName" maxlength="10" name="comment_name_' + comment_num + '"/>';
	    a += '비밀번호 : <input style="height: 20px;margin-right: 20px;" type="password" class="commentPassword" maxlength="4" name="comment_password_' + comment_num + '"/>'; 
		
	    a += '<div> 내 &nbsp;용 : <input style="height: 20px;margin-left:5px;margin-top: 8px;width:375px;" type="text" maxlength="30" class="commentContent" name="comment_content_' + comment_num + '"/>';
	
		a += '<input value="저장" style="height: 25px;margin-left: 5px;" class="btn btn-default" type="button" onclick="cocommentInsert('+ comment_num +','+ref+','+step+','+depth+')"/>'
		a += '<input value="취소" style="height: 25px;margin-left: 5px;" class="btn btn-default" type="button" onclick="window.location.reload();" /></div>'
		a += '</div>';
		
		$('.commentName' + comment_num).html(a);
		$('.commentContent' + comment_num).html(a);
		$('.commentPassword' +comment_num).html(a);
 }  
 //대댓글 저장 
 function cocommentInsert(comment_num,ref,step,depth) {
		var num = "${vo.num}"; 
		var passReg =/^[0-9]*$/;
		var name = $('[name=comment_name_' + comment_num +']').val();
		var password = $('[name=comment_password_'+ comment_num +']').val();
		var content = $('[name=comment_content_'+ comment_num +']').val();
		var blank = /[\s]/g;
		

		
		 if(name == "") {
			 alert("이름을 입력하세요");
			 $('[name=comment_name_' + comment_num +']').focus();
			return false;
		  }else if(name.length == 0 || !name.trim()){
			 alert("연속적인 공백은 입력이 안됩니다");
			 $('[name=comment_name_' + comment_num +']').focus(); 
			 return false; 
		/*   } else if(name.value){
		 	name.value= gg.replace(gg,"익명");
		 	return false;  */
		 }else if(password == ""){
			 alert("비밀번호를 입력하세요");
			 $('[name=comment_password_'+ comment_num +']').focus();
			 return false;
		 }else if(!passReg.test(password)){
			 alert("1~4자리 숫자만 입력해주세요");
			 return false; 
		  }else if(password.length == 0 || !password.trim()){
				 alert("연속적인 공백은 입력이 안됩니다");
				 $('[name=comment_password_'+ comment_num +']').focus();
				 return false; 
		 } else if(content == ""){
			 alert("내용을 입력하세요");
			 $('[name=comment_content_'+ comment_num +']').focus();
			 return false;
		 }else if(content.length == 0 || !content.trim()){
	 			alert("연속적인 공백은 입력이 안됩니다");
	 			return false;	
		 }else{
				 
				 
				//key/value = 키이름이 컨트롤러에 있는 이름이랑 같아야 한다. 
					$.ajax({
						url : 'cocommentInsert.do',
						type : 'post',
						data : {num:num,
							name : name, 
							password : password, 
							content : content,
							ref:ref,
							step:step,
							depth:depth
						},
						success : function(data) {
							if (data == 1) {
								commentList(); //댓글 작성 후 댓글 목록 reload
								 $('[name=comment_name_' + comment_num +']').val();
								 $('[name=comment_password_'+ comment_num +']').val();
								 $('[name=comment_content_'+ comment_num +']').val();
							}
						}
					})
				 return true
			};
 }
	</script> 
</body>
</html>
