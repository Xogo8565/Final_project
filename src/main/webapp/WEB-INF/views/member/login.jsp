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
	
	/* 하이퍼링크 */
	.cls-href {
	    color: black;
	    text-decoration: none;
	}
	
	/* 버튼 */
	.btn-light {
	    width: 200px;
	}
	
	/* 로그인 전체 */
	.body {
	    padding: 20px;
	}
</style>

<body>
    <div class="container">
        <div class="header">
            여기는 헤더
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
            	<form id="form-login" action="/toLogin" method="post">
	                <div class="row cls-row-input d-flex justify-content-center">
	                    <div class="col-8 col-lg-6 col-xl-4">
	                        <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
	                    </div>
	                </div>
	                <div class="row cls-row-input d-flex justify-content-center">
	                    <div class="col-8 col-lg-6 col-xl-4">
	                        <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
	                    </div>
	                </div>
	                <div class="row cls-row-check">
	                    <div class="col d-flex justify-content-center">
	                        <input type="checkbox" id="CheckRememberId">
	                        <label for="CheckRememberId">&nbsp;&nbsp;로그인 상태 유지</label>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col d-flex justify-content-center">
	                        <button type="button" id="btnLogin" class="btn btn-light">로그인</button>
	                    </div>
	                </div>
	
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
				</form>
            </div>
        </div>

        <div class="footer">
            여기는 풋터
        </div>
    </div>
<script>

	

</script>
</body>
</html>