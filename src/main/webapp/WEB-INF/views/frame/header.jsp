<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
<!--<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"> -->
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Header</title>
</head>
<body>
	<!--header-->
	<div class="mainP-Header">
		<!--비반응형 logo-->
		<div class="row">
			<div class="col-2 d-none d-md-block Header-logo-md">
				<a href="/"><img src="/resources/mainImg/comme-md-Logo.png"></a>
			</div>
			<!-- 비반응형 네비바-->
			<div id="mainP-navLg" class="col-8 d-none d-lg-block">
				<ul class="mainP-navLg">
					<a id="community"><li>커뮤니티</li></a>
					<a href="/volBoard/lists"><li>봉사</li></a>
					<a href="/supportBoard/lists"><li>후원</li></a>
					<a href="/miss/toMissing"><li>실종동물</li></a>
					<a href="/shelterAnimal/toShelterAnimal?curPage=1"><li>유기동물</li></a>
					<a href="/board/toBoard?seq_category=${inquiry.seq_category}&category_name=${inquiry.category_name}"><li>문의/신고</li></a>
				</ul>
				<ul id="drop-ul" class="d-none">
					<li style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></li>
					<c:forEach items="${mainCategory}" var="dto">
						<a href="/board/toBoard?seq_category=${dto.seq_category}">
							<li class="drop-li">${dto.category_name}</li>
						</a>
					</c:forEach>
				</ul>
			</div>
			<div id="mainP-navMd" class="col-8 d-none d-md-block d-lg-none">
				<ul class="mainP-navMd">
					<a id="community"><li>커뮤니티</li></a>
					<a href="/volBoard/lists"><li>봉사</li></a>
					<a href="/supportBoard/lists"><li>후원</li></a>
					<a href="/miss/toMissing"><li>실종동물</li></a>
					<a href="/shelterAnimal/toShelterAnimal?curPage=1"><li>유기동물</li></a>
					<a href="/board/toBoard?seq_category=${inquiry.seq_category}&category_name=${inquiry.category_name}"><li>문의/신고</li></a>
				</ul>
				<ul id="drop-ul" class="d-none">
					<li style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></li>
					<c:forEach items="${mainCategory}" var="dto">
						<a href="/board/toBoard?seq_category=${dto.seq_category}">
							<li class="drop-li">${dto.category_name}</li>
						</a>
					</c:forEach>
				</ul>
			</div>
			<!--비반응형 소셜 아이콘 / 마이페이지 아이콘-->
			<div class="col-2 d-none d-md-block Header-Img-md p-0">
				<c:choose>
					<c:when test="${not empty loginSession}">
						<label id="logout" style="cursor:pointer;">로그아웃</label>
						<div class="row" id="iconBox">
							<a href="/member/toMyPage"><img src="/resources/mainImg/user.png"></a>
						</div>
						<div class="row" id="helloBox">
							<p>${loginSession.member_nickname} 님,<br> 안녕하세요 
							<i class="fa-solid fa-paw"></i></p>
						</div>
					</c:when>
					<c:otherwise>
						<a href="/member/toLoginPage"><img src="/resources/mainImg/user.png"></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!--반응형 헤더-->
		<div class="row">
			<div class="col-1 d-md-none header-side">
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<!-- 사이드 네비 메뉴-->
					<div class="row search-menuH">
						<span>Comme</span>
						<span>Community</span>
						<c:forEach items="${mainCategory}" var="dto">
							<a href="/board/toBoard?seq_category=${dto.seq_category}">
								<span>${dto.category_name}</span>
							</a>
						</c:forEach>
						<span>Volunteer</span>
						<a href="/volBoard/lists"><span>봉사신청</span></a>
						<span>Support</span>
						<a href="/supportBoard/lists"><span>후원신청</span></a>
					</div>
				</div>
				<span style="font-size: 20px; cursor: pointer" onclick="openNav()">&#9776;</span>
			</div>
			<!--반응형 중앙 로고 -->
			<div class="col-10 d-md-none header-small-logo">
				<a href=""><img src="/resources/mainImg/comme-sm-Logo.png"></a>
			</div>
			<div class="col-1 d-md-none header-myIcon">
				<c:choose>
					<c:when test="${not empty loginSession}">
						<a href="/myPage"><img src="/resources/mainImg/user.png"></a>
					</c:when>
					<c:otherwise>
						<a href="/loginPage"><img src="/resources/mainImg/user.png"></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!--header 끝-->
	<script>
		//상단바 sm크기에서 생기는 navbar
		function openNav() {
			document.getElementById("mySidenav").style.width = "70%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}

		document.getElementById('community').addEventListener('click', function(){
			if(document.getElementById('drop-ul').className == 'd-none'){
				document.getElementById('drop-ul').className = '';
			}else{
				document.getElementById('drop-ul').className = 'd-none';
			}
			
		})
		
		document.getElementById("logout").onclick = function(){
			alert("로그아웃 되었습니다.");
			location.href="/member/logout";
		}
	</script>
</body>
</html>