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
            <title>봉사 신청 관리 - Comme</title>
        </head>
        <style>
            #profileTap {
                list-style: none;
                font-size: 15px;
                padding: 0;
            }

            #profileTap li{
                text-align: center;
                float: left;
                border: 1px solid lightgray;
            }

            #profileTap li a{
                color: black;
                display: inline-block;
                padding: 7px 7px 7px 7px;
                min-width: 70px;
                text-decoration: none;
            }

            #profileTap li a:hover{
                background-color: #62bcf0;
                color: white;
                text-decoration: none;
            }

            #boardInfo{
                font-size: 15px;
            }
            #boardBox table{
                text-align: center;
                font-size: 13px;
            }

            #boardBox a{
                color: black;
            }

            .written_date,
            .seq_board,
            .view_count{
                color: #777;
            }

            th.col-2.profileTap{
                background-color: #f9f9f9;
            }

            .searchBox{
                border: 1px solid lightgray; 
                display: inline-block; 
                border-radius: 2px;
                height: 28px;
                /* width: 140px; */
            }

            #search, #searchBtn, #search_type{
                position: relative;
                top: 0;
                border-style: none;
                background-color: white;
                font-size: 13px;
            }
            
            #search{
                width: 140px;
            }

            .status_btn{
                color: black;
                border: 1px solid lightgray;
                background-color: white;
                border-radius: 2px;
                padding: 5px;
                font-size: 13px;
            }

            #modifyBtn,
            #updatePwBtn{
                margin-right: 10px;
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

            .tap:hover{
                text-decoration: underline;
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

            #boardBox,
            #tapBox,
            #searchBox{
                margin: 0 12vw 0 12vw;
            }

        </style>

        <body>
            <div>
                <!-- header -->
                <jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>

                <div class="row mt-5" id="tapBox">
                    <div class="col">
                        <ul id="profileTap">
                            <li><a href="/member/toMyPage">회원정보</a></li>
                            <li><a href="/member/toShelterVolList">봉사 신청 관리</a></li>
                            <li><a href="/member/toMyBoard">내 글</a></li>
                            <li><a href="/member/toMyComment">내 댓글</a></li>
                            <li><a href="/member/toMySupport">후원 글 조회</a></li>
                            <li><a href="/member/toMyPay">후원 내역 조회</a></li>
                            <li><a href="/">홈으로</a></li>
                            <li><a href="#" id="return">돌아가기</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row mt-3" id="boardBox">
                    <div class="col">

                        <h3>
                            <span id="boardInfo"><i class="fa-solid fa-list"></i>  &nbsp;봉사 신청 관리</span>
                        </h3>

                        <table class="table table-hover">
                            <thead style="border-top: 1px solid lightgray;">
                                <tr>
                                    <th scope="col" class="col-1">번호</th>
                                    <th scope="col" class="col-4">제목</th>
                                    <th scope="col" class="col-2">이름/전화번호</th>
                                    <th scope="col" class="col-1">정원/선발/신청</th>
                                    <th scope="col" class="col-2">마감기한</th>
                                    <th scope="col" class="col-1">승인여부</th>
                                    <th scope="col" class="col-1">버튼</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                   <c:when test="${empty list}">
                                    <tr>
                                        <td colspan="7">봉사 신청 내역이 없습니다.</td>
                                    </tr>
                                   </c:when>
                                
                                   <c:otherwise>
                                        <c:forEach items="${list}" var="dto">
                                            <tr>
                                                <td class="seq_board">${dto.SEQ_BOARD}</td>
                                                <td><a href="/volBoard/view?seq_board=${dto.SEQ_BOARD}">${dto.BOARD_TITLE}</a>
                                                <td>${dto.WRITER_NAME}/${dto.WRITER_PHONE}</td>
                                                <td><span class="vol_count">${dto.VOL_COUNT}</span>/<span class="select_count" data-value="${dto.SEQ_BOARD}">${dto.SELECT_COUNT}</span>/${dto.SIGNUP_COUNT}</td>
                                                <td class="written_date"><fmt:formatDate value="${dto.VOL_DEADLINE}" pattern="yyyy-MM-dd"/></td>
                                                <td class="vol_status"><c:choose>
                                                    <c:when test="${dto.VOL_STATUS eq 'N'}">
                                                        대기
                                                    </c:when>
                                                    <c:otherwise>
                                                        승인
                                                    </c:otherwise>
                                                </c:choose></td>
                                                <td><button type="button" class="status_btn" value="${dto.SEQ_SUBMIT}">승인</button></td>
                                            </tr>
                                        </c:forEach>
                                   </c:otherwise>
                                </c:choose>
                                
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row" id="searchBox">
                    <!-- 검색박스부분 -->
                    <div class="col">
                        <form action="/member/toShelterVolList" method="get">
                        <span class="searchBox">
                            <input type="text" name="search_keyword" id="search" value="${etcMap.search_keyword}">
                            <button type="submit" id="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </span>
                        <span class="searchBox">
                            <select name="search_type" id="search_type">
                                <option value="board_title">제목</option>
                                <option value="writer_name">이름</option>
                                <option value="writer_phone">전화번호</option>
                            </select>
                        </span>
                        </form>
                    </div>
                </div>

                <div class="page_wrap mb-5">
                    <div  class="page_nation">	
                        <c:choose>
                           <c:when test="${etcMap.search_type eq null}">
                                <c:if test="${paging.startPage!=1}" >
                                    <a id="first" href="/member/toShelterVolList?nowPage=1">첫 페이지</a>
                                    <a class="arrow left" href="/member/toShelterVolList?nowPage=${paging.startPage-1}">&lt;</a>
                                </c:if>	
                                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p" step="1">
                                    <a href="/member/toShelterVolList?nowPage=${p}"
                                        class="paging">${p}</a>
                                </c:forEach>
                                <c:if test="${paging.endPage != paging.lastPage}">
                                    <a class="arrow right" href="/member/toShelterVolList?nowPage=${paging.endPage+1}">&gt;</a>
                                    <a id="last" href="/member/toShelterVolList?nowPage=${paging.lastPage}">끝 페이지</a>
                                </c:if>
                           </c:when>
                           <c:otherwise>
                                <c:if test="${paging.startPage!=1}" >
                                    <a id="first" href="/member/toShelterVolList?nowPage=1&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}">첫 페이지</a>
                                    <a class="arrow left" href="/member/toShelterVolList?nowPage=${paging.startPage-1}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}">&lt;</a>
                                </c:if>	
                                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p" step="1">
                                    <a href="/member/toShelterVolList?nowPage=${p}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}"
                                        class="paging">${p}</a>
                                </c:forEach>
                                <c:if test="${paging.endPage != paging.lastPage}">
                                    <a class="arrow right" href="/member/toShelterVolList?nowPage=${paging.endPage+1}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}">&gt;</a>
                                    <a id="last" href="/member/toShelterVolList?nowPage=${paging.lastPage}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}">끝 페이지</a>
                                </c:if>
                           </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- footer -->
	            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>

            </div>

        </body>
        <script>
            const select = '${etcMap.search_type}';
            const option = document.querySelectorAll('#search_type option');
            option.forEach(option=>{
                if(option.value === select){
                    option.selected = true;
                }
            })

            const status = document.getElementsByClassName('vol_status');
            const selectCount = document.querySelectorAll('.select_count');
            const statusBtn = document.querySelectorAll('.status_btn');

            

            statusBtn.forEach(statusBtn=>{
                statusBtn.addEventListener('click', function(){
                    const self = this;
                    let seqBoard = this.closest('tr').getElementsByClassName('select_count');
                    let vol_count = this.closest('tr').getElementsByClassName('vol_count');
                    if(seqBoard[0].innerText == vol_count[0].innerText && this.innerText == '승인'){
                        alert('정원이 가득 찼습니다.');
                        return;
                    }

                    $.ajax({
                            url: '/member/updateVolSt',
                            type: "get",
                            data: {seq_submit: this.value , seq_board: seqBoard[0].getAttribute('data-value')},
                            success: function (data) {
                            //    console.log(data);

                               selectCount.forEach(selectCount=>{
                                    if(selectCount.getAttribute('data-value') == seqBoard[0].getAttribute('data-value')){
                                        selectCount.innerText = data;
                                    }
                               })

                               if(self.innerText == '승인'){
                                    self.innerText = '취소';
                               }else{
                                    self.innerText = '승인';
                               }

                            //    동적으로 상태랑 버튼 글자 바꿔주기
                                if (self.innerText == '승인') {
                                    self.closest('tr').getElementsByClassName('vol_status')[0].innerText = '대기'
                                    self.closest('tr').getElementsByClassName('vol_status')[0].style.cssText = "color: black";
                                }else{
                                    self.closest('tr').getElementsByClassName('vol_status')[0].innerText = '승인'
                                    self.closest('tr').getElementsByClassName('vol_status')[0].style.cssText = "color: #62bcf0";
                                }
                               
                            },
                            error: function (e) {
                                console.log(e);
                            }
                        })
                })
            })

            for (let i = 0; i < status.length; i++) {
                if(status[i].innerText == '승인'){
                    status[i].style.cssText = "color: #62bcf0";
                    statusBtn[i].innerText = '취소';
                }
            }

            /* 현재 머물고 있는 페이지에 대한 표시 이벤트 */
            const active = document.getElementsByClassName('paging');
            for (let i = 0; i < active.length; i++) {
                if (active[i].innerText == '${paging.nowPage}') {
                    active[i].style.cssText = "background-color: #f9f9f9; color: #555; border: 1px solid #aaa; border-radius: 2px";
                }
            };
            

            if (!sessionStorage.getItem('referrer')){
                sessionStorage.setItem("referrer", document.referrer);
            }

            document.getElementById('return').addEventListener('click', () =>{
                const referrer = sessionStorage.getItem('referrer');
                sessionStorage.removeItem("referrer"); 
                location.href = referrer || '/';
            })
        </script>

        </html>