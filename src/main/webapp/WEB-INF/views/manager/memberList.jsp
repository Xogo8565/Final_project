<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Document</title>
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

    .btn{
        color: white;
    	background-color: rgb(207, 185, 136);
    	border: white;
    }
    #btnSave{
        margin-right: 10px;
    }
    .btn:hover{
    	background-color: rgb(207, 147, 111);
    	border: white;
    }

    /* 테이블 */
    thead {
        border-bottom: 2px solid rgb(207, 147, 111);
    }
    select {
        width: 140px !important;
    }
    /* 페이징 */
    .page-item>a {
        color: white;
        background-color: rgb(207, 185, 136);
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
</style>
</head>
<body>
    <!-- header -->
	<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
	<div class="container">
        <form id="list">
            <div class="listContainer">
                <div class="col listHeader text-center mt-5">
                    <h3>전체 회원 리스트</h3>
                    <div class="col btnSpace d-flex justify-content-end">
                        <button class="btn" type="button" id="btnModify">수정</button>
                        <button class="btn d-none" type="button" id="btnSave">저장</button>
                        <button class="btn d-none" type="reset" id="btnCancle">취소</button>
                    </div>
                </div>
                <table class="table align-middle text-center">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">닉네임</th>
                            <th scope="col">이름</th>
                            <th scope="col">연락처</th>
                            <th scope="col">이메일</th>
                            <th scope="col">
                                <select class="form-select">
                                    <option selected>전체</option>
                                    <option value="1">일반 회원</option>
                                    <option value="2">보호소 회원</option>
                                    <option value="3">대기 회원</option>
                                    <option value="4">매니저</option>
                                </select>
                            </th>
                            <th scope="col">사업자번호</th>
                            <th scope="col">블랙리스트 여부</th>
                            <th scope="col">블랙리스트 사유</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="listTr" style="background:none;">
                            <td scope="row" class="member_id">asdf1</td>
                            <td class="member_nickname">닉네임</td>
                            <td class="member_name">이름</td>
                            <td class="member_phone">010-1111-1111</td>
                            <td class="member_email">asdf@gmail.com</td>
                            <td>
                                <select class="form-select selectGrade" name="member_grade" disabled>
                                    <option class="member_grade" id="general" value="1">일반 회원</option>
                                    <option class="member_grade" id="shelter" value="2">보호소 회원</option>
                                    <option class="member_grade" id="standby" value="3">대기 회원</option>
                                    <option class="member_grade" id="manager" value="4">매니저</option>
                                </select>
                            </td>
                            <td class="member_brn">사업자번호</td>
                            <td>
                                <div class="form-check d-flex justify-content-center">
                                    <input class="form-check-input" type="checkbox" value="" id="checkBlack" name="checkBlack"
                                        checked disabled>
                                </div>
                            </td>
                            <td>
                                <input type="text" class="blacklist_content" name="blacklist_content" value="블랙사유" disabled>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <!-- 페이징 -->
        <div class="paging">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center mt-5">
					<c:if test="${naviMap.needPrev eq true}">
						<li class="page-item"><a class="page-link"
							href="/board/board?curPage=${naviMap.startNavi-1}">&raquo;</a></li>
					</c:if>
					<c:forEach var="pageNum" begin="${naviMap.startNavi}"
						end="${naviMap.endNavi}" step="1">
						<li class="page-item"><a class="page-link"
							href="/board/board?curPage=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${naviMap.needNext eq true}">
						<li class="page-item"><a class="page-link"
							href="/board/board?curPage=${naviMap.endNavi+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
    </div>
    <script>
        const btnModify = document.getElementById("btnModify");
        const btnSave = document.getElementById("btnSave");
        const btnCancle = document.getElementById("btnCancle");
        const checkBox = document.getElementsByClassName("form-check-input");
        const selectGrade = document.getElementsByClassName("selectGrade");
        const blacklist_content = document.getElementsByClassName("blacklist_content");
        const listTr = document.getElementsByClassName("listTr");

        $("td").on("click", function(e){
            if(btnModify.style.display != "none"){
                for(let i=0; i<listTr.length; i++){
                listTr[i].style.background = "none";
                }
                $(this).parent(".listTr").css("background-color", "#dee2e6");
            }
        })

        btnModify.addEventListener("click", function(e){
            let rs = 0;
            for(let i = 0; i < listTr.length; i++){
                if(listTr[i].style.background != "none"){
                    rs++;
                }
            }
            if(rs === 0){
                alert("회원을 선택해주세요.");
                return;
            }

            btnModify.style.display = "none";
            btnSave.setAttribute("class", "btn d-flex");
            btnCancle.setAttribute("class", "btn d-flex");
            for(let i = 0; i < listTr.length; i++){
                if(listTr[i].style.background != "none"){
                    checkBox[i].removeAttribute("disabled");  
                    selectGrade[i].removeAttribute("disabled");  
                    blacklist_content[i].removeAttribute("disabled");  
                }
            }
        })

        btnSave.addEventListener("click", function(){
            const rs = confirm("정말 수정하시겠습니까?");
            if(rs === true){
                btnModify.style.display="flex";
                btnSave.setAttribute("class", "btn d-none");
                btnCancle.setAttribute("class", "btn d-none");
                for(let i = 0; i < checkBox.length; i++){
                    checkBox[i].setAttribute("disabled", "true");  
                }
                for(let i = 0; i < selectGrade.length; i++){
                    selectGrade[i].setAttribute("disabled", "true");  
                }
                for(let i = 0; i < blacklist_content.length; i++){
                    blacklist_content[i].setAttribute("disabled", "true");  
                }
            }
            return;
        })

        btnCancle.addEventListener("click", function(){
            btnModify.style.display="flex";
            btnSave.setAttribute("class", "btn d-none");
            btnCancle.setAttribute("class", "btn d-none");
            for(let i = 0; i < checkBox.length; i++){
                checkBox[i].setAttribute("disabled", "true");  
            }
            for(let i = 0; i < selectGrade.length; i++){
                selectGrade[i].setAttribute("disabled", "true");  
            }
            for(let i = 0; i < blacklist_content.length; i++){
                blacklist_content[i].setAttribute("disabled", "true");  
            }
        })
    </script>
</body>
</html>