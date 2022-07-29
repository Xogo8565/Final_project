<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>메인 페이지</title>
<script>
	document.addEventListener("DOMContentLoaded", function(){

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

		document.getElementById('shelterAnimalBtn').addEventListener('click', function(){
			location.href = "/shelterAnimal/toShelterAnimal?curPage=1";
		})
	});
	
  </script>
<style>
/*콘텐츠 시작*/
/*함께하면 더 즐거운 유기동물 봉사 사진*/
.mainContent-1 {
	position: relative;
}

.mainContent-1 img {
	width: 100%;
	max-height: 100%;
}
/*함께하면 더 즐거운 유기동물 봉사 버튼*/
.mainContent-1 button {
	position: absolute;
	bottom: 40%;
	left: 27%;
	border: none;
	padding: 10px;
	border-radius: 30px;
}

/*봉사 후기 1~3위*/
.card-deck {
	padding-left: 50px;
	padding-right: 50px;
}

.cardImg {
    border: none;
    border-radius: 5px;
    background-color: #f6f6f6;
}

.cardImg img{
	width: 100%;
    height: 20vw;
}

.card-body {
	justify-content: center;
	height: 200px;
	display: flex;
    align-items: center;
    overflow-wrap: anywhere;
}

.card-body h4 {
	text-align: center;
}

.fa-solid{
	font-size: medium;
	vertical-align: super;
}

/*멀리서도 마음만은 늘 가까이 사진*/
.mainContent-2 {
	position: relative;
}

.mainContent-2 img {
	width: 100vw;
	padding: 50px;
	margin-top: 50px;
}

.mainContent-2 button {
	position: absolute;
	bottom: 30%;
	left: 45%;
	color: white;
	border: 2px solid white;
	background-color: transparent;
	padding: 10px;
	border-radius: 30px;
}

.mainContent-3 {
	position: relative;
}

.mainContent-3 img {
	width: 100vw;
	margin-top: 30px;
}

