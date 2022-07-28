<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <title><c:out value="${post.board_title}" /> - <c:out value="${post.category_name}" /></title>
        </head>
        <style>
            /* div {
                border: 1px solid black;
            } */


            ul {
                list-style: none;
                text-align: center;
            }

            li {
                float: left;
                margin-right: 30px;
            }
            

            .category {
                text-decoration: none;
                text-align: center;
                font-size: 13px;
                color: rgb(146, 146, 146);
            }

            a:hover {
                color: black;
            }

            table td, tr{
                font-size: 13px;
                text-align: center;
            }

            td a, #head, #tap{
                text-decoration: none;
                color: black;
            }
            #tap{
                font-size: 13px;
            }

            #head:hover{
                text-decoration: underline;
            }


            /* 페이지네이션 */
            .page_wrap {
                text-align: center;
            }

            .page_nation {
                display: inline-block;
            }


            .page_nation a:not(#first):not(#last)  {
                display: block;
                margin: 0 3px;
                float: left;
                width: 28px;
                height: 28px;
                line-height: 28px;
                font-size: 13px;
                color: #999;
                text-decoration: none;
            }

            .page_nation a:hover{
                background-color: #f9f9f9; 
                color: #555; 
                border: 1px solid #aaa; 
                border-radius: 2px;
            }

            .tap:hover, #tap:hover, .comment_delete:hover, .comment_modify:hover, #comment_close:hover{
                text-decoration: underline;
            }

            .postInfo{
                font-size: 12px;
                float: right;
            }
            
            .postBar{
                border-top: 1px solid lightgray; 
                border-bottom: 1px solid lightgray; 
                padding: 10px;
            }
            .postBar2{
                border-bottom: 1px solid rgb(238, 237, 237); 
                padding: 10px;
            }

            #listBtn{
                font-size: 13px;
                border: 1px solid lightgray;
                border-radius: 2px;
                background-color: whitesmoke;
                width: 340px;
                height: 22px;
            }

            #replyNumDiv{
                font-size: 13px;
                border: 1px solid lightgray;
                border-radius: 5px;
                padding: 10px;
                margin-right: 12px;
            }

            #replyWrite{
                font-size: 13px;
                border: 1px solid lightgray;
                border-radius: 5px;
                padding: 15px;
                margin: 0 0 40px 0;
            }

            #comment_content{
                width: 100%;
                height: 85px;
                border: 1px solid lightgray;
                border-radius: 3px;
                padding: 5px;
            }

            #loginComment{
                width: 100%;
                height: 85px;
                border: 1px solid lightgray;
                background-color: #e7e7e9;
                color: #999;
                border-radius: 3px;
                padding: 5px;
                cursor: pointer;
            }

            #modify_content{
                width: 60vw;
                height: 85px;
                border: 1px solid lightgray;
                border-radius: 3px;
                padding: 5px;
                font-size: 13px;
            }

            .commentBox{
                padding: 10px;
                border-bottom: 1px solid lightgray;
                position: relative;
            }

            .comment_Nk, 
            .comment_Date, 
            .comment_content{
                font-size: 13px;
            }
            .comment_content{
                margin: 0;
            }
            .comment_Date{
                color: #999;
                padding: 10px;
            }

            .comment_delete, .comment_modify, #comment_close{
                float: right;
                font-size: 13px;
                text-decoration: none;
                color: #555;
                background-color: white;
                border-style: none;
            }
            
            .comment_modify, 
            #modifyPost, 
            .postInfo{
                margin-right: 10px;
            }

            #commentList{
                margin: 0 10vw 0 10vw;
            }

            

            #first, #last{
                color: black;
                display: block;
                margin: 0 3px;
                float: left;
                line-height: 28px;
                font-size: 13px;
                text-decoration: none;
            }

            #modifyPost, #removePost{
                float: right;
                text-decoration: none;
                color: black;
                border: 1px solid lightgray;
                border-radius: 2px;
                padding: 5px;
                font-size: 13px;
                background-color: white;
            }
            #write{
                float: right;
                text-decoration: none;
                color: black;
                border: 1px solid lightgray;
                background-color: white;
                border-radius: 2px;
                padding: 5px;
                font-size: 13px;
            }

            i{
                color: rgb(43, 133, 250);
            }

            #search, #searchBtn, #search_type{
                position: relative;
                top: 0;
                border-style: none;
                background-color: white;
                font-size: 13px;
            }
            #search{
                width: 130px;
                font-size: 13px;
            }
            .searchBox{
                border: 1px solid lightgray; 
                display: inline-block; 
                border-radius: 2px;
                height: 28px;
            }

            #registerBtn {
                font-size: 13px;
                border: 1px solid rgb(177, 176, 176);
                border-radius: 4px;
                background-color: white;
                width: 60px;
                height: 60px;
            }
            #modifyCommentBtn{
                position: absolute;
                top: 34%;
                right: 3%;
                font-size: 13px;
                border: 1px solid rgb(177, 176, 176);
                border-radius: 4px;
                background-color: white;
                width: 60px;
                height: 60px;
            }
            
            /*top버튼*/
            #topBtn {
                display: none;
                position: fixed;
                bottom: 30px;
                right: 30px;
                z-index: 999;
                cursor: pointer;
            }
        </style>

        <body>
            <div>

                <!-- header -->
		        <jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>

                <div class="row mt-3">
                    <div class="col" style="margin: 0 10vw 0 10vw;"> <!-- 상단에 큰 분류 카테고리 이름이랑 소분류 카테고리 출력 -->
                        <span style="font-size: 17px;"><a id="head" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&category_name=${etcMap.category_name}" style="color: #555;"><strong>${etcMap.bigCategory}</strong> </a></span>
                        <span style="margin-left: 10px; padding: 0 10px 0 10px ;border-left: 1px solid lightgray; border-right: 1px solid lightgray;">
                            <a id="tap" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&small_category=${post.seq_category}&category_name=${etcMap.category_name}">
                                <c:choose>
                                   <c:when test="${post.seq_category eq etcMap.category}">
                                    공지
                                   </c:when>
                                
                                   <c:otherwise>
                                    ${post.category_name}
                                   </c:otherwise>
                                </c:choose> </a>
                        </span>
                    </div>
                </div>

                <div class="row mt-2" style="margin-left: 0px;">
                    <div class="col postBar" style="margin: 0 10vw 0 10vw;"> <!-- 글 제목이랑 시간 나타내기 -->
                        <span id="title"><strong><c:out value="${post.board_title}" /> </strong></span>
                        <span class="postInfo"><fmt:formatDate value="${post.written_date}" pattern="yyyy.MM.dd HH:mm"/></span>
                    </div>
                    
                </div>

                <div class="row" style="margin-left: 0px;">
                    <div class="col postBar2" style="margin: 0 10vw 0 10vw;"> <!-- 조회 수랑 댓글 수 나타내기 -->
                        <span style="font-size: 12px;">${post.writer_nickname}</span>
                        <span class="postInfo">댓글 <strong id="commentNum2">${post.cm_count}</strong>  </span>
                        <span class="postInfo">조회 수 <strong>${post.view_count}</strong> </span>
                    </div>
                </div>

                <div class="row mt-3 mb-5"> <!-- 게시물 내용 -->
                    <div class="col" style="margin: 10px 10vw 10px 10vw; font-size: 13px;">
                        <c:out value="${post.board_content}" escapeXml="false" />
                    </div>
                </div>

                <div class="row mb-4 mt-5" style="margin: 0 10vw 0 10vw;">
                    <div class="col pb-3" style="text-align: center; border-bottom: 1px solid lightgray; margin: 0 12px 0 12px;">
                        <button type="button" id="listBtn">목록으로 </button>
                    </div>
                </div>

                <div class="row" style="margin: 0 10vw 0 10vw;" id>
                    <c:if test="${loginSession.member_id eq post.member_id || loginSession.member_grade eq 4}" >
                        <div class="col"> <!-- 게시물 수정 삭제 버튼 -->
                            <button type="button" id="removePost"><i class="fa-solid fa-xmark"></i>  삭제</button>
                            <button type="button" id="modifyPost"><i class="fa-solid fa-pen"></i>  수정</button>
                        </div>
                    </c:if>
                </div>

                <c:if test="${post.cm_count != 0}" > <!-- 댓글이 존재할 시 나오는 댓글갯수 나타내는 박스 -->
                    <div class="row mt-5" >
                        <div class="col" id="replyNumDiv" style="margin: 0 10vw 0 10vw;">
                            댓글 <strong id="commentNum">${post.cm_count}</strong>  개
                        </div>
                    </div>
                </c:if>
                
                <!-- 게시물에 해당하는 댓글이 존재할시 뿌려줌 -->
                <div class="row" id="commentList">
                    <c:choose> 
                        <c:when test="${post.cm_count == 0}">
                        </c:when>
                        
                        <c:otherwise>
                        <c:forEach items="${comment}" var="list">
                                <div class="col-12 commentBox">
                                    <p class="comment_Nk">${list.comment_nickname}   <span class="comment_Date" >${list.comment_date}</span> 
                                        <c:if test="${loginSession.member_id eq list.comment_id || loginSession.member_grade eq 4}" >
                                            <button type="button" class="comment_delete" value="${list.seq_comment}"><i class="fa-solid fa-eraser"></i> 삭제</button>
                                            <button type="button" class="comment_modify" value="${list.seq_comment}"><i class="fa-solid fa-pen"></i>  수정</button> 
                                        </c:if>
                                    </p>
                                    <p class="comment_content"><c:out value="${list.comment_content}" /></p>
                                </div>
                        </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                
                <!-- 댓글 쓰는거 인풋 히든으로 글번호 보내줌 -->
                <div class="row mt-4" id="replyWrite" style="margin: 0 10vw 0 10vw;">
                    <div class="col-12"> 
                        <label for="comment_content" style="margin-bottom: 10px;">
                            <strong>댓글 쓰기</strong> </label>
                    </div>
                    <div class="col-11">
                        <form id="commentForm">
                            <input type="hidden" id="seq_board" name="seq_board" value="${post.seq_board}">
                            <c:choose>
                               <c:when test="${empty loginSession}">
                                    <p id="loginComment">댓글 작성 하시려면 로그인 해주세요. 로그인 하시겠습니까?</p>
                               </c:when>
                            
                               <c:otherwise>
                                    <textarea name="comment_content" id="comment_content" placeholder="회원 간의 불편함을 주는 댓글은 자제해주시고 따뜻한 댓글 부탁드립니다."></textarea>
                               </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                    <div class="col-1"  style="text-align: center; padding: 0; ">
                        <button type="button" id="registerBtn">등록</button>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col" style="margin: 0 10vw 0 10vw;"> <!-- 이하부터는 board.jsp 그대로 출력하는거라서 주석 안달음 -->
                        <h5 style="display: inline-block; font-size: 17;"><a id="head" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&category_name=${etcMap.category_name}"><strong>${etcMap.bigCategory}</strong> </a></h5>
                        <ul style="display: inline-block; margin-bottom: 0;">
                            <li><a class="category" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&small_category=${etcMap.category}&category_name=${etcMap.category_name}" id="${etcMap.category}">공지</a></li>
                            <c:forEach items="${categoryMenu}" var="list">
                                <li><a class="category" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&small_category=${list.seq_category}&category_name=${etcMap.category_name}" id="${list.seq_category}">${list.category_name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col" style="margin: 0 10vw 0 10vw;">
                        <table class="table table-hover">
                            <thead style="border-top: 1px solid lightgray;">
                                <tr>
                                    <th scope="col" class="col-2">탭</th>
                                    <th scope="col" class="col-6">제목</th>
                                    <th scope="col" class="col-2">글쓴이</th>
                                    <th scope="col" class="col-1">날짜</th>
                                    <th scope="col" class="col-1">조회</th>
                                </tr>
                            </thead>
                            <tbody>
        
                                <c:choose>
                                   <c:when test="${empty list}">
                                    <tr>
                                        <td colspan="5">등록 된 글이 없습니다.</td>
                                    </tr>
                                   </c:when>
                                   
                                   <c:otherwise>
                                        <c:forEach items="${list}" var="dto">
                                            <tr>
                                                <td><a class="tap" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&small_category=${dto.SEQ_CATEGORY}&category_name=${etcMap.category_name}">
                                                    <c:choose>
                                                       <c:when test="${dto.SEQ_CATEGORY eq etcMap.category}">
                                                        공지 
                                                       </c:when>
                                                    
                                                       <c:otherwise>
                                                        ${dto.CATEGORY_NAME}
                                                       </c:otherwise>
                                                    </c:choose> </a></td>
                                                    <c:choose>
                                                        <c:when test="${etcMap.search_type eq null}">
                                                                <td><a href="/board/detailPost?nowPage=${paging.nowPage}&seq_board=${dto.SEQ_BOARD}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}" class="title">${dto.BOARD_TITLE}</a> 
                                                                <c:if test="${dto.CM_COUNT != 0}" >
                                                                <span style="font-size: 6px; font-weight: bold;">&nbsp;&nbsp;${dto.CM_COUNT}</span>
                                                                </c:if> </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                                <td><a href="/board/detailPost?nowPage=${paging.nowPage}&seq_board=${dto.SEQ_BOARD}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}" class="title">${dto.BOARD_TITLE}</a> 
                                                                <c:if test="${dto.CM_COUNT != 0}" >
                                                                <span style="font-size: 6px; font-weight: bold;">&nbsp;&nbsp;${dto.CM_COUNT}</span>
                                                                </c:if> </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <td>${dto.WRITER_NICKNAME}</td>
                                                <td><fmt:formatDate value="${dto.WRITTEN_DATE}" pattern="yyyy.MM.dd"/></td>
                                                <td>${dto.VIEW_COUNT}</td>
                                            </tr>
                                        </c:forEach>
                                   </c:otherwise>
                                </c:choose>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                

                <div class="row">
                    <div class="col" style="margin: 0 10vw 0 10vw;">
                        <form action="/board/toBoard" method="get">
                        <span class="searchBox">
                            <input type="text" name="search_keyword" id="search" value="${etcMap.search_keyword}">
                            <button type="submit" id="searchBtn" value="${etcMap.category}" name="seq_category"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </span>
                        <span class="searchBox">
                            <select name="search_type" id="search_type">
                                <option value="board_title">제목</option>
                                <option value="board_content">내용</option>
                                <option value="writer_nickname">닉네임</option>
                            </select>
                        </span>
                        <c:if test="${small_category != 0}" >
                            <input type="hidden" name="small_category" value="${etcMap.small_category}">
                        </c:if>
                        </form>
                    </div>
                    <c:if test="${not empty loginSession}" >
                        <div class="col" style="margin: 0 10vw 0 10vw;">
                            <button type="button" id="write" ><i class="fa-solid fa-pen"></i>  쓰기</button>
                        </div>
                    </c:if>
                </div>

                <div class="page_wrap mb-5">
                    <div  class="page_nation">	
                        <c:choose>
                           <c:when test="${etcMap.search_type eq null}">
                                <c:if test="${paging.startPage!=1}" >
                                    <a id="first" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}">첫 페이지</a>

                                    <a class="arrow left" href="/board/toBoard?nowPage=${paging.startPage-1}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}">&lt;</a>
                                </c:if>	
                                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p" step="1">
                                    <a href="/board/toBoard?nowPage=${p}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}"
                                        class="paging">${p}</a>
                                </c:forEach>
                                <c:if test="${paging.endPage != paging.lastPage}">
                                    <a class="arrow right" href="/board/toBoard?nowPage=${paging.endPage+1}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}">&gt;</a>

                                    <a id="last" href="/board/toBoard?nowPage=${paging.lastPage}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}">끝 페이지</a>
                                </c:if>
                           </c:when>
                           <c:otherwise>
                                <c:if test="${paging.startPage!=1}" >
                                    <a id="first" href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}">첫 페이지</a>

                                    <a class="arrow left" href="/board/toBoard?nowPage=${paging.startPage-1}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}">&lt;</a>
                                </c:if>	
                                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p" step="1">
                                    <a href="/board/toBoard?nowPage=${p}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}"
                                        class="paging">${p}</a>
                                </c:forEach>
                                <c:if test="${paging.endPage != paging.lastPage}">
                                    <a class="arrow right" href="/board/toBoard?nowPage=${paging.endPage+1}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}">&gt;</a>

                                    <a id="last" href="/board/toBoard?nowPage=${paging.lastPage}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}">끝 페이지</a>
                                </c:if>
                           </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                	<!-- footer -->
	            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>

            </div>

            <!--top버튼-->
	        <a id="topBtn"><img src="/resources/mainImg/DIEALRIGHT.png"></a>
        </body>
        <script>
            const active = document.getElementsByClassName('paging');
            const category = document.getElementsByClassName('category');
            const tap = document.querySelectorAll('.tap');
            const noticeTr = document.querySelectorAll('tr');

            /* 머무는 페이지 표시 */
            for (let i = 0; i < active.length; i++) {
                if (active[i].innerText == '${paging.nowPage}') {
                    active[i].style.cssText = "background-color: #f9f9f9; color: #555; border: 1px solid #aaa; border-radius: 2px";
                }
            };

            /* 머물고 잇는 소분류 카테고리 표시 */
            for (let i = 0; i < category.length; i++) {
                if (category[i].id == '${small_category}') {
                    category[i].style.cssText = "text-decoration: underline; color: black";
                }
            };

            /* 상단에 노출시킨 공지 표시 */
            for (let i = 0; i < tap.length; i++) {
                if (tap[i].innerText == '공지') {
                    noticeTr[i+1].className = "table-secondary";
                }
            };

            document.addEventListener('click', function(e){
                if(e.target.id == 'write'){ // 글작성
                    if('${etcMap.search_type}' == ''){
                        location.href = "/board/toWrite?nowPage=${paging.nowPage}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}";
                    }else{
                        location.href = "/board/toWrite?nowPage=${paging.nowPage}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}";
                    } 
                }else if(e.target.id == 'removePost'){ // 글삭제
                    let check = confirm('해당 게시물을 삭제하시겠습니까?');
                    if(check){
                        location.href = "/board/deletePost?seq_board=${post.seq_board}&seq_category=${etcMap.category}&category_name=${etcMap.category_name}";
                    }
                }else if(e.target.id == 'modifyPost'){ // 글수정
                    if('${etcMap.search_type}' == ''){
                        location.href = "/board/toModifyBoard?nowPage=${paging.nowPage}&seq_board=${post.seq_board}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}";
                    }else{
                        location.href = "/board/toModifyBoard?nowPage=${paging.nowPage}&seq_board=${post.seq_board}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}";
                    }
                }
            })

            // 댓글 삭제 버튼 이벤트 동적으로 추가되는 부분이 존재해서 버블링으로 걸어줌
            document.addEventListener('click', function(e){
                if(e.target.className == 'comment_delete'){
                    let check = confirm('삭제하시겠습니까?');
                    if(check){
                            $.ajax({
                            url: '/board/deleteComment',
                            type: "get",
                            data: {seq_comment: e.target.value},
                            success: function (data) {
                                console.log(data);
                                e.target.closest('div').remove();
                                    
                                // 댓글 개수 표시
                                let commentNum = document.querySelectorAll('.commentBox');
                                document.getElementById('commentNum').innerText = commentNum.length;
                                document.getElementById('commentNum2').innerText = commentNum.length;

                                if(commentNum.length === 0){
                                    document.getElementById('replyNumDiv').remove();
                                }
                            },
                            error: function (e) {
                                console.log(e);
                            }
                        })
                    }
                }
                
            })

            // 댓글 수정 버튼 이벤트 동적으로 추가되는 부분이라 버블링으로 걸어줌
            document.addEventListener('click', function(e){
                if(e.target.className == 'comment_modify'){ // 댓글 수정 버튼 누르면 나오는 디브창
                    let content = e.target.closest('div').getElementsByClassName('comment_content');
                    console.log(content[0].innerText);

                    let div = $('<div>').attr('class', 'col-12 commentBox');
                    let p1 =  $('<p>').attr('class', 'comment_Nk');
                    let button1 = $('<button>').attr({
                        id: "comment_close",
                        type: "button"
                    });
                    let button2 = $('<button>').attr({
                        id: "modifyCommentBtn",
                        type: "button",
                        value: e.target.value
                    });
                    let strong = $('<strong>').append(' 댓글 수정');
                    let textarea = $('<textarea>').attr({
                        name: 'comment_content',
                        id: 'modify_content'
                    })
                    let i1 = $('<i>').attr('class', 'fa-solid fa-arrow-right');
                    let i2 = $('<i>').attr('class', 'fa-solid fa-xmark');

                    button1.append(i2, " 닫기");
                    button2.append("등록");
                    p1.append(i1, strong, button1);
                    textarea.append(content[0].innerText);
                    div.append(p1, textarea, button2);
                    e.target.closest('div').after(div.get(0));
                    
                    // 댓글 개수 표시
                    let commentNum = document.querySelectorAll('.commentBox');
                    document.getElementById('commentNum').innerText = commentNum.length;
                    document.getElementById('commentNum2').innerText = commentNum.length;

                }else if(e.target.id == 'comment_close'){ // 댓글 닫기 버튼 누르면 수정눌러서 나온 입력창이 다시 사라짐
                    e.target.closest('div').remove();
                }else if(e.target.id == 'modifyCommentBtn'){ // 댓글 수정하고 등록버튼 누르면 ajax로 보내는 거
                    $.ajax({
                        url: '/board/modifyComment',
                        type: "get",
                        data: {seq_comment: e.target.value, comment_content: $('#modify_content').val()},
                        success: function (data) {
                            console.log(data);
                                
                            let content = e.target.closest('div').previousSibling;
                            content.getElementsByClassName('comment_content')[0].innerText = document.getElementById('modify_content').value;

                            // 댓글 개수 표시
                            let commentNum = document.querySelectorAll('.commentBox');
                            document.getElementById('commentNum').innerText = commentNum.length;
                            document.getElementById('commentNum2').innerText = commentNum.length;

                            e.target.closest('div').remove();
                            
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    })
                }else if(e.target.id === 'loginComment'){
                    let check = confirm('로그인 하시겠습니까?');
                    if(check){
                        location.href = "/member/toLoginPage";
                        return;
                    }
                }
                
            })

            // 댓글 등록 이벤트
            document.getElementById('registerBtn').addEventListener('click', function(){
                if(!'${loginSession.member_id}'){
                    alert('로그인 후 이용 부탁드립니다.');
                    return;
                }

                if(!document.getElementById('comment_content').value){
                    alert('내용을 입력해주세요.');
                    return;
                }

                let data = $('#commentForm').serialize();
                $.ajax({
                    url: '/board/registerComment',
                    type: "get",
                    data: data,
                    success: function (data) {
                        console.log(data);
                        const now = new Date();

                        if(!document.getElementById('replyNumDiv')){
                            let div1 = $('<div>').attr('class', 'row mt-5').css('margin', '0 10vw 0 10vw');
                            let div2 = $('<div>').attr({
                            class: 'col',
                            id: 'replyNumDiv'
                            })
                            let strong = $('<strong>').attr('id', 'commentNum').append('1');
                            div2.append('댓글 ', strong, ' 개');
                            div1.append(div2);
                            $('#commentList').before(div1);
                        }


                        let div = $('<div>').attr('class', 'col-12 commentBox');
                        let p1 =  $('<p>').attr('class', 'comment_Nk').append('${loginSession.member_nickname}');
                        let p2 =  $('<p>').attr('class', 'comment_content').append($('#comment_content').val());
                        let span = $('<span>').attr('class', 'comment_Date').append(' 방금 전');
                        let button1 = $('<button>').attr({
                            class: "comment_delete",
                            type: "button",
                            value: data
                        });
                        let button2 = $('<button>').attr({
                            class: "comment_modify",
                            type: "button",
                            value: data
                        });
                        let i1 = $('<i>').attr('class', 'fa-solid fa-eraser');
                        let i2 = $('<i>').attr('class', 'fa-solid fa-pen');

                        button1.append(i1, " 삭제");
                        button2.append(i2, " 수정");
                        p1.append(span , button1, button2);
                        div.append(p1, p2);
                        div.appendTo('#commentList');
                        document.getElementById('comment_content').value = '';

                        // 댓글 개수 표시
                        let commentNum = document.querySelectorAll('.commentBox');
                        document.getElementById('commentNum').innerText = commentNum.length;
                        document.getElementById('commentNum2').innerText = commentNum.length;
                    },
                    error: function (e) {
                        console.log(e);
                    }
                })
            })

            /* 목록으로 버튼 누르면 아래로 스크롤 내려줌 */
            document.getElementById('listBtn').addEventListener('click', function(){
                window.scrollBy({ left: 0, top: 1000, behavior: "smooth" });
            })

            
            /* 댓글 단지 시간 얼마나 걸렷는지 표시해주는거 */
            let date = document.querySelectorAll('.comment_Date');
            date.forEach(date=>{
                date.innerText = elapsedTime(date.innerText);
            })

            /* 댓글 단지 소요시간 나타내주는 함수 */
            function elapsedTime(date) {
            const start = new Date(date);
            const end = new Date(); // 현재 날짜
            
            const diff = (end - start); // 경과 시간
            
            const times = [
                {time: "분", milliSeconds: 1000 * 60},
                {time: "시간", milliSeconds: 1000 * 60 * 60},
                {time: "일", milliSeconds: 1000 * 60 * 60 * 24},
                {time: "개월", milliSeconds: 1000 * 60 * 60 * 24 * 30},
                {time: "년", milliSeconds: 1000 * 60 * 60 * 24 * 365},
            ].reverse();
            
            // 년 단위부터 알맞는 단위 찾기
            for(let i = 0; i < times.length; i++){
                const betweenTime = Math.floor(diff / times[i].milliSeconds);
                // 큰 단위는 0보다 작은 소수 단위 나옴
                if (betweenTime > 0) {
                return betweenTime + ' ' + times[i].time  + ' 전';
                }
            }
            
            return "방금 전";
            }


            document.getElementById('topBtn').addEventListener('click', function(){
			window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
		    })

            // Top 버튼
                $(window).scroll(function(){
                if ($(this).scrollTop() > 300){
                    $("#topBtn").show();
                } else{
                    $("#topBtn").hide();
                }
            });


            const select = '${etcMap.search_type}';
            const option = document.querySelectorAll('#search_type option');
            option.forEach(option=>{
                if(option.value === select){
                    option.selected = true;
                }
            })
            
        </script>

        </html>