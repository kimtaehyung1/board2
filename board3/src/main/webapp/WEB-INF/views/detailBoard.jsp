<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/detailBoard.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" HTTP-EQUIV="refresh" CONTENT="1">
<title>비밀번호 확인</title>
</head>
<body>
	<h2 style="text-align: center;">상세게시글</h2>
	<div class="div_list">
		<input type="button" value="글쓰기" onclick="window.location='write.do'"
			class="input_write"> <input type="button" class="button"
			onclick="window.location='list.do'" value="전체목록">
	</div>
	<form name="detailBoard" method="post" action="detailBoard.do"
		id="detailBoard">
		<div class="div-top" STYLE="table-layout: fixed">
			<div class="div-m-1">
				<div class="div-1">
					<h3 style="margin-top:5px; margin-top: 15px;">No.</h3>
				</div>
				<div class="div-2-2">
					<p>${vo.read_count }</p>
				</div>
				<div class="div-1-2">
						<p>${vo.rank }</p>
				</div>
				<div class="div-2" style="">
					<h3 style="margin: 0px; margin-top: 15px;">조회</h3>
				</div>
			</div>
			<div class="div-m-2">
				<div class="div-1">
					<h3 style="margin: 0px; margin-top: 15px;">작성자</h3>
				</div>
				<div class="div-2-2">
					<p>
						<fmt:formatDate value="${vo.write_date }" pattern="yyyy-MM-dd" />
					</p>
				</div>
				<div class="div-1-2">
					<pre style="white-space: pre-wrap;">${vo.name }</pre> 
				</div>
				<div class="div-2">
					<h3 style="margin: 0px; margin-top: 15px;">Date.</h3>
				</div>
			</div>
			<!-- -->
			<div class="div-m-3">
				<div class="div-3">
					<h3 style="margin-top: 5px; padding-left: 10px;">제목</h3>
				</div>
				<div>
					<pre class="pre" style="margin-top: 10px; margin-bottom: 0px; font-size: 15px;"> ${vo.title }</pre>
				</div>
			</div>
			<h3 style="padding-left: 10px;">내용</h3>
			<div>
				<pre class="xmp">${vo.content }</pre>
			</div>
		<%-- <input type="hidden" name="password" id="password"
			value="${vo.password }"> --%>
		</div>
	</form>
		<div class="div_list2">
			<a onclick="reviewForm()"><input type="button" value="답글"></a>
			<a onclick="updatecheck()"><input type="button" value="수정" class="input_update"></a> 
			<a onclick="deletecheck()"><input type="button" value="삭제"></a>
		</div>
		<hr style="border: 1px dotted gray;width: 555px">
		<div >
		<div style="text-align: -webkit-center;" class="container" id="conteiner" >
				<label style="margin-left: 5px;margin-right: 460px;" for="content">COMMENT</label>
				<div>
				<form name="commentInsertForm"  onsubmit="return commentInsert()">
					<div class="input-group"   style="margin-top: 5px;">
						<input type="hidden" name="num" value="${vo.num}"/>
						 <%-- <input type="hidden" name="comment_num" value="${cvo.comment_num }"> --%>
						<div style="margin-right: 80px;">
						<b>작성자 :</b>
						<input class="comment_name" type="text" id="name" name="name" placeholder="이름을 입력하세요." maxlength="10">
						<b>비밀번호 :</b>
						<input class="comment_password" type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." onchange="passInput(this)" maxlength="4">
						</div>
						<div style="margin-left: 35px;">
						<b >내용 :</b> 
						<input class="comment"  type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요." maxlength="30" /> 
							<span class="input-group-btn">
							<input class="btn btn-default" type="submit"
								name="commentInsertBtn" value="등록" >
						</span>
						</div>
						<div style="width: 540px;" class="container">
				<center>
				
				<div class="commentList" style="text-align: left;"></div>
		</center>
		</div>
		</div>
			</form>
		</div>
		</div>
		</div>
	
</body>
<script src="resources/jquery/jquery-3.3.1.min.js"
	type="text/javascript">
	</script>
<script type="text/javascript">


 	/* function deletecheck(){
 		var count = "${count}";

 		 if(count>0){
 			 alert("댓글이 있는 게시글은 삭제 할수 없습니다 ");
 			  
 		 }else if(count ==0){
 			 window.open("PassCheck.do?num="+"${vo.num}",
						"delete","width=500,height=150");
 			 
 		 }
		
 	} */

 	function deletecheck(){
 		var count = "${count}";
 			 window.open("PassCheck.do?num="+"${vo.num}",
						"delete","width=500,height=150");
 	} 	
	function updatecheck(){
		 window.open("updateCheck.do?num="+"${vo.num}",
					"update","width=500,height=150");
	}
	function reviewForm(){
		 window.location.href="reviewForm.do?num=${vo.num}&ref=${vo.ref}&step=${vo.step}&depth=${vo.depth}";
	}
	  $(document).ready(function() {
 	      $('.div-4').on( 'keyup', 'textarea', function (e){
 	        $(this).css('height', 'auto' );
 	        $(this).height( this.scrollHeight );
 	      });
 	      $('.div-4').find( 'textarea' ).keyup();
 	    });
	  function passInput(obj){
			var val = obj.value;
			var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,10}$/;
			
			 if (passReg.test(val)) {
				obj.value = val.replace(/^\s+/,'');
				
			}if (passReg.test(val)){
				obj.value = val.replace(/\-/g,'');
				
			}
			
			$('select[name=content]').focus();
			} 
	 
</script>
<%@ include file="comment.jsp" %>
</html>