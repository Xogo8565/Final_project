<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>유기동물 현황</title>
</head>
<style>
@font-face {
    font-family: 'LeferiBaseType-RegularA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiBaseType-RegularA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
    font-family: 'LeferiBaseType-RegularA';
}
.header {
	height: 150px;
	background-color: rgb(207, 185, 136);
	color: rgb(207, 147, 111);
}

/*축종탭*/
.nav-tabs {
	border-color: rgb(207, 185, 136);
}
.nav-link.active {
	border-color: #cfb988 #cfb988 #fff !important;
	color: rgb(207, 147, 111) !important;
}
.nav-link:hover {
	border-color: #ebd9baa8 #ebd9baa8 #fff !important;
	color: black;
	cursor: pointer;
}
.nav-link {
	color: black;
}
.apiLink {
	text-decoration: none;
	color: black;
}

/* 검색창 */
.input-group {
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
#inputSearch {
	border: 1px solid rgb(207, 185, 136);
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

/* 카드 */
.cardImg {
	height: 300px;
}
#liPlace{
	height: 80px;
	display: flex;
    align-items: center;
}
#liKind{
	height: 40px;
	display: flex;
    align-items: center;
}
#liMark{
	height: 80px;
	display: flex;
    align-items: center;
}
#liDt{
	height: 40px;
	display: flex;
    align-items: center;
}

/* 페이징 */
.page-item>.page-link {
	color: white;
	background-color: rgb(207, 185, 136);
}

.page-item>.page-link:hover {
	color: rgb(207, 147, 111);
	background-color: rgb(231, 214, 176);
	cursor: pointer;
}

