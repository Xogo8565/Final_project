<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

 
    <title>실종게시판 글작성</title>
    <style>
      .board-title, .titleBox{
            margin-bottom: 10px;
            border-bottom: 1px solid black;
        }
        #title{
            margin-bottom: 10px;
        }
        #summernote{
            resize : none
        }
        .textForm{
        	width: 100px;
        	border : 0px;
        	font-size : 20px;
        	color : #cf936f;
        	font-weight : bold;
        }
        .miss_area, .animal_kind, .m_date{
        	margin : 10px;
        	border : 1px solid #cfb988;
        	height: 30px;
        	width: 500px;
        }
        .miss_area:focus, .animal_kind:focus, .m_date:focus{
        	outline: none !important;
        	border-color: #cf936f;
            box-shadow: 0 0 10px #cfb988;
            margin-left: 10px;
        }
        .animal_kind{
        	margin-bottom : 30px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row header">
            여기는 헤더
        </div>
        <div class="row board-title">
            <div class="col">
                <h3>실종 게시판</h3>
            </div>
        </div>
    <form id="writeForm" method="post" action="/miss/toInsert">
        <div class="row titleBox">
            <div class="col">
                <input type="text" id="title" name="board_title" class="form-control" placeholder="제목을 입력하세요.">
            </div>
        </div>  
        <div class="row">
        	<div class="col">
        			<p> *정확한 정보를 입력하지 않을시에 대한 책임은 본인에게 있습니다.*</p>
        			<label class="textForm">실종날짜 :&nbsp </label>
                	&nbsp<input type="date" class="m_date" ><br>
                	<label class="textForm">실종지역 :&nbsp</label>
                	&nbsp<input type="text" placeholder="예)00시/00구/00동" class="miss_area" name="miss_area">
                	<br>
                    <label class="textForm">동물종류 :&nbsp</label>
                    &nbsp<input type="text" placeholder="예)푸들" class="animal_kind" name="animal_kind">
        	</div>
        	<div class="col d-none">
        		<input type="text" name="member_id" value="${logionSession.id}">"
				<input type="text" name="writer_nickname" value="${logionSession.nickname}"> 	
        		<input type="text" class="miss_date" name="miss_date">
        	</div>
        </div>
        <div class="row">
            <div class="col">
                <textarea id="summernote" name="board_content">	
                </textarea>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <button type="button" id="writeOk" class="btn btn-secondary">작성</button>
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-left">
                    <button type="button" id="backBtn" class="btn btn-secondary">목록</button>
                </div>
            </div>
        </div>  
    </form>
        <div class="row footer">
            여기는 푸터
        </div>
    </div>
    <script>
    // 목록 버튼을 눌렀을때
    $("#backBtn").click(function(){
    	lcoation.href="/miss/toMissing";
    })
    // 작성 버튼을 눌렀을때
    $("#writeOk").click(function(){
    	if($("#title").val() == ""){
    		alert("제목을 작성해주세요.");
    		$("#title").focus();
    		return;
    	}else if($(".m_date").val() == ""){
    		alert("실종 날짜를 선택해주세요.");
    		$(".m_date").focus();
    		return;
    	}else if($(".miss_area").val() == ""){
    		alert("실종 지역을 입력해주세요.");
    		$(".miss_area").focus();
    		return;
    	}else if($(".animal_kind").val() == ""){
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
    	
    	$("#writeForm").submit();
    })
   
    
    $(document).ready(function(){
    	 $('#summernote').summernote({
    	        // 에디터 높이
    	        height: 500,
    	        // 에디터 한글 설정
    	        lang: "ko-KR",
    	        disableResizeEditor: true,
    	        // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
    	        focus : true,
    	        toolbar: [
    	                // 글꼴 설정
    	                ['fontname', ['fontname']],
    	                // 글자 크기 설정
    	                ['fontsize', ['fontsize']],
    	                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    	                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	                // 글자색
    	                ['color', ['forecolor','color']],
    	                // 표만들기
    	                ['table', ['table']],
    	                // 글머리 기호, 번호매기기, 문단정렬
    	                ['para', ['ul', 'ol', 'paragraph']],
    	                // 줄간격
    	                ['height', ['height']],
    	                // 그림첨부, 링크만들기, 동영상첨부
    	                ['insert',['picture','link','video']],
    	                // 코드보기, 확대해서보기, 도움말
    	                ['view', ['codeview','fullscreen', 'help']]
    	            ],
    	            // 추가한 글꼴
    	            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
    	            // 추가한 폰트사이즈
    	            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    	            
    	            callbacks : { //여기 부분이 이미지를 첨부하는 부분
    	            onImageUpload : function(files, editor,
    	            welEditable) {
    	            for (var i = files.length - 1; i >= 0; i--) {
    	            uploadSummernoteImageFile(files[i],
    	            this);
    	            		}
    	            	}
    	            }
    	       
    		});
    	
    	     /*    $('#summernote').summernote('insertText', '실종지역 :');
    	        $('#summernote').summernote('insertText', '실종된 날짜 :');
    	        $('#summernote').summernote('insertText', '동물종류 :'); */
    	        
    	        function uploadSummernoteImageFile(file, el){
    	        	data = new FormData();
    	        	data.append("file", file);
    	        	console.log(file);
    	        	$.ajax({
    	        		url : "/miss/uploadSummernoteImageFile"
    	        		, data : data
    	        		, type : "post"
    	        		, contentType : false
    	        		, enctype : "multipart/form-data"
    	        		, processData : false
    	        		, success : function(data){
    	        			console.log(data.url);
    	        			$(el).summernote('editor.insertImage', data.url);
    	        		}
    	        	});
    	        }
    })
         

    </script>
</body>
</html>