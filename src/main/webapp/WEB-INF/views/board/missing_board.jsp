<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>실종 게시판</title>
<style>
/*실종 게시판 타이틀*/
.title {
	border-bottom: 1px solid black;
}

/* 검색 select */
.selectMissing {
	margin: 0px;
	width: 20%;
}

/* 검색 input 창 감싸는 div */
.shMissing {
	position: relative;
	width: 300px;
}
/* 검색 input */
#keywordMissing {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}
/* 돋보기 이미지 */
.lookup {
	position: absolute;
	width: 17px;
	top: 12px;
	right: 12px;
	margin-right: 15px;
	cursor: pointer;
}
 .missingContent{
 	margin-top : 30px;
 }
/* 실종 카드 */
.cardMissing {
	margin: 10px;
}
/*반응형 실종 목록 */
.resMissing {
	border-bottom: 1px solid black;
}
.missingContent img{
	width : 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row header">여기는 헤더</div>
		<div class="row body">
			<div class="row title">
				<div class="col-7">
					<h1>실종 게시판</h1>
				</div>
				<div class="col-12 col-sm-5">
				<form id="searchForm">
					<div class="row d-flex justify-content-end">
						<div class="col d-block d-sm-none d-flex justify-content-end">
							<button type="button" class="btn btn-outline-warning writeBtn">글쓰기</button>
						</div>
						
						<select name="category" class="form-select selectMissing">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="writerNickname">작성자</option>
							<option value="area">지역</option>
						</select>
						<div class="shMissing">
							<input type="text" name="keywordMissing" id="keywordMissing" class="form-control"
								placeholder="검색어 입력" onkeypress="enterKey(event)" > 
								<img class="lookup" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						</div>	
					</div>
					</form>
				</div>
			</div>
			<div class="row missingContent">
				<c:if test="${map.list.size() == 0}">
					<div class="col d-flex justify-content-center">
						<p><strong>실종 동물이 없습니다.</strong></p>
					</div>
				</c:if>
				<c:if test="${map.list.size() > 0}">
					<c:forEach items="${map.list}" var="dto">
						<div class="col-6 d-none d-sm-flex justify-content-center">
							<div class="card" style="width: 19rem;">
								<a href="/miss/toDetail?seq_board=${dto.seq_board}">
							<c:if test="${empty dto.files_sys}">
                            	<img src="/resources/images/No_image.png">
                        	</c:if>
                        	<c:if test="${not empty dto.files_sys}">
                           		 <img src="/mbFile/${dto.files_sys}">
                        	</c:if></a>
								<div class="card-body">
									<h5 class="card-title">${dto.board_title}</h5>
									<span>실종지역 : ${dto.miss_area}</span> <span> 동물 종류 : ${dto.animal_kind}</span>
									<p class="card-text">실종일 : ${dto.miss_date}</p>
									<p class="card-text">작성일 : ${dto.written_date}</p>
								</div>
							</div>
						</div>
						<div class="col-12 d-sm-none">
							<div class="row resMissing">
								<div class="col">
									<a href="/miss/toDetail?seq_board=${dto.seq_board}">
									<c:if test="${empty dto.files_sys}">
                            			<img src="/resources/images/No_image.png">
                        			</c:if>
                        			<c:if test="${not empty dto.files_sys}">
                           		 		<img src="/mbFile/${dto.files_sys}">
                        			</c:if></a>
								</div>
								<div class="col">
									<h5>${dto.board_title}</h5>
									<span>${dto.miss_area}</span> <span>${dto.animal_kind}</span>
									<p>${dto.miss_date}</p>
									<p>${dto.written_date}</p>
								</div>

							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-center">
				  <c:if test="${empty map.category}">
                <c:if test="${map.pagingVO.startPage!=1}">
                    <a id="first"
                       href="/miss/toMissing?curPage=1">첫
                        페이지</a>
                    <a class="arrow left"
                       href="/miss/toMissing?curPage=${map.pagingVO.startPage-1}">&lt;</a>
                </c:if>
                <c:forEach begin="${map.pagingVO.startPage}" end="${map.pagingVO.endPage}" var="p" step="1">
                    <a href="/miss/toMissing?curPage=${p}">${p}</a>
                </c:forEach>
                <c:if test="${map.pagingVO.endPage != map.pagingVO.lastPage}">
                    <a class="arrow right"
                       href="/miss/toMissing?curPage=${map.pagingVO.endPage+1}">&lt></a>

                    <a id="last"
                       href="/miss/toMissing?curPage=${map.pagingVO.lastPage}">끝페이지</a>
                </c:if>
            </c:if>
            <c:if test="${not empty map.category}">
                <c:if test="${map.pagingVO.startPage!=1}">
                    <a id="first"
                       href="/miss/search?category=${map.category}&search=${map.search}">첫
                        페이지</a>
                    <a class="arrow left"
                       href="/miss/search?category=${map.category}&search=${map.search}&curPage=${map.pagingVO.startPage-1}">&lt;</a>
                </c:if>
                <c:forEach begin="${map.pagingVO.startPage}" end="${map.pagingVO.endPage }" var="p" step="1">
                    <a href="/miss/search?category=${map.category}&search=${map.search}&curPage=${p}">${p}</a>
                </c:forEach>
                <c:if test="${map.pagingVO.endPage != map.pagingVO.lastPage}">
                    <a class="arrow right"
                       href="/miss/search?category=${map.category}&search=${map.search}&curPage=${map.pagingVO.endPage+1}">&lt></a>
                    <a id="last"
                       href="/miss/search?category=${map.category}&search=${map.search}&curPage=${map.pagingVO.lastPage}">끝페이지</a>
                </c:if>
            </c:if>
				</div>
				<div class="col d-none d-sm-flex justify-content-end">
					<button type="button" class="btn btn-outline-warning writeBtn">글쓰기</button>
				</div>
			</div>
		</div>
		<div class="row footer">여기는 푸터</div>
	</div>
	<script>
		// 글쓰기 버튼눌렀을때
		$(".writeBtn").click(function(){
			location.href = "/miss/toWrite";
		})
	
		// 검색
		$(".lookup").click(function(){

			if ($("#keywordMissing").val() == "") {
				location.href = "/miss/toMissing";
			}else {
				let formData = $("#searchForm").serialize();
				console.log(formData);

				$.ajax({
					url : "/miss/search"
					,type: "get"
					,data : formData
					, success : function(data) {
						console.log(data);
						//mkElement(data);
						$(".missingContent").empty();
						if(data.list.length == 0){ // 검색 결과 없음
							let divCol1 = $("<div>").addClass("col d-flex justify-content-center");
							let p = $("<p>").html($("#keywordMissing").val() + "로 검색한 결과입니다.");
							let p2 = $("<p>");
							let strong = $("<strong>").html("검색된 결과가 없습니다.");
							p2.append(strong);
							p.appendTo(divCol1);
							p2.appendTo(divCol1);
							$(".missingContent").append(divCol1);
						}else{
							for(let dto of data.list){
								console.log(typeof dto.miss_date);
								let miss_date = new Date(dto.miss_date - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 19).replace(/T/g, " ");
								let written_date = new Date(dto.written_date).toISOString().slice(0, 19).replace(/T/g, " ");
				
								let col2 = $("<div>").addClass("col-6 d-none d-sm-flex justify-content-center");
								let card = $("<div>").addClass("card").css("width", "18rem");
								let a = $("<a>").attr("href","/miss/toDetail?seq_board="+dto.seq_board);
								if(dto.files_sys == null){
									let img = $("<img>").attr("src", "/resources/images/No_image.png").addClass("card-img-top");
									a.append(img);
								}else if(dto.files_sys != null){
									let img = $("<img>").attr("src", "/mbFile/"+dto.files_sys).addClass("card-img-top");
									a.append(img);
								}
								console.log();
								let cardBody = $("<div>").addClass("card-body");
								let h5 = $("<h5>").addClass("card-title").html(dto.board_title);
								let span1 = $("<span>").html(dto.miss_area);
								let span2 = $("<span>").html(dto.animal_kind);
								let cardText = $("<p>").addClass("card-text").html(miss_date);
								let cardText2 = $("<p>").addClass("card-text").html(written_date);
								
								cardBody.append(h5, span1, span2, cardText, cardText2);
								
								card.append(a, cardBody);
								col2.append(card);
								col2.appendTo(".missingContent");
								
								let div3 = $("<div>").addClass("col-12 d-sm-none");
								let row = $("<div>").addClass("row resMissing");
								let col3 = $("<div>").addClass("col");
								let a2 = $("<a>").attr("href","/miss/toDetail?seq_board="+dto.seq_board);
								if(dto.files_sys == null){
									let img2 = $("<img>").attr("src", "/resources/images/No_image.png").addClass("card-img-top");
									a2.append(img2);
								}else if(dto.files_sys != null){
									let img2 = $("<img>").attr("src", "/mbFile/"+dto.files_sys).addClass("card-img-top");
									a2.append(img2);
								}
								let col4 = $("<div>").addClass("col");
								let h5_1 = $("<h5>").addClass("card-title").html(dto.board_title);
								let span3 = $("<span>").html("실종지역: "+ dto.miss_area);
								let span4 = $("<span>").html(dto.animal_kind);
								let p1 = $("<p>").html(miss_date);
								let p2 = $("<p>").html(written_date);
								
								col4.append(h5_1, span3, span4, p1, p2);
								col3.append(a2);
								row.append(col3, col4);
								div3.append(row);
								div3.appendTo(".missingContent");
							}
						}
						
					}, error : function(e) {
						console.log(e);
					}
				})
			}
		})
	</script>
	
</body>
</html>