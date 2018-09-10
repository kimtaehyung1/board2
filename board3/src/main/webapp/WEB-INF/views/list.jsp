<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/list.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<center>
 	 
 	<h1>게시판</h1>
 	<div class="div_top">
 	<label class="label_count">전체 게시글 :<b class="label_count_b"> ${count }개의  게시글이 있습니다</b></label> 
    	<input type="button" onclick="window.location='list.do'" value="전체목록" class="list_button_input">
    </div>
    
    <table class="table" border="1px"  align="center" style="table-layout: fixed;">
    
        <tr>
            <td style="width:7%"></td>
            <td style="width:55%">제목</td>
            <td style="width:15%">작성자</td>
            <td style="width:14%">날짜</td>
            <td style="width:7%">조회</td>
        </tr>                          
        <c:forEach items="${list }" var="boardVO">
        	<c:choose>
        		<c:when test="${boardVO.show == 'y' }">
        <tr>
           <td class="result">
           <c:if test="${boardVO.step == 0}">
				    ${boardVO.rank}   
           </c:if>
           </td>
           <td class="result_title">
           <c:if test="${boardVO.depth > 0}">
                        <c:forEach begin="1" end="${boardVO.depth}">
               &nbsp;&nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
                        </c:forEach>
                        RE :
            </c:if>
            <a style="white-space: pre;" class="td_a_title" href="javascript:aaa(${boardVO.num })">${boardVO.title }</a>
          	  <c:if test="${boardVO.comment_count >0 }">
            <b style="color: red;">(${boardVO.comment_count })</b>
              </c:if>
		   </td>	 
           <td class="result"><pre class="pre_name" style="white-space:pre;"><b>${boardVO.name }</b></pre></td>
           <td class="result"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.write_date }" /> </td>
           <td class="result"><span > ${boardVO.read_count }</span></td>
       </tr>
       </c:when>
       <c:otherwise>
        <tr>
           <td class="result">
           <c:if test="${boardVO.step == 0}">
				    ${boardVO.rank}   
           </c:if>
           </td>
           <td class="result_title">
           <c:if test="${boardVO.depth > 0}">
                        <c:forEach begin="1" end="${boardVO.depth}">
               &nbsp;&nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
                        </c:forEach>
                        RE :
            </c:if>
           <b style="color:red;text-decoration:line-through" class="td_a_title" href="javascript:ccc(${boardVO.num })">삭제된 게시물입니다. 
       		<c:if test="${boardVO.comment_count >0 }"><b style="color: red;">(${boardVO.comment_count })</b></c:if></b>
		   </td>	 
           <td class="result"><pre class="pre_name" style="white-space:pre;"><b>${boardVO.name }</b></pre></td>
           <td class="result"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.write_date }" /> </td>
           <td class="result"><span > ${boardVO.read_count }</span></td>
       </tr>
        </c:otherwise>   
        </c:choose>
         <input type="hidden" name="num" value="${boardVO.num }">
       </c:forEach>
    </table>
   	<div class="div_save">
    <input type="button" onclick="window.location='write.do'" value="글쓰기"></br>
    </div>
    <form name="form" action="list.do" >
     <select name="search_option" >
    	<option value="all"<c:out value="${map.search_option == 'all'?'selected':''}" />>작성자+제목+내용</option>
    	<option value="name"<c:out value="${map.search_option == 'name'?'selected':''}" />>작성자</option>
    	<option value="title"<c:out value="${map.search_option == 'title'?'selected':''}" />>제목</option>
    	<option value="content"<c:out value="${map.search_option == 'content'?'selected':''}" />>내용</option>
    </select>
    <input type="text" name="keyword" id="keyword"  >
    <input type="button" value="검색" name="search" id="search" onclick="searchClick()">
   
    </form>
    <h4 style="color: red; font-size: 10px; " id="searchtext"></h4>
    <div>
								<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> 
								<c:if test="${pager.curBlock > 1}">
									<a href="javascript:list(1)">[처음]</a>
								</c:if> <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${pager.curBlock > 1}">
									<a href="javascript:list(${pager.prevPage})">[이전]</a>
								</c:if> <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 --> 
								<c:forEach var="num"
									begin="${pager.blockBegin}" end="${pager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${num == pager.curPage}">
											<span style="color: red" class="span">${num}</span>
                       						 </c:when>
										<c:otherwise>
											<a href="javascript:list(${num})">${num}</a>
                     					   </c:otherwise>
									</c:choose>
								</c:forEach> <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								<c:if test="${pager.curBlock <= pager.totBlock}">
									<a href="javascript:list(${pager.nextPage})">[다음]</a>
								</c:if> <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${pager.curPage <= pager.totPage}">
									<a href="javascript:list(${pager.totPage})">[끝]</a>
								</c:if>
							</div>
    </center>
</body>

<script>
	  function list(page){
	        location.href="list.do?curPage="+page
	        +"&search_option=${search_option}" 
	        +"&keyword=${keyword}";
	    }
	  function aaa(num) {
			location.href='detailBoard.do?num='+num;
		}
	  function searchClick(){
		 if(document.getElementById("keyword").value == ""){
			 alert("검색단어를 입력하세요");
			 return false;
		 }else if(document.getElementById("keyword").value.replace(/\s/g,"").length == 0){
		       alert('공백은 입력하실수 없습니다.');
		   return false;
		}
			 document.form.submit();
	  }
	   window.onload = function(){
		var count = ${count};
		if(count == 0 ){
			alert("검색결과가 없습니다.");
			location.href="list.do";
		}   
	}
	</script>
</html>


