<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        *{
            
            box-sizing: border-box;
        }
        /* 글수정 / 삭제 커서*/
        .writerBtn span{
            cursor: pointer;
        }
        /* 댓글 타이틀 */
        .comment-title, .board-title, .writer{
            border-bottom: 1px solid black;
        }
        .writingModify{
            margin-bottom: 10px;
        }
        .writer{
            margin-top: 10px;
        }
        /* 댓글타이틀 이미지 */
        .comment-title img{
            margin-bottom: 10px;
            width: 30px;
        }
        /* 댓글수정 / 삭제 커서 */
        .commentBtn span{
            cursor: pointer;
        }
        .comment-body, .comment-text{
            margin-top: 10px;
        }
        #commentBtn{
            float: right;
            margin: 10px;
        }
        .nextPrev{
            border-top: 1px solid black;
        }
        #commentNickname{
            margin-top: 10px;
            width: 30%;
        }
        #commentText{
            margin-top: 10px;
            width: 85%;
            height: 100px;
            resize: none;
        }
        #writeBtn{
            float: right;
        }
        .comment_content{
        	border: 0px;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="row header">
                여기는 헤더
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
                <div class="row  ">
                    <div class="col writer">
                        <span>글쓴이${map.MissingBoardDTO.writer_nickname}</span>
                        <span>실종일${map.MissingBoardDTO.miss_date}</span>
                        <span>작성일${map.MissingBoardDTO.written_date}</span>
                        <span>조회수${map.MissingBoardDTO.view_count}</span>
                         <!--로그인 세션으로 글쓴이 비교할것-->
                      <c:if test="${loginSession.member_id eq map.MissingBoardDTO.member_id}">
                        <div class="col writerBtn d-flex justify-content-end">
                            <span class="writingModify">글수정</span>
                            &nbsp/&nbsp
                            <span class="writingDelete">삭제</span>
                        </div>
                      </c:if>
                    </div>
                   
                </div>
                <div class="row content-box">
                   <div class="col">
                   <c:if test="${map.fileDTO.size() > 0}">
                   	 <c:forEach items="${map.fileDTO}" var="fileDTO">
                        <img style="width:200px" src="/폴더이름/${fileDTO.files_sys}">
                      </c:forEach>
                   </c:if>
                   </div>
                   <div class="row">
                   	<div class="col">
                        <textarea id="board_content" name="board_content" class="form-control" readonly>${map.MissingBoardDTO.board_content}</textarea>
                    </div>
                   </div>
                </div>
            </div>
        </div>
        <div class="row comment">
            <div class="col comment-title">
                <img src="/resources/images/chat.png">
                <span>Comment(달린 댓글 수)</span>
            </div>
            <div class="row comment-body">
            	<div class="col">
            <!-- 달린 댓글없으면 없다고 처리해주기 -->
	            <c:if test="${map.commentDTO.size() == 0}">
	            	<p> 등록된 댓글이 없습니다.</p>
	            </c:if>
                <!-- 여러개 일 경우 for문-->
                <c:if test="${map.commentDTO.size() > 0}">
                	<c:forEach items="${map.commentDTO}" var="commentDTO">
                    	<span>${commentDTO.comment_nickname}</span>
                    	<span>${commentDTO.comment_date}</span> <br>
                    	<p></p>
                    	<input type="text" class="seq_comment d-none" value="${commentDTO.seq_comment}">
                    </c:forEach>
                </c:if>
                </div>
                <!--댓글 작성자 아이디 비교-->
                <c:if test="${loginSession.member_id eq map.commentDTO.comment_id}">
                <div class="col commentBtn d-flex justify-content-end">
                    <span class="commentModify">수정</span>
                    <span class="commentModifyOk d-none">수정완료</span>
                    &nbsp/&nbsp
                    <span class="commentDelete">삭제</span>
                </div>
                </c:if>
                 <c:if test="${map.commentDTO.size() > 0}">
                	<c:forEach items="${map.commentDTO}" var="comment">
                <div class="row comment-text">
                    <div class="col">
                        <input type="text" class="comment_content" name="comment_content" readonly>${comment.comment_content}
                    </div>
                </div>
                </c:forEach>
                </c:if>
            </div>
            <form id="commentForm" action="/comment/missing_comment" method="post">
            <div class="row commentWrite">
                <div class="col">
                    <input id="commentNickname" type="text" name="nickname" value="${loginSession.member_nickname}" class="form-control" readonly>
                    <textarea id="comment_content" name="comment_content" placeholder="내용을 입력해주세요" class="form-control"></textarea>
                    <button type="button" id="commentBtn" class="btn btn-light">댓글 등록</button>
                </div>
                <div class="col d-none">
                	<input type="text" id="seq_board" value="${map.MissingBoardDTO.seq_board}" name="seq_board">
                	<input type="text" name="comment_id" value="${logionSession.id}">"
					<input type="text" name="comment_nickname" value="${logionSession.nickname}"> 
                </div>
            </div>
            </form>
        </div>
        <div class="row nextPrev">
            <!-- 만약 이전글이나 다음글이 있다면..?-->
            <div class="col">
                <a id="next" href=""><p>다음글 제목</p></a>
                <a id="prev" href=""><p>이전글 제목</p></a>
                <button type="button" id="listBtn" class="btn btn-light">목록</button>
                <button type="button" id="writeBtn" class="btn btn-light">글쓰기</button>
            </div>
        </div>
        <div class="row footer">
                여기는 푸터
        </div>
    </div>
    <script>
    	// 글 삭제
    	$(".writingDelete").click(function(){
    		let answer = confirm("작성하신 글을 삭제하시겠습니까?");
    		let seq_board = $("#seq_board").val();
    		if(answer){
    			location.href="/miss/delete?seq_board="+ seq_board;
    		}
    	})
    	// 글 수정
    	$(".writingModify").click(function(){
    		location.href="/miss/toModify?seq_board="+ seq_board;
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
    	document.getElementById("commentDelete").click = function(e){
    		let rs = confirm("댓글을 삭제하시겠습니까?");
    		let seq_comment = $(e.target).val();
    		if(rs){
    			$.ajax({
    				url : "/comment/deleteMissingComment"
    				, type: "post"
    				, data : {seq_comment: seq_comment}
    				, success : function(data){
    					cosole.log(data);
    					if(data === "success"){
    						alert("댓글이 삭제되었습니다.");
    						location.href="/miss/toDetail?seq_board=" + ${map.MissingBoardDTO.seq_board};
    					}
    				}, error : function(e){
    					console.log(e);
    				}
    			})
    		}
    	}
    	// 댓글 입력
    	document.getElementById("commentBtn").click = function(){
    		if(document.getElementById("comment_content").value == ""){
    			alert("댓글을 입력해주세요.");
    			return;
    		}
    		document.getElementById("commentBtn").submit();
    	}
    	// 목록 버튼
    	document.getElementById("listBtn").click = function(){
    		location.href = "/miss/toMissing";
    	}
    	// 글쓰기 버튼
    	document.getElementById("writeBtn").click = function(){
    		location.href = "/miss/toWrite";
    	}
    </script>
</body>
</html>