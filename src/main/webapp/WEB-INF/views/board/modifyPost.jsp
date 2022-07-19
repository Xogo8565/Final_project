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
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<title><c:out value="${etcMap.bigCategory}" /> - Comme</title>
<script>
    $(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
        height: 300,                 // 에디터 높이
        minHeight: 500,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '내용을 입력해주세요',	//placeholder 설정
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files) {
                uploadSummernoteImageFile(files[0],this);
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

    // Summernote에 글 내용 추가하는 코드
	$("#summernote").summernote('code',  '${dto.board_content}');
        
        

	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/board/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
                console.log(data);
                files.push(data); // jsonObject 형식으로 넘어온걸 빈배열에 넣어줌
                console.log(files[0].url);
				$(editor).summernote('insertImage', data.url);
			}
		});
	}

    $('.summernote').summernote({
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });

      

      const category = document.querySelector('select');
      const title = document.getElementById('title');
      const summernote = document.getElementById('summernote');
      const content = document.querySelector(".note-editable>p");
      // 마지막까지 게시물에 남아잇는 파일 url 스트링 값으로 넘길 빈배열하나 선언
      const imgSrc = new Array();

      document.getElementById('registerBtn').addEventListener('click', function(){ // 등록 버튼 누를시 이벤트
        const imgs = document.querySelectorAll(".note-editable>p img"); // 게시물에 존재하는 이미지 태그

        imgs.forEach(imgs=>{ // 게시물에 존재하는 이미지 태그 src값을 빈배열에 담아줌 
            let src = imgs.getAttribute('src');
            imgSrc.push(src);
        })
        console.log(imgSrc);
        document.getElementById('imgSrc').value = imgSrc; // 폼 안에 히든으로 존재하는 빈 인풋에 배열 담아줌 serializeObject 안에 넣어서 같이 꺼내쓰려고

        if(category.value == 0){
            alert('카테고리를 지정해주세요');
            return;
        }else if(title.value == ""){
            alert('제목을 입력해주세요.');
            return;
        }else if(content.innerHTML == '<br>'){
            alert('내용을 입력해주세요.');
            return;
        }

        // 폼안에 작성된 데이터도 json객체 형식으로 변환해서 배열에 넣어줌
        let data = $("#modifyForm").serializeObject();
        files.push(data); // 업로드하면서 넣은 배열에 폼안에 데이터도 같은 객체 형식으로 넣어줌

        // 모든 파일에 대한 정보와 폼안에 데이터를 보내줌
	    $.ajax({
            url    : "/board/modifyBoard"
            , type : "POST"
            , traditional :true
            , data   : JSON.stringify(files)
            , contentType: 'application/json'
            , dataType : "json"
            , success : function(data){
                console.log(data);
                if('${etcMap.search_type}' == ''){ // 검색한지 여부에 따라 연결해주는걸 다르게 해줫음
                    location.href = "/board/detailPost?nowPage=${paging.nowPage}&seq_board=${dto.seq_board}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&category_name=${etcMap.category_name}";
                }else{
                    location.href = "/board/detailPost?nowPage=${paging.nowPage}&seq_board=${dto.seq_board}&seq_category=${etcMap.category}&small_category=${etcMap.small_category}&search_type=${etcMap.search_type}&search_keyword=${etcMap.search_keyword}&category_name=${etcMap.category_name}";
                }
		    },
            error: function(e){
                console.log(e);
            }
	    });

      })

      document.getElementById('cancleBtn').addEventListener('click', function(){
        location.href = "javascript:history.back()"; // 이전에 있던 페이지로 리턴시킴
      })


      const files = new Array(); // 한번이라도 업로드된 파일정보, 폼 데이터 담아줄 빈배열 선언

      // from 데이터 object로 변환하는 함수 구선생한테 얻어옴
      jQuery.fn.serializeObject = function() {
            var obj = null;
            try {
                if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                    var arr = this.serializeArray();
                    if (arr) {
                        obj = {};
                        jQuery.each(arr, function() {
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
</head>
<style>
    
    a{
        text-decoration: none;
        color: black;
    }
    #categoryTitle{
        font-size: 17px;
    }

    #title, select{
        position: relative;
        top: 0;
        border-style: none;
        background-color: white;
        height: 28px;
    }
    #title{
        width: 50vw;
        font-size: 13px;
        padding-left: 5px;
    }
    div, #registerBtn, #cancleBtn{
        font-size: 13px;
    }
    
    select{
        width: 100px;
        font-size: 13px;
    }
    #categoryBox, #titleBox{
        border: 1px solid lightgray; 
        display: inline-block; 
        border-radius: 2px;
    }

    #writeBox{
        border: 1px solid lightgray;
        padding: 15px;
        border-radius: 2px;
    }

    #cancleBtn{
        border: 1px solid lightgray;
        margin-right: 10px;
    }
    #registerBtn, #cancleBtn{
        float: right;
        width: 100px;
        height: 50px;
    }
</style>
<body>
    <div>

        <!-- header -->
		<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>

        <div class="row" style="margin: 0 10vw 0 10vw;">
            <div class="col"> <!-- 상단에 대분류 카테고리 이름 해놓은거 -->
                <span id="categoryTitle"><i class="fa-solid fa-circle"></i><a href="/board/toBoard?nowPage=1&seq_category=${etcMap.category}&category_name=${etcMap.category_name}"> <strong>${etcMap.bigCategory}</strong> </a></span>
            </div>
        </div>

        <div class="row mt-3 mb-5" id="writeBox" style="margin: 0 10vw 0 10vw;">
            <div class="col-12">
                <!-- 안에 내용이 수정내용보내는 폼임 -->
                <form method="post" action="/board/modifyBoard" id="modifyForm">
                    <span id="categoryBox">
                        <select name="seq_category" id="seq_category">
                            <option value="0">탭</option>
                            <c:forEach items="${categoryMenu}" var="dto">
                                <option value="${dto.seq_category}">${dto.category_name}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span id="titleBox">
                        <input type="text" id="title" name="board_title" placeholder="제목" value="${dto.board_title}" />
                    </span>
                    <br><br>
                    <input type="hidden" id="imgSrc" name="imgSrc[]">
                    <input type="hidden" id="seq_board" name="seq_board" value="${dto.seq_board}">
                    <textarea class="board_content" id="summernote" name="board_content"></textarea>
                </form>
            </div>

            <div class="col mt-5">
                <button type="button" class="btn btn-primary" id="registerBtn">등록</button>
                <button type="button" class="btn btn-light" id="cancleBtn">돌아가기</button>
            </div>
        </div>

        	<!-- footer -->
	    <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
        
    </div>
</body>
<script>
    /* 소분류 카테고리 물고 들어왔을 때 기존에 작성한 탭 그대로 선택되게 해주는 이벤트 feat(석수님) */
    const select = '${dto.seq_category}';
    const option = document.querySelectorAll('#seq_category option');
    option.forEach(option=>{
        if(option.value === select){
            option.selected = true;
        }
    })

</script>
</html>