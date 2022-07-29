<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="/resources/js/summernote/summernote-lite.js"></script>
    <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">


    <title>실종게시판 글수정</title>
    <style>
        .content {
            margin-top: 50px;
            padding-left: 90px;
            padding-right: 90px;
        }

        .board-title {
            display: flex;
            align-items: center;
        }

        .board-title, .titleBox {
            margin-bottom: 10px;
            border-bottom: 1px solid black;
        }

        #title {
            margin-bottom: 10px;
        }

        #summernote {
            resize: none
        }

        /* 실종관련 정보 받는 폼  */
        .textForm {
            width: 100px;
            border: 0px;
            font-size: 20px;
            color: #cf936f;
            font-weight: bold;
        }

        .miss_area, .animal_kind, .m_date {
            margin: 10px;
            border: 1px solid #cfb988;
            height: 30px;
            width: 50%;
        }

        .miss_area:focus, .animal_kind:focus, .m_date:focus {
            outline: none !important;
            border-color: #cf936f;
            box-shadow: 0 0 10px #cfb988;
            margin-left: 10px;
        }

        .animal_kind {
            margin-bottom: 30px;
        }

        /* 작성, 목록 버튼 */
        .btns1 {
            margin-left: 30px;
            margin-top: 20px;
        }

        .btns2 {
            margin-top: 20px;
        }
    </style>
</head>

