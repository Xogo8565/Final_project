<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,600,1,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>회원관리</title>
<style>
#titleSpan{
	font-size: 1.6em;
    border-bottom: 2px solid rgb(207, 185, 136);
    font-weight: bold;
}
.material-symbols-outlined{
	color: rgb(207, 147, 111);
}
/* 버튼 */
.btn {
	color: white;
	background-color: rgb(207, 185, 136);
	border: white;
	margin-right: 10px;
	padding: 3px 8px;
}
#btnSearch{
	padding: 0px;
}

.btn:hover {
	color: white;
	background-color: rgb(207, 147, 111);
	border: white;
}

/* 검색창 */
#inputDiv {
	text-align: -webkit-right;
}

#inputGroup {
	width: 20em;
}

#iconNote {
	margin-top: 10px;
	color: rgb(207, 147, 111);
}

#iconSearch {
	color: white;
	background-color: rgb(207, 185, 136);
	border: none;
}

.input-group > .form-select {
	flex: 1;
	border: 1px solid rgb(207, 185, 136);
	font-size: 13px;
}

.input-group > .form-select:focus {
	color: black;
	outline: none !important;
	box-shadow: none;
	border: 1px solid rgb(207, 147, 111);
}

option {
	border: 1px solid #dee2e6 !important;
}

#inputSearch{
	width: 40%;
	border: 1px solid rgb(207, 185, 136);
	font-size: 13px;
}

#inputSearch:focus {
	color: black;
	outline: none !important;
	box-shadow: none;
	border: 1px solid rgb(207, 185, 136);
}

#btnSearch {
	color: white;
	background-color: rgb(207, 185, 136);
}

#logoImg {
	width: 50px;
}

/* 반응형 웹 사이드 내비 */
#sidNavWrapper{
	position: relative;
}
.sideNav {
	position: absolute;
	background-color: #cfb988d1;
	text-align: center;
	padding-top: 100px;
	width: 200px;
    height: 99.2%;
    display: none;
    padding-right: 0;
	/*transition-property: all;
    transition-timing-function: ease;
    transition-duration: 1s;*/
}

#btnNav1{
	position: absolute;
	width: 200px;
	padding-right: 0;
	text-align: center;
	height: 100px;
	line-height: 5;
}

#btnNav{
	color: rgb(207, 147, 111);
	width: 100%;
	font-size: large;
    font-weight: 600;
    cursor: pointer;
    height: 80px;
}

#btnNav:hover {
	border-radius: 30px;
    border: 1px solid rgb(207, 147, 111);
    padding: 3px 10px;
    background-color: white;
}

#line{
	width: 150px;
	height: 2px;
	background-color: white;
    margin: 0px 20px;
}

.sideNav-Abox {
	background-color: rgb(207, 185, 136);
	width: 100%;
}

.sideNav p {
	font-size: large;
	font-weight: bold;
	color: white;
}

.sideNav a {
	font-size: medium;
	color: white;
	text-decoration: none;
	margin-top: 50px;
}

/* 반응형 모바일 내비 */
.topNav{
	background-color: rgb(207, 185, 136);
	height: 50px;
	padding: 10px;
}
.topNav a {
	color: white;
	text-decoration: none;
	margin: 20px;
	line-height: 1.9;
}

/* 테이블 */
.listContainer{
	border-bottom: 1px solid rgb(207, 185, 136);
}
.table{
	table-layout: fixed;
  word-wrap: break-word;
	font-size: 13px;
}
thead {
	border-bottom: 2px solid rgb(207, 147, 111);
}

td{
	width: 20%;
}

#selectGrade {
	border: 1px solid rgb(207, 147, 111);
	font-weight: bold;
}

#selectGrade:focus {
	color: black;
	outline: none !important;
	box-shadow: none;
	border: 1px solid rgb(207, 147, 111);
}

#selectGrade, .selectGrade {
	font-size: small;
    width: 100px !important;
    padding: 5px;
}

.selectGrade:focus {
	color: black;
	outline: none !important;
	box-shadow: none;
	border: 1px solid rgba(0,0,0,.25);
}