.page-item>.page-link:focus {
	color: rgb(207, 147, 111);
	background-color: rgb(231, 214, 176);
	outline: none !important;
	box-shadow: none;
}
</style>
<body>
	<div class="container">
		<div class="header d-flex justify-content-center align-items-center">
			<a class="btn m-2 btn-secondary"
				href="/shelterAnimal/toShelterAnimalList?curPage=1">DB</a> <a
				class="btn m-2 btn-secondary"
				href="/shelterAnimal/toShelterAnimal?curPage=1">API</a>
		</div>
		<div class="col d-flex justify-content-center mt-5">
			<h4>
				<span class="material-symbols-outlined" id="iconNote">speaker_notes</span>&nbsp;&nbsp;&nbsp;
				<img src="/resources/images/comme-md.png" id="logoImg">&nbsp;&nbsp;유기동물 소식
			</h4>
		</div>
		<div class="col mt-5">
			<ul class="nav nav-tabs justify-content-center">
				<li class="nav-item"><a class="nav-link active"
					href="/shelterAnimal/toShelterAnimal?curPage=1">전체</a></li>
				<li class="nav-item"><a class="nav-link linkAjax" id="dogList">개</a> <input
					class="linkAjax d-none" type="text" value="417000">
				</li>
				<li class="nav-item"><a class="nav-link linkAjax" id="catList">고양이</a> <input
					class="linkAjax d-none" type="text" value="422400">
				</li>
				<li class="nav-item"><a class="nav-link linkAjax" id="etcList">기타</a> <input
					class="linkAjax d-none" type="text" value="429900">
				</li>
			</ul>
			<form id="searchForm" action="/shelterAnimal/toSearch" method="get">
			<div class="row justify-content-end mt-5">
				<div class="input-group mb-3">
					<span class="input-group-text material-symbols-outlined" id="iconSearch">search</span> 
					<input type="search" id="inputSearch" name="keyword" class="form-control" placeholder="검색" aria-describedby="btnSearch">
					<button class="btn" type="submit" id="btnSearch">검색</button>
				</div>
				<input class="d-none" type="text" name="curPage" value="1">
			</div>
		</form>
		</div>
		<%-- 목록 출력 --%>
		<div class="card-group justify-content-center">
			<c:forEach items="${data.response.body.items.item}" var="item">
				<a class="apiLink d-flex justify-content-center"
					href="/shelterAnimal/toDetail?desertionNo=${item.desertionNo}&curPage=${pageNum}">
					<div class="card col-3 m-2" style="width: 18rem;">
						<img src="${item.popfile}" class="cardImg">
						<ul class="list-group list-group-flush">
							<li class="list-group-item" id="liPlace">발견장소 :
								${item.orgNm}&nbsp;${item.happenPlace}</li>
							<li class="list-group-item" id="liKind">품종 : ${item.kindCd}</li>
							<li class="list-group-item" id="liMark">특징 :
								${item.specialMark}</li>
							<li class="list-group-item" id="liDt">보호시작일 :
								${item.happenDt}</li>
						</ul>
					</div>
				</a>
			</c:forEach>
		</div>
		<%-- 페이징 --%>
		<c:choose>
			<c:when test="${empty upkind}">
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mt-5">
							<c:if test="${curPageMap.needPrev eq true}">
								<li class="page-item" id="navLeft"><a class="page-link"
									href="/shelterAnimal/toShelterAnimal?curPage=${curPageMap.startNavi-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="pageNum" begin="${curPageMap.startNavi}"
								end="${curPageMap.endNavi}" step="1">
								<li class="page-item navCenter"><a class="page-link"
									href="/shelterAnimal/toShelterAnimal?curPage=${pageNum}">${pageNum}</a></li>
							</c:forEach>
							<c:if test="${curPageMap.needNext eq true}">
								<li class="page-item" id="navRight"><a class="page-link"
									href="/shelterAnimal/toShelterAnimal?curPage=${curPageMap.endNavi+1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</c:when>
			<c:otherwise>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mt-5">
							<c:if test="${curPageMap.needPrev eq true}">
								<li class="page-item" id="navLeft"><a class="page-link"
									href="/shelterAnimal/toSelectUpkind2?upkind=${upkind}&curPage=${curPageMap.startNavi-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="pageNum" begin="${curPageMap.startNavi}" end="${curPageMap.endNavi}" step="1">
								<li class="page-item navCenter"><a class="page-link"
									href="/shelterAnimal/toSelectUpkind2?upkind=${upkind}&curPage=${pageNum}">${pageNum}</a></li>
							</c:forEach>
							<c:if test="${curPageMap.needNext eq true}">
								<li class="page-item" id="navRight"><a class="page-link"
									href="/shelterAnimal/toSelectUpkind2?upkind=${upkind}&curPage=${curPageMap.endNavi+1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		window.onload = function(){
			console.log("${upkind}")
			if("${upkind}" == ""){
				console.log("none")
			}else if("${upkind}" == "417000"){
				$(".nav-link").removeClass("active");
				$("#dogList").addClass("active");
			}else if("${upkind}" == "422400"){
				$(".nav-link").removeClass("active");
	        	$("#catList").addClass("active");
			}else if("${upkind}" == "429900"){
				$(".nav-link").removeClass("active");
	        	$("#etcList").addClass("active");
			}
		}
		
    	$(".nav-link").on("click", function(e){ // 충족탭 이벤트
        	$(".nav-link").removeClass("active");
        	$(this).addClass("active");
    	})
    	
    	$(".linkAjax").on("click", function(){
    		const upkind = $(this).next().val();
    		console.log("this",$(this).next().val());
    		getAjax(1, upkind);
    	})
    	
    	function getAjax(pageNum, upkind){ // 축종탭, 페이징
			$.ajax({
			url: "/shelterAnimal/toSelectUpkind?curPage="+pageNum+"&upkind="+upkind,
			type: "get",
			dataType: "Json",
			success: function(data){
				console.log("data", data);
				let curPage = pageNum;
				let totalCount = (data.response.body.totalCount);
				console.log("total",totalCount);
				let recordCntPerPage = 12;
				let naviCntPerPage = 10;
				let pageTotalCnt = 0;
				
				if(totalCount%recordCntPerPage > 0){
					pageTotalCnt = totalCount/recordCntPerPage+1;
				}else{
					pageTotalCnt = totalCount/recordCntPerPage;
				}
				
				if(curPage < 1){
					curPage = 1;
				}else if(curPage>pageTotalCnt){
					curPage = pageTotalCnt;
				}
				
				let startNo = (Math.floor((curPage-1)/naviCntPerPage)) * naviCntPerPage + 1;
				let lastNo = startNo + naviCntPerPage - 1;
				
				if(pageTotalCnt<lastNo){
					lastNo = pageTotalCnt;
				}
				
				cardAjax(data, upkind, pageNum);
				
				$(".paging").empty();
				$(".notFoundSpace").empty();
				let nav = $("<nav aria-label='Page navigation example'>");
				let ul = $("<ul class='pagination justify-content-center mt-5'>");
				
			    $(".paging").append(nav, ul);    
			    
				if(lastNo > 10){
					let navStart= $("<li class='page-item' id='navStart'>");
					let a1 = $("<a class='page-link'>").attr("onclick", "getAjax("+(curPage-10)+","+upkind+")");
					let span1 = $("<span aria-hidden='true'>").html("&laquo;");
					a1.append(span1);
					navStart.append(a1);
					ul.append(navStart);
					nav.append(ul);
					$(".paging").append(nav);
				}
				
				for(let i=startNo; i<=lastNo; i++){
				let navNo= $("<li class='page-item' id='navNo'>");
				let input1 = $("<input class='page-link pageAjax' type='button' id='pageNo"+i+"'>").val(i).attr("onclick", "getAjax("+i+","+upkind+")");
				navNo.append(input1);
				ul.append(navNo);
				nav.append(ul);
				$(".paging").append(nav);
				}
				
				if(lastNo !== pageTotalCnt){
					let navNext= $("<li class='page-item' id='navNext'>");
					let a2 = $("<a class='page-link'>").attr("onclick", "getAjax("+(lastNo+1)+", "+upkind+")");
					let span2 = $("<span aria-hidden='true'>").html("&raquo;");
					a2.append(span2);
					navNext.append(a2);
					ul.append(navNext);
					nav.append(ul);
					$(".paging").append(nav);
				}
				
			},error: function(e){
				console.log(e);
			}
		})
		}
    	
    	function cardAjax(data, upkind, pageNum){
    		const dataList = (data.response.body.items.item);
			console.log(dataList);
    		$(".card-group").empty();
			for(let item of dataList){
				
				let a = $("<a class='apiLink d-flex justify-content-center' href=''>").attr("href", "/shelterAnimal/toDetail?desertionNo="+(item.desertionNo)+"&upkind="+upkind+"&curPage="+pageNum);
				let div = $("<div class='card col-3 m-2' style='width: 18rem;'>");
				let img = $("<img class='cardImg'>").attr("src", (item.popfile));
				let ul = $("<ul class='list-group list-group-flush'>");
				let li1 = $("<li class='list-group-item'>").html('발견장소 : '+(item.orgNm)+'&nbsp;'+(item.happenPlace));
				let li2 = $("<li class='list-group-item'>").html('품종 : '+(item.kindCd));
				let li3 = $("<li class='list-group-item'>").html('특징 : '+(item.specialMark));
				let li4 = $("<li class='list-group-item'>").html('보호시작일 : '+(item.happenDt));
				let input = $("<input type='text' name='desertionNo'>").addClass("d-none").attr("value",(item.desertionNo));
				ul.append(li1, li2, li3, li4);
				div.append(img, ul);
				a.append(div);
				a.appendTo(".card-group");
			}
    	}
    </script>
</body>
</html>