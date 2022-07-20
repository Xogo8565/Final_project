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
    <title>비밀번호 찾기</title>
</head>
<style>


/* 타이틀 수평선 hr */
#hr {
    margin: 16px;
}

/* 줄간격 여백주기 */
.bodyContent > .row {
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


/* 바디 전체 */
.body {
    padding: 20px;
}

/* 찾기 너비 */
.cls-findBox {
    width: 400px;
    margin-bottom: 25px;
}

/* 인풋창에 화살표 안나오게 */ 
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}

/* 라벨링 */
.cls-label {
    margin-bottom: 10px;
}

/* 찾기버튼 */
.buttonRow {
    margin-top: 50px;
}

#btnFindPw {
    width: 200px;
}

/*  */
.cls-inputRow {
    margin-bottom: 10px;
}

/* input 옆 버튼 */
.cls-inputBtn {
    width: 100%;
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
                        <h1>비밀번호 찾기</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr id="hr">
                    </div>
                </div>
            </div>

            <div class="bodyContent">

                <div class="row">
                    <div class="col d-flex justify-content-center">
                        <div class="cls-findBox">
                            <div class="row cls-inputRow">
                                <div class="col-9">
                                    <input type="text" class="form-control cls-input" name="email" id="email" placeholder="이메일을 입력하세요">
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-warning cls-inputBtn" id="submit">전송</button>
                                </div>
                            </div>
                            <div class="row cls-inputRow">
                                <div class="col-9">
                                    <input type="number" class="form-control cls-input" name="proof" id="proof" placeholder="인증번호를 입력하세요">
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-warning cls-inputBtn" id="">확인</button>
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col rs d-flex justify-content-center">
                            		
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row buttonRow">
                    <div class="col d-flex justify-content-center">
                        <button type="button" class="btn btn-light" id="btnFindpw">비밀번호 찾기</button>
                    </div>
                </div>

            </div>
        </div>

        <div class="footer">
            여기는 풋터
        </div>
    </div>


</body>
</html>