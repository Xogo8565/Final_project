<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/frame/header.jsp"/>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        :root {
            --sil: #d5d5d5;
        }

        * {
            box-sizing: border-box;
        }


        button {
            background-color: white;
            border: 1px solid var(--sil);
            color: var(--sil);
            border-radius: 5px;
        }

        button:hover {
            background-color: var(--sil);
            color: white;
        }

        .content {
            margin-top : 50px;
            padding-left: 90px;
            padding-right: 90px;

        }

        .content_header {
            border-bottom: 1px solid var(--sil);
        }

        .board {
            height: 95%;
        }

        /* 게시판 제목 */

        .board_header {
            height: 65px;
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: repeat(2, 1fr);
            gap: 5px;
            margin-top: 15px;
            margin-bottom: 10px;
            border-bottom: 1px solid var(--sil);
            padding-bottom: 10px;
        }

        .board_header span {
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .board_header .title {
            grid-area: 1/1/2/11;
        }

        .board_header .nickname {
            grid-area: 2/1/3/2;
            font-size: 0.8em;
        }

        .board_header .written_date {
            grid-area: 2/3/3/4;
            color: var(--sil);
            font-size: 0.8em;
        }

        .board_header .view_count {
            grid-area: 2/4/3/5;
            color: var(--sil);
            font-size: 0.8em;
        }

        .board_header #modify {
            grid-area: 2/9/3/10;
            border: none;
        }

        .board_header #delete {
            grid-area: 2/10/3/11;
            border: none;
        }

        .board_header button {
            border: none;
        }

        .board_header button:hover {
            background-color: var(--sil);
            color: #ffffff;
        }

        /* 게시판 내용물 */

        .board_content {
            min-height: 300px;
        }


        /* 봉사자 */
        .volunteer {
            margin-top: 50px;
            height: 65px;
            display: flex;
            flex-direction: column;
            margin-bottom: 50px;
        }

        .volunteer>div {
            margin-top: 3px;
            padding-top: 12px;
            border-top: 1px solid var(--sil);
            display: flex;
            gap: 10px;
            justify-content: space-between;
            align-items: center;
        }

        .volunteer #tel {
            flex-basis: 90%;
            height: 30px;
        }

        .volunteer #volSubmit {
            flex-basis: 60px;
            height: 30px;
        }

        /* 목록 */
        .boardList {
            border-top: 1px solid var(--sil);
            padding-left: 0px;
            margin-bottom: 20px;
            border-bottom: 1px solid var(--sil);
        }

        .boardList li {
            margin-top: 5px;
            margin-bottom: 5px;
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .boardList li button {
            flex-basis: 45px;
        }

        .boardList a {
            color: black;
            text-decoration: none;
        }

        .boardList a:hover {
            text-decoration: none;
        }

        /* 글쓰기 글목록 버튼 */
        .board_footer {
            height: 30px;
            display: flex;
            justify-content: space-between;
        }

        .board_footer button {
            width: 60px;
        }

    </style>
</head>
<link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
      crossorigin="anonymous">
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<body>


    <div class="content">
        <div class="content_header">
            <h3>봉사 게시판</h3>
        </div>
        <div class="board">
            <div class="board_header">
                <span class="title"><c:out value="${map.board_title}"/></span>
                <span class="nickname"><c:out value="${map.writer_nickname}"/></span>
                <span class="written_date"><fmt:formatDate value="${map.written_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                <span class="view_count">조회수 <c:out value="${map.view_count}"/></span>
                <c:if test="${loginSession.member_id eq map.member_id || map.member_grade=='4'}">
                    <button type="button" id="modify">수정</button>
                    <button type="button" id="delete">삭제</button>
                    <script>
                        document.querySelector("#delete").addEventListener("click", () => {
                            let check = confirm("정말로 삭제하시겠습니까?");
                            if (check) {
                                let form = document.createElement("form");
                                form.method = "post";
                                form.action = "/volBoard/delete";

                                let input = document.createElement("input");
                                input.value = '${map.seq_board}';
                                input.type = "hidden";
                                input.name = "seq_board";

                                let arr = [];
                                let imgs = document.querySelectorAll(".board_content img");
                                imgs.forEach(e => arr.push(decodeURI(e.src)));

                                let file = document.createElement("input");
                                file.type = "hidden";
                                file.name = "file_name";
                                file.value = arr;

                                form.append(input);
                                form.append(file);
                                document.body.append(form);
                                form.submit();
                            }
                        });

                        document.querySelector("#modify").addEventListener("click", e => location.href = "/volBoard/modify?seq_board=${map.seq_board}");

                    </script>
                </c:if>
            </div>
            <div class="board_content">
                <c:out value="${map.board_content}" escapeXml="false"/>
            </div>
            <div class="volunteer">
                <span>♥ 총인원 <c:out value="${map.vol_count}"/> / 신청 인원 <c:out value="${map.applicants}"/> / 선발 인원 <c:out value="${map.accepted}"/> / 봉사활동 날짜 <fmt:formatDate value="${map.vol_deadLine}" pattern="yyyy-MM-dd"/></span>
                <div>
                    <input type="hidden" name="seq_board" value="${map.seq_board}" id="seq_board">
                    <input type="tel" name="writer_phone" placeholder="전화 번호 입력(형식 : 010-1234-1234)" id="tel">
                    <button type="button" id="volSubmit" disabled>submit</button>
                </div>
            </div>
            <ul class="boardList">
                <c:if test="${not empty list}">
                    <c:choose>
                        <c:when test="${list.size()==1}">
                            <a disabled>
                                <li>
                                    <button>UP</button>
                                    <span>등록된 게시글이 없습니다</span></li>
                            </a>
                            <a href="/volBoard/view?seq_board=${list.get(0).seq_board}">
                                <li>
                                    <button>DOWN</button>
                                    <span><c:out value="${list.get(0).board_title}"/></span></li>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/volBoard/view?seq_board=${list.get(1).seq_board}">
                                <li>
                                    <button>UP</button>
                                    <span><c:out value="${list.get(1).board_title}"/></span></li>
                            </a>
                            <a href="/volBoard/view?seq_board=${list.get(0).seq_board}">
                            <li>
                                <button>DOWN</button>
                                <span><c:out value="${list.get(0).board_title}"/></span></li>
                        </a>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${empty list}">
                    <a disabled>
                        <li>
                            <button>Up</button>
                            <span>등록된 게시글이 없습니다</span></li>
                    </a>
                    <a disabled>
                        <li>
                            <button>Up</button>
                            <span>등록된 게시글이 없습니다</span></li>
                    </a>
                </c:if>
            </ul>
            <div class="board_footer">
                <button id="list" type="button">목록</button>
                <button id="write" type="button">글쓰기</button>
            </div>
        </div>
    </div>

    <script>

    // 봉사활동 유효기간 확인
    let deadLine = "${map.vol_deadLine}";

    deadLine = deadLine.substring(0,11);

    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000);
    deadLine = new Date(deadLine);

    if(date < deadLine){
        document.querySelector("#volSubmit").disabled = false;
    }
    if(date > deadLine){
        document.querySelector("#tel").value = "기한이 지난 봉사활동 입니다";
        document.querySelector("#tel").readOnly = true;
    }

    document.querySelector("#list").addEventListener("click", e => location.href = "/volBoard/lists");

    document.querySelector("#write").addEventListener("click",()=>{
        let brn = "${loginSession.member_grade}";
        if(brn==="2"){
            location.href = "/volBoard/write"
        } else{
            alert("기관 회원만 이용할 수 있는 기능입니다.");
        }
    })

    //봉사활동 제출
    document.querySelector("#volSubmit").addEventListener("click", e => {
        const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        let phone = document.querySelector("#tel").value;

        if (!regPhone.test(phone)) {
            alert("전화번호를 입력해주세요 (형식 : 010-1234-1234)");
            return;
        }

        const loginSession = "${loginSession}";
        if(!loginSession||loginSession===""){
            alert("회원만 사용할 수 있는 기능입니다");
            return;
        }

        $.ajax({
            url: "/vol/submit",
            method: 'post',
            data: {seq_board: document.querySelector("#seq_board").value, writer_phone: document.querySelector("#tel").value},
            success: function (data) {
                if(data==='success') {
                    alert("봉사활동에 등록했습니다.");
                    getCurrentVolCount();
                } else if (data === "duplicated"){
                    alert("이미 봉사활동에 등록하셨습니다.")
                } else {
                    alert("봉사활동 등록에 실패했습니다. 관리자에게 문의하세요")
                }
            },
            error: function (e) {
                console.log(e);
            }
        });

    });


    //제출 후 현재인원 갱신
    function getCurrentVolCount() {
        $.ajax({
            url: "/vol/submit",
            method: 'get',
            data: {seq_board: document.querySelector("#seq_board").value},
            success: function (data) {
                document.querySelector(".volunteer>span:nth-child(1)").innerHTML =
                    "♥ 총인원 <c:out value="${map.vol_count}"/> / 신청 인원 "+ data +" / 선발 인원 <c:out value="${map.accepted}"/> / 봉사활동 날짜 <fmt:formatDate value="${map.vol_deadLine}" pattern="yyyy-MM-dd"/>"
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
