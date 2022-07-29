<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<script src="/resources/js/utils/loading.js"></script>
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
			<div class="col-8">
			<div id="mainP-navLg" class="d-none d-lg-block">
				<ul class="mainP-navLg">
					<li><a class="community" id="community">커뮤니티</a></li>
					<li><a href="/volBoard/lists">봉사</a></li>
					<li><a href="/supportBoard/lists">후원</a></li>
					<li><a href="/miss/toMissing">실종동물</a></li>
					<li><a class="toShelter" href="/shelterAnimal/toShelterAnimal?curPage=1">유기동물</a></li>
					<li><a href="/board/toBoard?seq_category=${inquiry.seq_category}&category_name=${inquiry.category_name}">문의/신고</a></li>
				</ul>
			</div>
			<div id="mainP-navMd" class="d-none d-md-block d-lg-none">
				<ul class="mainP-navMd">
					<li><a class="community" id="community2">커뮤니티</a></li>
					<li><a href="/volBoard/lists">봉사</a></li>
					<li><a href="/supportBoard/lists">후원</a></li>
					<li><a href="/miss/toMissing">실종동물</a></li>
					<li><a class="toShelter" href="/shelterAnimal/toShelterAnimal?curPage=1">유기동물</a></li>
					<li><a href="/board/toBoard?seq_category=${inquiry.seq_category}&category_name=${inquiry.category_name}">문의/신고</a></li>
				</ul>
			</div>
			<div>
				<ul id="drop-ul" class="d-none">
					<li style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></li>
					<c:forEach items="${mainCategory}" var="dto">
						<a href="/board/toBoard?seq_category=${dto.seq_category}">
							<li class="drop-li">${dto.category_name}</li>
						</a>
					</c:forEach>
				</ul>
			</div>
			</div>
			<!--비반응형 소셜 아이콘 / 마이페이지 아이콘-->
			<div class="col-2 d-none d-md-block Header-Img-md p-0">
				<c:choose>
					<c:when test="${not empty loginSession}">
						<div class="col" id="helloBox">
							<label>
								<%-- <i class="fa-solid fa-paw" id="msgIcon"></i> --%>
								${loginSession.member_nickname}님 
								<i class="fa-solid fa-user-check userIcon" id="logIn-Y"></i>
							</label>
						</div>
						<div class="col" id="mypageBox">
							<a href="/member/toMyPage">
								<label id="mypageLabel">마이페이지</label>
							</a>
								<label id="logout">로그아웃</label>
						</div>
					</c:when>
					<c:otherwise>
						<a href="/member/toLoginPage">
							<label id="loginLabel">로그인</label>
						</a>
						<i class="fa-regular fa-user userIcon"></i>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!--반응형 헤더-->
		<div class="row">
			<div class="col-2 d-md-none header-side">
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
			<div class="col-8 d-md-none header-small-logo">
				<a href="/"><img src="/resources/mainImg/comme-sm-Logo.png"></a>
			</div>
			<div class="col-2 d-md-none header-myIcon">
				<c:choose>
					<c:when test="${loginSession.member_grade eq '1'}">
						<a href="/member/toMyPage"><i class="fa-solid fa-user-check userIconSm" id="logIn-Y" title="마이페이지"></i></a>
						<i class="fa-solid fa-right-from-bracket logoutIcon" title="로그아웃" id="logoutM"></i>
					</c:when>
					<c:when test="${loginSession.member_grade eq '4'}">
						<a href="/manager/memberList?curPage=1"><i class="fa-solid fa-user-check userIconSm" id="logIn-Y" title="마이페이지"></i></a>
						<i class="fa-solid fa-right-from-bracket logoutIcon" title="로그아웃" id="logoutM"></i>
					</c:when>
					<c:otherwise>
						<a href="/member/toLoginPage"><i class="fa-regular fa-user userIconSm"></i></a>
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
		
		let community = document.getElementsByClassName("community");
		for(let i=0; i<community.length; i++){
			community[i].onclick = function(){
				if(document.getElementById('drop-ul').className == 'd-none'){
					document.getElementById('drop-ul').className = 'd-none d-md-flex';
				}else{
					document.getElementById('drop-ul').className = 'd-none';
				}
			}
		}
		
		// 유기동물 클릭 시 로딩 이미지 띄움
		let toShelter = document.getElementsByClassName("toShelter");
		for(let i=0; i<toShelter.length; i++){
			toShelter[i].onclick = function(){
				setTimeout(function(){loadingSpinner('Spinner')}, 0000);
			}
		}
		
		document.getElementById("logout").onclick = function(){
			alert("로그아웃 되었습니다.");
			location.href="/member/logout";
		}
	</script>
</body>
</html>