<body>
<div class="content">
    <div class="row board-title">
        <div class="col">
            <h3>실종 게시판</h3>
        </div>
    </div>
    <form id="modifyForm" method="post" action="/miss/modify">
        <div class="row titleBox">
            <div class="col">
                <input type="text" id="title" name="board_title" class="form-control"
                       value="${map.MissingBoardDTO.board_title}">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <p> *정확한 정보를 입력하지 않을시에 대한 책임은 본인에게 있습니다.*</p>
                <label class="textForm">실종날짜 :&nbsp </label>
                &nbsp<input type="date" class="m_date"><br>
                <label class="textForm">실종지역 :&nbsp</label>
                &nbsp<input type="text" value="${map.MissingBoardDTO.miss_area}" class="miss_area" name="miss_area">
                <br>
                <label class="textForm">동물종류 :&nbsp</label>
                &nbsp<input type="text" value="${map.MissingBoardDTO.animal_kind}" class="animal_kind"
                            name="animal_kind">
                <input type="hidden" value="${map.MissingBoardDTO.seq_board}" name="seq_board">
            </div>
            <div class="col d-none">
                <input type="text" id="seq_board" name="seq_board" value="${map.MissingBoardDTO.seq_board}">"
                <%-- <input type="text" name="member_id" value="${logionSession.id}">"
                <input type="text" name="writer_nickname" value="${logionSession.nickname}"> --%>
                <input type="text" class="miss_date" name="miss_date">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input type="hidden" id="imgSrc" name="imgSrc[]">
                <textarea id="summernote" name="board_content">
                    ${map.MissingBoardDTO.board_content}
                </textarea>
            </div>
            <div class="row">
                <div class="col btns1">
                    <button type="button" id="backBtn" class="btn btn-outline-light" style="background-color: #cfb988;">
                        목록
                    </button>
                </div>
                <div class="col btns2 d-flex justify-content-end">
                    <button type="button" id="writeOk" class="btn btn-outline-light" style="background-color: #cfb988;">
                        수정 완료
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 10);
    document.querySelector(".m_date").max = date;
    let date_val = "${map.MissingBoardDTO.miss_date}";
    document.querySelector(".m_date").value = date_val.substring(0,10);

    // 목록버튼을 눌렀을때
    $("#backBtn").click(function () {
        let check = confirm("작성된 글 내용은 저장되지 않습니다. 정말로 돌아가시겠습니까?");
        if(check) location.href = "/miss/toMissing";
    })

    $(document).ready(function () {
        // Summernote에 글 내용 추가하는 코드
        /* $("#summernote").summernote('code',  '
        ${map.MissingBoardDTO.board_content}'); */
        //여기 아래 부분
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: 500,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '내용을 입력해주세요.',	//placeholder 설정
            disableResizeEditor: true,
            callbacks: {	//여기 부분이 이미지를 첨부하는 부분
                onImageUpload: function (files) {
                    uploadSummernoteImageFile(files[0], this);
                },
                onPaste: function (e) {
                    var clipboardData = e.originalEvent.clipboardData;
                    if (clipboardData && clipboardData.items && clipboardData.items.length) {
                        var item = clipboardData.items[0];
                        if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                            e.preventDefault();
                        }
                    }
                }
            }
        });


        /**
         * 이미지 파일 업로드
         */
        function uploadSummernoteImageFile(file, editor) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "/miss/uploadSummernoteImageFile",
                contentType: false,
                processData: false,
                success: function (data) {
                    //항상 업로드된 파일의 url이 있어야 한다.
                    console.log(data);
                    files.push(data); // 빈배열에 리턴값 파일정보 넣어주기
                    console.log(files[0].url);
                    $(editor).summernote('insertImage', data.url);
                }
            });
        }

        /* 썸머노트 툴바 설정하는거 */
        $('.summernote').summernote({
            toolbar: [
                // [groupName, [list of button]]
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
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
        });


        // 마지막까지 게시물에 남아잇는 파일 url 스트링 값으로 넘길 빈배열하나 선언
        const imgSrc = new Array();

        $("#writeOk").click(function () {
            const title = document.getElementById('title');
            const summernote = document.getElementById('summernote');
            const content = document.querySelector(".note-editable");
            let str = "";
            const imgs = document.querySelectorAll(".note-editable>p img"); // 게시물에 찐막으로 남아잇는 이미지태그

            if (title.value.replace(/\s/g, "") == '') {
                alert('제목을 입력해주세요.');
                setTimeout(function(){title.focus();}, 1);  // focus, 제목오버조건 추가
                return;
            }else if (title.value.length > 33) {  // focus, 제목오버조건 추가
            	alert('제목은 한글기준 33자 이내로 입력해주세요.');
            	setTimeout(function(){title.focus();}, 1);
                return;	
            } else if (!content.innerText && imgSrc.length == 0) {
                alert('내용을 입력해주세요.');
                setTimeout(function(){content.focus();}, 1);  // focus, 제목오버조건 추가
                return;
            } else if (content.children.length > 0 && imgSrc.length == 0) {
                for (let e of content.children) {
                    str += e.innerText.replace(/\s/g, "");
                }
                if (str == '') {
                    alert('내용을 입력해주세요');
                    setTimeout(function(){content.focus();}, 1);  // focus, 제목오버조건 추가
                    return;
                }
            }

            // console.log("src : " + imgs[0].getAttribute('src'));
            imgs.forEach(imgs => {
                let src = imgs.getAttribute('src');
                imgSrc.push(src);
            })
            console.log(imgSrc);
            document.getElementById('imgSrc').value = imgSrc; // 폼안에 잇는 인풋에 배열 담아주고

            if ($("#title").val() == "") {
                alert("제목을 작성해주세요.");
                $("#title").focus();
                return;
            } else if ($(".m_date").val() == "") {
                alert("실종 날짜를 선택해주세요.");
                $(".m_date").focus();
                return;
            } else if ($(".miss_area").val() == "") {
                alert("실종 지역을 입력해주세요.");
                $(".miss_area").focus();
                return;
            } else if ($(".animal_kind").val() == "") {
                alert("동물 종류를 입력해주세요.");
                $(".animal_kind").focus();
                return;
            }
            let miss_date = $(".m_date").val();
            console.log($(".m_date").val());

            let year = miss_date.substr(0, 4);
            let mon = miss_date.substr(5, 2);
            let day = miss_date.substr(8, 2);
            let md = year + mon + day;

            $(".miss_date").val(md);
            console.log($(".miss_date").val());

            // 작성하는 과정에서 올렷다 내렷다 한 모든 파일의 대한 정보

            // 폼안에 작성된 데이터도 json객체 형식으로 변환해서 배열에 넣어줌
            let data = $("#modifyForm").serializeObject();
            // console.log(data);
            files.push(data);

            // 모든 파일에 대한 정보와 폼안에 데이터를 보내줌
            $.ajax({
                url: "/miss/modify"
                , type: "POST"
                , traditional: true
                , data: JSON.stringify(files)
                , contentType: 'application/json'
                , success: function (data) {
                    console.log(data);
                    if (data == "success") {
                        alert("수정 완료되었습니다.");
                        location.href = "/miss/toDetail?seq_board=" + ${map.MissingBoardDTO.seq_board};
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });

        })

        const files = new Array();

        // form 데이터 object로 변환하는 함수
        jQuery.fn.serializeObject = function () {
            var obj = null;
            try {
                if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                    var arr = this.serializeArray();
                    if (arr) {
                        obj = {};
                        jQuery.each(arr, function () {
                            obj[this.name] = this.value;
                        });
                    }//if ( arr ) {
                }
            } catch (e) {
                alert(e.message);
            } finally {
            }

            return obj;
        };
    });

</script>
</body>
</html>

<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
