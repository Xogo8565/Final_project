<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>실종게시판_상세보기</title>
    <style>
* {
	box-sizing: border-box;
}
/* 타이틀 */
.title-body {
	margin-top: 20px;
}

.content-title h5 {
	margin-top: 20px;
	font-size: 30px;
}
/* 글수정 / 삭제 커서*/
.writerBtn span {
	cursor: pointer;
	color: #cf936f;
	font-weight: bold;
}

.content-box {
	margin-top: 20px;
	margin-bottom: 20px;
	text-align : center;
}
/* 글 내용 이미지 크기 조절 */
.content-box img {
	max-width: 100%;
}
/* 댓글 타이틀 */
.comment-title, .board-title, .writer {
	border-bottom: 1px solid black;
}

.writingModify {
	margin-bottom: 10px;
}
/* 글쓴이 등 */
.writer {
	margin-top: 10px;
}

.writer span {
	padding-bottom: 10px;
}
/* 댓글타이틀 이미지 */
.comment-title img {
	margin-bottom: 10px;
	width: 30px;
}
/* 댓글수정 / 삭제 커서 */
.commentBtn span {
	cursor: pointer;
	color: #cf936f;
	font-weight: bold;
}
.commentBtn{
	text-align: right;
}

.comment-body, .comment-text {
	margin-top: 20px;
}

#commentBtn {
	float: right;
	margin: 10px;
}

.btns {
	margin-top: 20px;
}
/* 댓글 입력  */
.commentWrite {
	border-bottom: 1px solid black;
}

#commentNickname {
	margin-top: 10px;
	width: 30%;
	margin-bottom: 10px;
}

#comment_content {
	margin-top: 10px;
	width: 100%;
	height: 100px;
	resize: none;
}

#writeBtn {
	float: right;
}