.mainContent-3 button {
	position: absolute;
	left: 5%;
	bottom: 35%;
	color: #cf936f;
	border: 2px solid #cf936f;
	background-color: transparent;
	padding: 10px;
	width: 250px;
	height: 50px;
	border-radius: 30px;
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

.topBtn img {
	width: 75px;
}

/*반응형 영역*/
/*반응형 첫번째 글귀*/
.mainContent-sm-1 {
	padding:50px;
	margin-left: 30px;
}
/*반응형 버튼*/
.carousel-item img{
 width:100%;
}
.mainContent-sm-2 {
	text-align: center;
}

.mainContent-sm-2 button {
	width: 300px;
	height: 50px;
	border: none;
	border-radius: 30px;
	color: white;
	background-color: #e3854a;
}
/*반응형 이미지*/
.mainContent-sm-2 img {
	margin-top: 50px;
	width: 100%;
}

.mainContent-sm-3 {
	position: relative;
}

.mainContent-sm-3 img {
	margin-top: 30px;
	width: 100%;
	padding: 10px;
}

.mainContent-sm-3 button {
	position: absolute;
	right: 35%;
	top: 70%;
	color: white;
	border: 2px solid white;
	background-color: transparent;
	padding: 10px;
	border-radius: 30px;
}

.mainContent-sm-5 {
	padding:40px;
	margin-left: 30px;
}

.mainContent-sm-5 button {
	margin-top: 30px;
	color: black;
	border: 2px solid black;
	background-color: transparent;
	padding: 10px;
	border-radius: 30px;
}
</style>
</head>

<body style="overflow-x: hidden">
	<!--main container-->
	<div class="mainP-Container">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		<!--body 컨텐츠 영역-->
		<div class="mainP-Body">
			<!--비반응형(md) 첫번째 콘텐츠(강아지발가락튀어나온사진) 봉사-->
			<div class="row content-1">
				<div class="col d-none d-sm-block mainContent-1">
					<img src="/resources/mainImg/content-md-1.png">
					<button type="button" class = "volunteer">
						&nbsp;&nbsp; <strong >봉사 신청하기</strong> &nbsp;&nbsp;
					</button>
				</div>
				<!--반응형(sm) 첫번째 콘텐츠(캐로셀 사진들) 이미지-->
				<div class="col-12 d-block d-sm-none">
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="/resources/mainImg/carousel-sm-3.png" class="d-block" alt="...">
							</div>
							<div class="carousel-item">
								<img src="/resources/mainImg/carousel-sm-2.png" class="d-block" alt="...">
							</div>
							<div class="carousel-item">
								<img src="/resources/mainImg/carousel-sm-1.png" class="d-block" alt="...">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>

			<!--비반응형(md) 두번째 콘텐츠 봉사 후기 1~3위 카드-->
			<div class="row">
				<div class="col d-none d-sm-block">
					<div class="card-deck">
						<c:forEach items="${list}" var="list" begin="0" end="2">
						<div class="card cardImg">
							<a href="/board/detailPost?nowPage=1&seq_board=${list.seq_board}&seq_category=1&small_category=2"><img class="card-img-top" src="/files/${list.files_sys}"
								alt="Card image cap"></a>
							<div class="card-body">
								<h4 class="card-title"><i class="fa-solid fa-quote-left"></i>&nbsp;${list.board_title}&nbsp;<i class="fa-solid fa-quote-right"></i></h4>
								
							</div>
						</div>
						</c:forEach>
					</div>
				</div>

				<!--반응형 글귀 이미지-->
				<div class="row">
					<div class="col d-block d-sm-none mainContent-sm-1">
						<img src="/resources/mainImg/content-sm-1.png">
					</div>
				</div>
				<div class="row">
					<div class="col d-block d-sm-none mainContent-sm-2">
						<button type="button" class="volunteer">시작하기</button>
					</div>
				</div>

			</div>

			<div class="row">
				<!--비반응형 멀리서도 마음만은 늘 가까이~ 후원-->
				<div class="col d-none d-sm-block mainContent-2">
					<img src="/resources/mainImg/content-md-2.png">
					<button id="shelterAnimalBtn" type="button" class = "patron">
						&nbsp;&nbsp; <strong>자세히 알아보기</strong> &nbsp;&nbsp;
					</button>
				</div>

				<!--반응형 빨리오개~ 이미지-->
				<div class="col d-block d-sm-none mainContent-sm-2">
					<img src="/resources/mainImg/content-sm-2.png">
				</div>
			</div>

			<div class="row">
				<!--일생을 함께할 또하나의가족 ~입양-->
				<div class="col d-none d-sm-block mainContent-3">
					<img src="/resources/mainImg/content-md-3.png">
					<button type="button" class="adopt">
						&nbsp;&nbsp; <strong>자세히 알아보기</strong> &nbsp;&nbsp;
					</button>
				</div>
				<!---반응형 멀리서도 마음만은 늘 가까이~ 후원 -->
				<div class="col d-block d-sm-none mainContent-sm-3">
					<img src="/resources/mainImg/content-sm-3.png">
					<button type="button" class="patron">자세히 알아보기</button>
				</div>
			</div>
			<div class="row">
				<!--반응형 또하나의 가족 반려동물 ~ 입양-->
				<div class="col d-block d-sm-none mainContent-sm-3">
					<img src="/resources/mainImg/content-sm-4.png">
				</div>
			</div>

			<div class="row mainContent-sm-5">
				<div class="col-12 d-block d-sm-none">
					<img src="/resources/mainImg/content-sm-5.png">
				</div>
				<div class="col-12 d-block d-sm-none">
					<button type="button" class="adopt">자세히 알아보기</button>
				</div>
			</div>
		</div>
		
		<!-- footer -->
	<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>

		
	</div>

	<!--top버튼-->
	<a id="topBtn"><img src="/resources/mainImg/DIEALRIGHT.png"></a>
	<script>
		document.querySelector(".volunteer").addEventListener("click", ()=>{
			location.href = "/volBoard/lists";
		})
		document.querySelector(".patron").addEventListener("click", ()=>{
			location.href = "/supportBoard/lists";
		})
		document.querySelector(".adopt").addEventListener("click", ()=>{
			location.href = "/shelterAnimal/toShelterAnimal?curPage=1";
		})
	</script>

</body>
</html>
