<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,600,1,0" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
    <title>유기동물 상세페이지</title>
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
    .header{
        height: 150px;
        background-color: rgb(207, 185, 136);
        color: rgb(207, 147, 111);
    }
    .footer{
    	height: 200px;
    	border: 1px solid rgb(207, 147, 111);
    }
    #table{
    	width: 70%;
    }
    .table th{
    	width: 120px;
    }
    #detailImg{
    	margin: 10px;
    	height: 500px;
    }
    .backgroundDiv{
    	position: absolute;
    	background-color: rgb(207, 185, 136);
    	margin-top: 350px;
    	width: -webkit-fill-available;
    	height: 47em;
    	z-index: -1;
    }
    .btn{
    	background-color: rgb(207, 185, 136);
    	border: white;
    }
    .btn:hover{
    	background-color: rgb(207, 147, 111);
    	border: white;
    }
    #commentW{
    	 color: white; 
    	 text-shadow: -1px 0 #e5d8bb, 0 1px #e5d8bb, 1px 0 #e5d8bb, 0 -1px #e5d8bb;
    }
    #commentM{
    	 color: rgb(207, 147, 111); 
    	 text-shadow: -1px 0 #e5d8bb, 0 1px #e5d8bb, 1px 0 #e5d8bb, 0 -1px #e5d8bb;
    }
    
    </style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
    <div class="container">
		<c:choose>
			<c:when test="${not empty data}">
				<div class="contentContainer">
					<div class="col mt-5 d-flex justify-content-center">
						<img class="img-fluid rounded" src="${data.popfile}"
							id="detailImg">
						<div class="backgroundDiv"></div>
					</div>
					<%-- 반응형 핸드폰 --%>
					<div
						class="col-12 d-flex d-sm-none table-responsive mt-5 justify-content-center">
						<table class="table table-bordered align-middle text-center">
							<tbody>
								<tr>
									<th scope="row">보호시작일</th>
									<td>${data.happenDt}</td>
								</tr>
								<tr>
									<th scope="row">품종</th>
									<td>${data.kindCd}</td>
								</tr>
								<tr>
									<th scope="row">발견장소</th>
									<td colspan="2">${data.orgNm}&nbsp;${data.happenPlace}</td>
								</tr>
								<tr>
									<th scope="row">특징</th>
									<td colspan="2">${data.colorCd}&nbsp;${data.specialMark}</td>
								</tr>
								<tr>
									<th scope="row">나이</th>
									<td colspan="2">${data.age}</td>
								</tr>
								<tr>
									<th scope="row">체중</th>
									<td colspan="2">${data.weight}</td>
								</tr>
								<tr>
									<th scope="row">보호소명</th>
									<td colspan="2">${data.careNm}</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td colspan="2">${data.careTel}</td>
								</tr>
								<tr>
									<th scope="row">보호장소</th>
									<td colspan="2">${data.careAddr}</td>
								</tr>
								<tr>
									<th scope="row">상태</th>
									<td colspan="2">${data.processState}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<%-- 반응형 웹 --%>
					<div
						class="table-responsive mt-5 d-none d-sm-flex justify-content-center">
						<table
							class="table table-bordered justify-content-center align-middle text-center"
							id="table">
							<tbody>
								<tr>
									<th scope="row">보호시작일</th>
									<td>${data.happenDt}</td>
								</tr>
								<tr>
									<th scope="row">품종</th>
									<td>${data.kindCd}</td>
								</tr>
								<tr>
									<th scope="row">발견장소</th>
									<td colspan="2">${data.orgNm}&nbsp;${data.happenPlace}</td>
								</tr>
								<tr>
									<th scope="row">특징</th>
									<td colspan="2">${data.colorCd}&nbsp;${data.specialMark}</td>
								</tr>
								<tr>
									<th scope="row">나이</th>
									<td colspan="2">${data.age}</td>
								</tr>
								<tr>
									<th scope="row">체중</th>
									<td colspan="2">${data.weight}</td>
								</tr>
								<tr>
									<th scope="row">보호소명</th>
									<td colspan="2">${data.careNm}</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td colspan="2">${data.careTel}</td>
								</tr>
								<tr>
									<th scope="row">보호장소</th>
									<td colspan="2">${data.careAddr}</td>
								</tr>
								<tr>
									<th scope="row">상태</th>
									<td colspan="2">${data.processState}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<%-- 반응형 모바일 --%>
					<div class="col d-sm-none text-center mt-5" id="commentM">
						<h4 id="comment">[해당 유기동물에 관한 모든 문의는 해당 보호소로 부탁드립니다.]</h4>
					</div>
					<%-- 반응형 웹 --%>
					<div class="cold d-none d-sm-block text-center mt-5" id="commentW">
						<h4 id="comment">[해당 유기동물에 관한 모든 문의는 해당 보호소로 부탁드립니다.]</h4>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col notFoundSpace mt-5 text-center">
					<p style="font-size: xxx-large;">!</p>
					<img src="/resources/images/comme-md.png" id="notFoundImg">
					<h3 class="mt-3">해당 동물은 상세보기가 제공되지 않습니다</h3>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="col d-flex justify-content-center mt-5 mb-5" id="btnSpace">
            <button type="button" class="btn btn-secondary m-2" id="btnList">목록으로</button>
        	<button type="button" class="btn btn-secondary m-2" id="btnBack">뒤로가기</button>
        </div>
    </div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
    <script>
    	document.getElementById("btnList").onclick = function(){
    		location.href = "/shelterAnimal/toShelterAnimal?curPage="+1;
    	}
    	
    	document.getElementById("btnBack").onclick = function(){ // 뒤로가기
    		let keyword = "${keyword}";
    		let upkind = "${upkind}";
    		if(keyword !== ""){
    			location.href = "/shelterAnimal/toSearch?keyword=${keyword}&curPage=${curPage}";
    		}else if(upkind !== ""){
    			location.href = "/shelterAnimal/toSelectUpkind2?upkind=${upkind}&curPage=${curPage}";
    		}else{
    			location.href = "/shelterAnimal/toShelterAnimal?curPage=${curPage}";
    		}
    	}
    	
    </script>
</body>
</html>