.comment_content {
	border: 0px;
	margin-bottom: 10px;
}
.commentText{
	border-bottom: 1px solid grey;
	margin-bottom: 10px;
	margin-top: 10px;
}
.nick{
	color: #cfb988;
	font-weight: bold;
	font-size: 20px;
}
/* 댓글 닉네임 인풋창 */
input[readonly].classname {
	background-color: transparent;
	border: 0;
	font-size: 20px;
}
input[readonly].comment_content{
	background-color: transparent;
	border: 0;
}
</style>
</head>
<body>
    <div class="container">
        <div class="row header">
               <jsp:include page="/WEB-INF/views/frame/header.jsp"/>
        </div>
        <div class="row title-body">
            <div class="col board-title">
                <h4>실종 게시판</h4>
            </div>
        </div>
        <div class="row content-body">
            <div class="row content-title">
                <div class="col">
                    <h5><strong>[${map.MissingBoardDTO.miss_area}]&nbsp&nbsp${map.MissingBoardDTO.board_title}</strong></h5>
                </div>
                <div class="row">
                    <div class="col writer">
                        <span>글쓴이 :&nbsp ${map.MissingBoardDTO.writer_nickname}</span><br><br>
						<c:set var="TextValue" value="${map.MissingBoardDTO.miss_date}" />		
                        <span>실종일 :&nbsp${fn:substring(TextValue, 0, 10)}</span>&nbsp&nbsp&nbsp&nbsp
                        <c:set var="TextDate" value="${map.MissingBoardDTO.written_date}" />
                        <span>작성일 :&nbsp${fn:substring(TextDate, 0, 10)}</span>
                        <span class="d-flex justify-content-end">조회수 :&nbsp${map.MissingBoardDTO.view_count}</span>
                         <!--로그인 세션으로 글쓴이 비교할것-->
                      <%-- <c:if test="${loginSession.member_id eq map.MissingBoardDTO.member_id}"> --%>
                        <div class="col writerBtn d-flex justify-content-end">
                            <span class="writingModify">글&nbsp수정</span>
                            <span class="writingDelete">&nbsp/&nbsp삭제</span>
                        </div>
                      <%-- </c:if> --%>
                    </div>
                   
                </div>
                <div class="row content-box">
                   <div class="col">
                   <c:if test="${map.fileDTO.size() > 0}">
                   	 <c:forEach items="${map.fileDTO}" var="fileDTO">
                        <img src="/mbFile/${fileDTO.files_sys}">
                      </c:forEach>
                   </c:if>
                   </div>
                   <div class="row">
                   	<div class="col board_content">
                        <c:out value="${map.MissingBoardDTO.board_content}" escapeXml="false"/>
                    </div>
                   </div>
                </div>
            </div>
        </div>
        <div class="row comment">
            <div class="col comment-title">
                <img src="/resources/images/chat.png">
                <span>Comment(${map.commentCount})</span>
            </div>
            <div class="row comment-body">
            	<div class="col">
            <!-- 달린 댓글없으면 없다고 처리해주기 -->
	            <c:if test="${map.commentDTO.size() == 0}">
	            	<p> 등록된 댓글이 없습니다.</p>
	            </c:if>
                <%-- 여러개 일 경우 for문--%>
                <c:if test="${map.commentDTO.size() > 0}">
                	<c:forEach items="${map.commentDTO}" var="commentDTO">
                    	<span class="nick">${commentDTO.comment_nickname}&nbsp&nbsp</span>
                    	<span>${commentDTO.comment_date}</span> <br>
                    	<input type="text" class="seq_comment d-none" value="${commentDTO.seq_comment}">
	                    	<%--댓글 작성자 아이디 비교
	                <c:if test="${loginSession.member_id eq map.commentDTO.comment_id}">--%>
	                <div class="col commentBtn">
	                    <span class="commentModify">수정</span>
	                    <span class="commentModifyOk d-none">수정완료</span>
	                    <span class="commentDelete">&nbsp/&nbsp삭제</span>
	                </div>
	                <div class="col commentText">
                        <input type="text" class="comment_content form-control" name="comment_content" value="${commentDTO.comment_content}" readonly>
                    </div>
	                <%--</c:if>--%>
                    </c:forEach>
                </c:if>
                </div>
            </div>
            <form id="commentForm" action="/comment/missing_comment" method="post">
            <div class="row commentWrite">
                <div class="col">
                <%-- ${loginSession.member_nickname} 로그인 세션으로 넣어줄것--%> 
                    <input id="commentNickname" type="text" name="comment_nickname" value="test" class="form-control classname" readonly>
                    <textarea id="comment_content" name="comment_content" placeholder="내용을 입력해주세요" class="form-control"></textarea>
                    <button type="button" id="commentBtn" class="btn btn-outline-light" style="background-color: #cfb988;">댓글 등록</button>
                </div>
                <div class="col d-none">
                	<input type="text" id="seq_board" value="${map.MissingBoardDTO.seq_board}" name="seq_board">
                	<input type="text" name="comment_id" value="test"> <%-- ${logionSession.member_id} 로그인 세션 아이디로 넣어줄것--%> 
                </div>
            </div>
            </form>
        </div>
        <div class="row btns">
            <div class="col">
                <button type="button" id="listBtn" class="btn btn-outline-light" style="background-color: #cfb988;">목록</button>
                <button type="button" id="writeBtn" class="btn btn-outline-light" style="background-color: #cfb988;">글쓰기</button>
            </div>
        </div>
        <div class="row footer">
               <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
        </div>
    </div>
    <script>
    	// 마지막 댓글은 줄 없게
    	$(".commentText").last().css("border-bottom", "none");
    	// 글 삭제
    	$(".writingDelete").click(function(){
    		let answer = confirm("작성하신 글을 삭제하시겠습니까?");
    		if(answer){
    			location.href="/miss/delete?seq_board="+ $("#seq_board").val();
    		}
    	})
    	// 글 수정
    	$(".writingModify").click(function(){
    		location.href="/miss/toModify?seq_board="+ $("#seq_board").val();
    	})
    
    	// 댓글 수정
    	$(".commentModify").click(function(){
    		$(".commentModify").addClass("d-none");
    		$(".commentModifyOk").removeClass("d-none");
    		$(".comment_content").attr("readonly", false);
    		$(".comment_content").focus();
    	})
    	// 수정완료 버튼 누르면
    	$(".commentModifyOk").click(function(){
    		$(".commentModifyOk").addClass("d-none");
    		$(".commentModify").removeClass("d-none");
    		$(".comment_content").attr("readonly", true);
    		
    		let comment_content = $(".comment_content").val();
    		let seq_comment = $(".seq_comment").val();
    		$.ajax({
    			url: "/comment/modifyMissingComment"
    			, type : "post"
    			, data : {seq_comment: seq_comment, comment_content : comment_content}
    			, success : function(data){
    				console.log(data);
    				if(data === "success"){
						alert("댓글이 수정되었습니다.");
						location.href="/miss/toDetail?seq_board=" + ${map.MissingBoardDTO.seq_board};
					}
    			}, error : function(e){
    				console.log(e);
    			}
    		})
    		
    	})
    	// 댓글 삭제
    	$(".commentDelete").click(function(){
    		let rs = confirm("댓글을 삭제하시겠습니까?");
    		let comment = $(".seq_comment").val();
    		if(rs){
    			$.ajax({
    				url : "/comment/deleteMissingComment?seq_comment="+ comment
    				, type: "get"
    				, success : function(data){
    					console.log(data);
    					if(data === "success"){
    						alert("댓글이 삭제되었습니다.");
    						location.href="/miss/toDetail?seq_board=" + ${map.MissingBoardDTO.seq_board};
    					}
    				}, error : function(e){
    					console.log(e);
    				}
    			})
    		}
    	})
    	// 댓글 입력
    	$("#commentBtn").click(function(){
    		if(document.getElementById("comment_content").value == ""){
    			alert("댓글을 입력해주세요.");
    			return;
    		}
    		$("#commentForm").submit();
    	})
    	// 목록 버튼
    	$("#listBtn").click(function(){
    		location.href = "/miss/toMissing";
    	})
    	// 글쓰기 버튼
    	$("#writeBtn").click(function(){
    		location.href = "/miss/toWrite";
    	})
    </script>
</body>
</html>