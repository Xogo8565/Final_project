<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/07/11
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/frame/header.jsp"/>


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

        .content {
            margin-top : 50px;
            min-height: 1200px;
            padding-left: 90px;
            padding-right: 90px;
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

        .content_header {
            border-bottom: 1px solid var(--sil);
        }

        .board {
            height: 95%;
        }

        /* 게시판 제목 */

        .board_header {
            margin-top: 15px;
            height: 30px;
            display: flex;
            gap: 15px;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid var(--sil);
            padding-bottom: 10px;
        }

        .board_header select {
            flex-grow: 1;
        }

        .board_header input {
            flex-grow: 12;
        }

        .board_content label {
            display: flex;
        }

        .board_content label span {
            flex-basis: 200px;
        }

        .board_content label input {
            flex-basis: 200px;
        }

        /* 게시판 내용물 */

        .board_content {
            min-height: 800px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .board_content #vol_count {
        }

        .board_content #vol_date {
        }

        .board_content textarea {
            width: 100%;
            min-height: 800px;
            resize: none;
        }

        .board_content button {
            height: 30px;
            width: 60px;
            align-self: flex-end;
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
    <!--  jQuery, bootstrap -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
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

    <!-- summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>

<div class="content">
    <div class="content_header">
        <h3>봉사 게시판</h3>
    </div>
    <div class="board">
        <form action="/volBoard/write" id="form" method="post">
            <div class="board_header">
                <select name="area" id="area">
                    <optgroup label="광역시/자치시/특별시">
                        <option value="서울">서울</option>
                        <option value="부산">부산</option>
                        <option value="대구">대구</option>
                        <option value="인천">인천</option>
                        <option value="광주">광주</option>
                        <option value="대전">대전</option>
                        <option value="울산">울산</option>
                        <option value="세종">세종</option>
                    </optgroup>
                    <optgroup label="도">
                        <option value="경기도">경기도</option>
                        <option value="강원도">강원도</option>
                        <option value="충청북도">충청북도</option>
                        <option value="충청남도">충청남도</option>
                        <option value="전라북도">전라남도</option>
                        <option value="경상북도">경상북도</option>
                        <option value="제주도">제주도</option>
                    </optgroup>
                </select>
                <input type="hidden" name="temp_files[]" id="temp_files">
                <input type="hidden" name="files_name" id="files_name">
                <input type="text" name="board_title" id="board_title" placeholder="제목을 입력해주세요" required
                       oninvalid="this.setCustomValidity('제목을 입력해주세요')"
                       oninput="this.setCustomValidity('')">
            </div>
            <div class="board_content">
                <label for="vol_deadLine"><span>봉사 날짜를 입력해주세요</span>
                    <input type="date" name="vol_deadLine" id="vol_deadLine" placeholder="봉사 날짜를 입력해주세요" required
                           oninvalid="this.setCustomValidity('봉사활동 날짜를 입력해주세요')"
                           oninput="this.setCustomValidity('')">
                </label>
                <label for="vol_count"><span>봉사 인원을 입력해주세요</span>
                    <input type="number" name="vol_count" id="vol_count" placeholder="봉사 최대 정원을 입력해주세요" required
                           min='1'
                           oninvalid="this.setCustomValidity('봉사활동 인원을 입력해주세요')"
                           oninput="this.setCustomValidity('')">
                </label>
                <textarea name="board_content" id="board_content"></textarea>
                <button type="submit" id="write">작성</button>
            </div>
        </form>
        <div class="board_footer">
            <button id="list" type="button">목록</button>
        </div>
    </div>
</div>

<script>
    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 10);
    document.querySelector("#vol_deadLine").value = date;
    document.querySelector("#vol_deadLine").min = date;

    document.querySelector("#form").addEventListener("submit", (e) => {
        const content = document.querySelector(".board_content .note-editable");
        const title = document.getElementById("board_title");  // focus, 제목오버조건 추가
        let imgs = document.querySelectorAll(".board_content img");
        let str = "";

        let brn = "${loginSession.member_grade}";
        if(brn!=="2"){
            alert("기관 회원만 이용할 수 있는 기능입니다.");
            e.preventDefault();
            return;
        }
        
        if(title.value.length > 33){  // focus, 제목오버조건 추가
            alert('제목은 한글기준 33자 이내로 입력해주세요.');
            setTimeout(function(){title.focus();}, 1);
            e.preventDefault();
            return;
        }else if (!content.innerText && imgs.length === 0) {
            alert('내용을 입력해주세요.');
            setTimeout(function(){content.focus();}, 1);  // focus, 제목오버조건 추가
            e.preventDefault();
            return;
        } else if (content.children.length > 0 && imgs.length === 0) {
            for (let e of content.children) {
                str += e.innerText.replace(/\s/g, "");
            }
            if (str === '') {
                alert('내용을 입력해주세요');
                setTimeout(function(){content.focus();}, 1);  // focus, 제목오버조건 추가
                e.preventDefault();
                return;
            }
        } 

        let arr = [];
        imgs.forEach(e => {
            let uri = decodeURI(e.src);
            arr.push(uri);
        });
        document.querySelector("#files_name").value = arr;
        document.querySelector("#temp_files").value = tempImg;

    })


    document.querySelector("#list").addEventListener("click", function () {
        let check = confirm("페이지를 이동하면 작성한 글 내용이 저장되지 않습니다. 정말로 이동하시겠습니까?");
        if (check) {
            location.href = "/volBoard/lists";
        }
    });

    const tempImg = [];


    $(() => {
            $('#board_content').summernote({
                // 서머노트 툴바
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                    ['color', ['forecolor', 'color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert', ['picture', 'link', 'video']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
                // 서머노트 설정
                placeholder: "내용을 입력해주세요",
                disableResizeEditor: true,
                lang: "ko-kr",
                height: 800,
                // 서머노트 콜백함수
                callbacks: {
                    onImageUpload: function (files) {
                        for (let i = 0; i < files.length; i++) {
                            if (files[0].size > 1024 * 1024 * 1) {
                                alert("1MB 이상은 업로드할 수 없습니다.");
                                return;
                            }
                            uploadSummernoteImageFile(files[i], this);
                        }
                    },
                    onPaste: function (e) {
                        let clipboardData = e.originalEvent.clipboardData;
                        if (clipboardData && clipboardData.items && clipboardData.items.length) {
                            var item = clipboardData.items[0];
                            if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                                e.preventDefault();
                            }
                        }
                    }
                }
            });


            function uploadSummernoteImageFile(file, editor) {
                let data = new FormData();
                data.append("file", file);
                $.ajax({
                    data: data,
                    type: "POST",
                    url: "/file/vol_img",
                    enctype: "multipart/form-data",
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data.responseCode === "success") {
                            $(editor).summernote('insertImage', data.url);
                            tempImg.push(data.url);
                        } else alert("업로드에 실패했습니다");
                    }
                });
            }
        }
    );


</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>

