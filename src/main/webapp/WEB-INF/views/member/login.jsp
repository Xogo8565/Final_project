<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>로그인</title>
</head>
<style>
    /* 또는 글씨 양옆으로 선 그리기*/
	.line {
	    display: flex;
	    flex-basis: 100%;
	    align-items: center;
	    color: black;
	    margin: 8px 0px;
	}
	.line::before,
	.line::after {
	    content: "";
	    flex-grow: 1;
	    background: rgba(0, 0, 0, 0.35);
	    height: 1px;
	    font-size: 0px;
	    line-height: 0px;
	    margin: 0px 16px;
	}
	
	/* 로그인 타이틀 수평선 hr */
	#hr {
	    margin: 16px;
	}
	
	/* 줄간격 여백주기 */
	.bodyContent .row {
	    margin-top: 10px;
	}
	
	/* 백그라운드 컬러 */
	.body {
	    background-color: rgb(231, 231, 231);	    
	}
	
	/* 바디부분 패딩 */
	.body {
	    padding-left: 10%;
		padding-right: 10%;
		padding-top: 5%;
		padding-bottom: 5%;

	}
	
	/* 하이퍼링크 */
	.cls-href {
	    color: black;
	    text-decoration: none;
	}
	
	/* 버튼 */
	.btn-light {
	    width: 200px;
	}

</style>

<body>

        
    <div class="">
        <div class="header">
            <jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
        </div>

        <div class="body">
            <div class="bodyTitle">
                <div class="row">
                    <div class="col d-flex justify-content-center">
                        <h1>Login</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr id="hr">
                    </div>
                </div>
            </div>

            <div class="bodyContent">
            	<form id="form-login">
	                <div class="row cls-row-input d-flex justify-content-center">
	                    <div class="col-8 col-lg-6 col-xl-4">
	                        <input type="text" class="form-control" id="id" placeholder="아이디">
	                    </div>
	                </div>
	                <div class="row cls-row-input d-flex justify-content-center">
	                    <div class="col-8 col-lg-6 col-xl-4">
	                        <input type="password" class="form-control" id="pw" placeholder="비밀번호">
	                    </div>
	                </div>
	                <div class="row cls-row-check">
	                    <div class="col d-flex justify-content-center">
	                        <input type="checkbox" id="checkRememberId">
	                        <label for="checkRememberId">&nbsp;&nbsp;아이디 저장하기</label>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col d-flex justify-content-center">
	                        <button type="button" id="btnLogin" class="btn btn-light">로그인</button>
	                    </div>
	                </div>
				</form>
	                <div class="row d-flex justify-content-center">
	                    <div class="col-12 col-sm-6 d-flex justify-content-center">
	                        <a href="/member/toSignupPage" class="cls-href">회원가입</a>
	                    </div>
	                    <div class="col-12 col-sm-6 d-flex justify-content-center">
	                        <a href="/member/toFindIdPage" class="cls-href">아이디</a>
	                        <span>&nbsp;/&nbsp;</span>
	                        <a href="/member/toFindPwPage" class="cls-href">비밀번호&nbsp;</a>
	                        <span>찾기</span>
	                    </div>
	                </div>
<!-- 	
	                <div class="row">
	                    <div class="col-12">
	                        <p class="line">또는</p>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col d-flex justify-content-center">
	                        <button type="button" class="btn btn-light">카카오</button>
	                    </div>
					</div>
-->
            </div>
        </div>
         <div class="footer">
            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
        </div>

    </div>
<script>
	// 이전에 있던 페이지에 대한 세션값 셋팅
	if(!sessionStorage.getItem('referrer')){
		sessionStorage.setItem("referrer", document.referrer);
	}
	


	// 일반 로그인
	$("#btnLogin").on("click", ()=>{
		login();
	});

	let input = document.querySelectorAll("#form-login input");
	input.forEach(e=>{
		e.onkeypress = function (a){
			if(a.keyCode===13){
				login();
			}
		} 
	})



	function login () {
		if ($("#id").val() === "" || $("#pw").val() === "") {
			alert("아이디 혹은 비밀번호를 입력하세요.");
			return;
		}

		$.ajax({
			url: "/member/loginProc"
			, type: "post"
			, data: {member_id: $("#id").val(), member_pw: $("#pw").val()}
			, success: function (data) {
				if (data === 'success') {
					const referrer = sessionStorage.getItem('referrer');
					sessionStorage.removeItem("referrer"); 
					location.href = referrer || '/';
				} else if (data === "fail") {
					alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
				} else if (data === "await") {
					alert("관리자의 승인이 필요합니다.");
				}
			}, error: function (e) {
				console.log(e);
			}
		});
	}

	
	//쿠키 가져오기
	$(function() {
		
         let key = getCookie("key");
         $("#id").val(key);
         
         if($("#id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
            $("#checkRememberId").attr("checked",true); //ID 저장하기를 체크상태로 두기
         }
         
         $("#checkRememberId").change(function(){ //체크박스에 변화가 있다면
            if($("#checkRememberId").is(":checked")){ //id저장하기 체크했을때
               setCookie("key",$("#id").val(),30); //30일동안 쿠키 저장
            }else{
               deleteCookie("key");
            }
         })
         
         // ID 저장하기를 체크한 상태에서 id를 입력하는 경우 , 이럴때도 쿠키 저장.
         $("#id").keyup(function(){ //ID 입력칸에 ID를 입력할 때
            if($("#checkRememberId").is(":checked")){ //ID 저장하기를 체크한 상태라면
               setCookie("key", $("#id").val(),30); //30일동안 쿠기 보관
            }
         })
	});
	
	// 쿠키 저장하기
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	// 쿠키 삭제
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	// 쿠키 가져오기
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){ // 쿠키가 존재한다면
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length; // if(end == -1) -> 쿠키 값의 마지막 위치 인덱스 번호 설정
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

	

</script>
</body>
</html>