.blackDate p{
	margin: 0px;
	font-size: small;
	line-height: 1.8;
}
.blacklist_content {
	width: 100%;
	border: none;
	text-align: center;
}
.form-check-input:checked {
	background-color: #bf2525;
	border-color: #bf2525;
}
.form-check-input:focus {
	outline: none !important;
	box-shadow: none;
	border-color: rgba(0,0,0,.25);
}

#btnModify,
#btnSave,
#btnCancle{
	font-size: 13px;
}


/* 페이징 */
.page-item>a {
	color: white;
	background-color: rgb(207, 185, 136);
	font-size: 13px;
}

.page-item>a:hover {
	color: rgb(207, 147, 111);
	background-color: rgb(231, 214, 176);
}

.page-item>a:focus {
	color: rgb(207, 147, 111);
	background-color: rgb(231, 214, 176);
	outline: none !important;
	box-shadow: none;
}

#tapBox{
		margin: 0 10.5vw 0 10.5vw;
}

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
		background-color: rgb(98, 188, 240);
		color: white;
		text-decoration: none;
}

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
	<div class="wrapper">

		<div class="row mt-5" id="tapBox">
				<div class="col">
						<ul id="profileTap">
								<li><a href="/member/toMyPage">회원정보</a></li>
								<li><a href="/manager/memberList?curPage=1">전체 회원 목록</a></li>
								<li><a href="/manager/toBlackList?curPage=1">블랙리스트 관리</a></li>
								<li><a href="/manager/toInquiryList?seq_category=${inquiry.seq_category}">문의/신고</a></li>
								<li><a href="/manager/toCategoryCM">카테고리 관리</a></li>
								<li><a href="/member/toMyBoard">내 글</a></li>
								<li><a href="/member/toMyComment">내 댓글</a></li>
								<li><a href="#" id="return">돌아가기</a></li>
						</ul>
				</div>
		</div>

		<div class="row" id="sidNavWrapper" style="margin: 0 7.5vw 0 7.5vw;">
			
			<div class="col listContainer m-2">
			<div class="col listHeader text-center mt-5">
				<span id="titleSpan">
					<c:choose>
						<c:when test="${not empty list[0].member_sns}">
							<span class="material-symbols-outlined">emoji_people</span>				
							전체 회원 리스트 
							<span class="material-symbols-outlined">accessibility_new</span>
						</c:when>
						<c:otherwise>
							<span class="material-symbols-outlined">skull</span>				
							블랙 리스트 
							<span class="material-symbols-outlined">skull</span>
						</c:otherwise>
					</c:choose>
				</span>
				<form id="searchForm" action="/manager/toSearch" method="get">
					<div class="col m-5" id="inputDiv">
						<div class="input-group mb-3" id="inputGroup">
							<select class="form-select" name="category" id="selectKeyword">
  								<option value="all" selected>전체</option>
  								<option value="member_id">ID</option>
  								<option value="member_name">이름</option>
  								<option value="member_nickname">닉네임</option>
							</select>
							<input type="search" id="inputSearch" name="keyword" class="form-control" placeholder="검색" aria-describedby="btnSearch">
							<button class="btn" type="submit" id="btnSearch">
								<span class="input-group-text material-symbols-outlined" id="iconSearch">search</span>
							</button>
						</div>
						<input class="d-none" type="text" name="curPage1" value="1">
					</div>
				</form>
			</div>
			<form id="list" action="/manager/toModify" method="get">
				<div class="tblContainer m-5">
					<div class="col btnSpace d-flex justify-content-end">
						<button class="btn" type="button" id="btnModify">수정</button>
						<button class="btn d-none" type="button" id="btnSave">저장</button>
						<button class="btn d-none" type="reset" id="btnCancle">취소</button>
					</div>
					<table class="table align-middle text-center mt-2">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th class="d-none d-md-table-cell" scope="col">닉네임</th>
								<th class="d-none d-md-table-cell" scope="col">이름</th>
								<th scope="col">연락처</th>
								<th class="d-none d-lg-table-cell" scope="col">이메일</th>
								<th scope="col"><select class="form-select" name="member_grade" id="selectGrade">
										<option class="gradeOpt" id="gAll" value="0" selected>전체</option>
										<option class="gradeOpt" id="gGeneral" value="1">일반 회원</option>
										<option class="gradeOpt" id="gShelter" value="2">보호소 회원</option>
										<option class="gradeOpt" id="gStandby" value="3">대기 회원</option>
										<option class="gradeOpt" id="gManager" value="4">매니저</option>
								</select></th>
								<th class="d-none d-lg-table-cell" scope="col">사업자번호</th>
								<th class="blackListTh" scope="col">블랙리스트</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="9">
											조회 결과가 없습니다.
										</td>
									</tr>
								</c:when>
								<c:otherwise>
								<c:forEach items="${list}" var="list">
								<tr class="listTr" style="background: none;">
									<td scope="row" class="member_id">${list.member_id}</td>
									<td class="member_nickname d-none d-md-table-cell">${list.member_nickname}</td>
									<td class="member_name d-none d-md-table-cell">${list.member_name}</td>
									<td class="member_phone">${list.member_phone}</td>
									<td class="member_email d-none d-lg-table-cell">${list.member_email}</td>
									<td>
										<select class="form-select selectGrade" name="member_grade1" disabled>
											<c:if test="${list.member_grade == 1}">
												<option class="member_grade" id="general" value="1" selected>일반 회원</option>
												<option class="member_grade" id="shelter" value="2">보호소 회원</option>
												<option class="member_grade" id="standby" value="3">대기 회원</option>
												<option class="member_grade" id="manager" value="4">매니저</option>
											</c:if>
											<c:if test="${list.member_grade == 2}">
												<option class="member_grade" id="general" value="1">일반 회원</option>
												<option class="member_grade" id="shelter" value="2" selected>보호소 회원</option>
												<option class="member_grade" id="standby" value="3">대기 회원</option>
												<option class="member_grade" id="manager" value="4">매니저</option>
											</c:if>
											<c:if test="${list.member_grade == 3}">
												<option class="member_grade" id="general" value="1">일반 회원</option>
												<option class="member_grade" id="shelter" value="2">보호소 회원</option>
												<option class="member_grade" id="standby" value="3" selected>대기 회원</option>
												<option class="member_grade" id="manager" value="4">매니저</option>
											</c:if>
											<c:if test="${list.member_grade == 4}">
												<option class="member_grade" id="general" value="1">일반 회원</option>
												<option class="member_grade" id="shelter" value="2">보호소 회원</option>
												<option class="member_grade" id="standby" value="3">대기 회원</option>
												<option class="member_grade" id="manager" value="4" selected>매니저</option>
											</c:if>
										</select>
									</td>
									<td class="member_brn d-none d-lg-table-cell">${list.member_brn}</td>
									<td class="blackList${list.member_id} blacklist">
										<div class="form-check blackDate d-flex justify-content-center">
											<c:choose>
												<c:when test="${not empty list.blacklist_content}">
													<input class="form-check-input checkBlack" type="checkbox" value="Y" name="checkBlack" checked disabled>&nbsp;<p>${list.blacklist_date}</p>
												</c:when>
												<c:otherwise>
													<input class="form-check-input checkBlack" type="checkbox" value="N" name="checkBlack" disabled><p></p>
												</c:otherwise>
											</c:choose>
										</div>
										<input type="text" class="blacklist_content" name="blackListCtt" value="${list.blacklist_content}" title="${list.blacklist_content}" disabled>
									</td>
								</tr>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</form>
				<%-- 페이징 --%>
				<c:if test="${not empty curPageMap}">
					<div class="paging">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center mt-5">
								<c:if test="${curPageMap.needPrev eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/memberList?curPage=${curPageMap.startNavi-1}">&raquo;</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${curPageMap.startNavi}"
									end="${curPageMap.endNavi}" step="1">
									<li class="page-item"><a class="page-link"
										href="/manager/memberList?curPage=${pageNum}">${pageNum}</a></li>
								</c:forEach>
								<c:if test="${curPageMap.needNext eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/memberList?curPage=${curPageMap.endNavi+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</c:if>
				<c:if test="${not empty curPageMapSearch}">
					<div class="paging">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center mt-5">
								<c:if test="${curPageMapSearch.needPrev eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/toSearch?category=${category}&keyword=${keyword}&curPage1=${curPageMapSearch.startNavi-1}">&raquo;</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${curPageMapSearch.startNavi}"
									end="${curPageMapSearch.endNavi}" step="1">
									<li class="page-item"><a class="page-link"
										href="/manager/toSearch?category=${category}&keyword=${keyword}&curPage1=${pageNum}">${pageNum}</a></li>
								</c:forEach>
								<c:if test="${curPageMapSearch.needNext eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/toSearch?category=${category}&keyword=${keyword}&curPage1=${curPageMapSearch.endNavi+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</c:if>
				<c:if test="${not empty curPageMapGrade}">
					<div class="paging">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center mt-5">
								<c:if test="${curPageMapGrade.needPrev eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/toSearchGrade?member_grade=${member_grade}&curPage=${curPageMapGrade.startNavi-1}">&raquo;</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${curPageMapGrade.startNavi}"
									end="${curPageMapGrade.endNavi}" step="1">
									<li class="page-item"><a class="page-link"
										href="/manager/toSearchGrade?member_grade=${member_grade}&curPage=${pageNum}">${pageNum}</a></li>
								</c:forEach>
								<c:if test="${curPageMapGrade.needNext eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/toSearchGrade?member_grade=${member_grade}&curPage=${curPageMapGrade.endNavi+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</c:if>
				<c:if test="${not empty curPageMapBlack}">
					<div class="paging">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center mt-5">
								<c:if test="${curPageMapBlack.needPrev eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/toBlackList?curPage=${curPageMapBlack.startNavi-1}">&raquo;</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${curPageMapBlack.startNavi}"
									end="${curPageMapBlack.endNavi}" step="1">
									<li class="page-item"><a class="page-link"
										href="/manager/toBlackList?curPage=${pageNum}">${pageNum}</a></li>
								</c:forEach>
								<c:if test="${curPageMapBlack.needNext eq true}">
									<li class="page-item"><a class="page-link"
										href="/manager/toBlackList?curPage=${curPageMapBlack.endNavi+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
	<script>
		const btnModify = document.getElementById("btnModify");
		const btnSave = document.getElementById("btnSave");
		const btnCancle = document.getElementById("btnCancle");
		const checkBox = document.getElementsByClassName("form-check-input");
		const selectGrade = document.getElementsByClassName("selectGrade");
		const blacklist_content = document.getElementsByClassName("blacklist_content");
		const listTr = document.getElementsByClassName("listTr");
		
		window.onload = function(){ // 회원등급 선택 상태
			if("${member_grade}" == "999"){
				$(".gradeOpt").removeAttr("selected");
				$("#gAll").attr("selected", true);
			}else if("${member_grade}" == "1"){
				$(".gradeOpt").removeAttr("selected");
				$("#gGeneral").attr("selected", true);
			}else if("${member_grade}" == "2"){
				$(".gradeOpt").removeAttr("selected");
	        	$("#gShelter").attr("selected", true);
			}else if("${member_grade}" == "3"){
				$(".gradeOpt").removeAttr("selected");
	        	$("#gStandby").attr("selected", true);
			}else if("${member_grade}" == "4"){
				$(".gradeOpt").removeAttr("selected");
	        	$("#gManager").attr("selected", true);
			}
		}
		
		$("#btnNav").on("click", function(){
			$(".sideNav").toggle("fast");
		})
		
		$("td").on("click", function(e) { // 선택한 회원 회색 배경 표시
			if (btnModify.style.display != "none") {
				for (let i = 0; i < listTr.length; i++) {
					listTr[i].style.background = "none";
				}
				$(this).parent(".listTr").css("background-color", "#dee2e6");
			}
		})

		btnModify.addEventListener("click", function(e) {
			let rs = 0;
			for (let i = 0; i < listTr.length; i++) {
				if (listTr[i].style.background != "none") {
					rs++;
				}
			}
			if (rs === 0) {
				alert("회원을 선택해주세요.");
				return;
			}

			btnModify.style.display = "none";
			btnSave.setAttribute("class", "btn d-flex");
			btnCancle.setAttribute("class", "btn d-flex");
			for (let i = 0; i < listTr.length; i++) {
				if (listTr[i].style.background != "none") {
					checkBox[i].removeAttribute("disabled");
					selectGrade[i].removeAttribute("disabled");
					blacklist_content[i].removeAttribute("disabled");
				}
			}
		})
		
		btnSave.addEventListener("click", function(e) {
			const lastCheck = confirm("정말 수정하시겠습니까?");
			
			let arrGrade = new Array(); // 현재 jstl 리스트의 값 배열로 저장
			let arrBLDate = new Array(); // 현재 jstl 리스트의 값 배열로 저장
			<c:forEach items="${list}" var="item">
				arrGrade.push("${item.member_grade}");
				arrBLDate.push("${item.blacklist_date}");
			</c:forEach>
			
			if (lastCheck === true) {
				for (i = 0; i < checkBox.length; i++) {
					if(listTr[i].style.background === "none rgb(222, 226, 230)"){
						let td = listTr[i].childNodes;
						let blackList = td[15].childNodes;
						let blackListChk = blackList[1].firstElementChild.checked;
						let blackListDate = blackList[1].lastElementChild;
						let blackListCtt = blackList[3].value;
						let member_grade = selectGrade[i].value;
						let member_id = listTr[i].firstElementChild.innerHTML;
						
						if(arrGrade[i] === member_grade){
							if(blackListChk === true && blackListCtt === ""){
								alert("블랙리스트 사유를 입력해주세요");
								return;
							}else if(blackListChk === false){
								blackListDate.innerHTML = "";
								blackList[3].setAttribute("value", "");
							}
						}else if(arrGrade[i] !== member_grade){
							if(blackListChk === true && blackListCtt === ""){
								alert("블랙리스트 사유를 입력해주세요");
								return;
							}else if(blackListChk === false){
								blackListDate.innerHTML = "";
								blackList[3].setAttribute("value", "");
							}
						}
						
						$.ajax({
							url: "/manager/toModify",
							data: {member_id : member_id, member_grade : member_grade, 
								blackListChk : blackListChk, blackListCtt : blackListCtt},
							type: "get",
							dataType: "json",
							success: function(data){
								
								$(".blackList"+member_id).empty();
								let emptyBox1 = $("<input hidden>");
								let emptyBox2 = $("<input hidden>");
								let div = $("<div class='form-check blackDate d-flex justify-content-center'>");
								if(blackListChk === true){
									let input1 = $("<input class='form-check-input checkBlack' type='checkbox' value='Y' name='checkBlack' checked disabled>");
									let p = $("<p>").append("&nbsp;").append(data.blacklist_date);
									div.append(input1, p);
								}else{
									let input1 = $("<input class='form-check-input checkBlack' type='checkbox' value='N' name='checkBlack' disabled>");
									div.append(input1);
								}
								let input2 = $("<input type='text' class='blacklist_content' name='blackListCtt' value="+(data.blacklist_content)+" title="+(data.blacklist_content)+" disabled>")
								$(".blackList"+member_id).append(emptyBox1, div, emptyBox2, input2);
								
							},error: function(e){
								console.log(e);
							}
						})
					}
					checkBox[i].setAttribute("disabled", "true");
					selectGrade[i].setAttribute("disabled", "true");
					blacklist_content[i].setAttribute("disabled", "true");
				}
				btnModify.style.display = "flex";
				btnSave.setAttribute("class", "btn d-none");
				btnCancle.setAttribute("class", "btn d-none");
			}
			return;
		})

		btnCancle.addEventListener("click", function() {
			btnModify.style.display = "flex";
			btnSave.setAttribute("class", "btn d-none");
			btnCancle.setAttribute("class", "btn d-none");
			for (let i = 0; i < listTr.length; i++) {
				checkBox[i].setAttribute("disabled", "true");
				selectGrade[i].setAttribute("disabled", "true");
				blacklist_content[i].setAttribute("disabled", "true");
			}
		})
		
		$("#selectGrade").on("change", function(){
			let rs = $("#selectGrade").val();
			if(rs > 0){
				location.href="/manager/toSearchGrade?member_grade="+rs+"&curPage=1";
			}else{
				location.href="/manager/memberList?curPage=1";
			}
		})

		if (!sessionStorage.getItem('referrer')){
				sessionStorage.setItem("referrer", document.referrer);
		}

		document.getElementById('return').addEventListener('click', () =>{
				const referrer = sessionStorage.getItem('referrer');
				sessionStorage.removeItem("referrer"); 
				location.href = referrer || '/';
		})
	</script>
</body>
</html>