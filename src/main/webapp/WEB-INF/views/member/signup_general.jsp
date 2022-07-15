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
<title>Insert title here</title>
</head>
<style>

    /* 별표 */
    .cls-required {
        color: red;
    }

     /* 휴대전화 인풋창에 화살표 안나오게 */ 
    input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    /* 줄간격 설정 */
    .cls-inputRow {
        margin-bottom: 20px;
    }

    /* 버튼 간 간격 */
    #btn-cancel {
        margin-right: 20px;
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
                        <h1>Sign In</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr id="hr">
                    </div>
                </div>
            </div>
            <div class="bodyContent">

                <div class="row d-flex justify-content-center">
                    <div class="col-9">
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="name">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">이름(실명)</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="id">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">아이디</span>
                                </label>        
                            </div>
                            <div class="col-7">
                                <input type="text" class="form-control" id="id" name="id">
                            </div>
                            <div class="col-2">
                                <button type="button" class="btn btn-primary">중복확인</button>
                            </div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="pw">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">비밀번호</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="pw" name="pw">
                            </div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="pw2">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">비밀번호 확인</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="pw2">
                            </div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="nickname">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">닉네임</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="nickname" name="nickname">
                            </div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="phone">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">휴대전화 번호</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <div class="row">
                                    <div class="col-4">
                                        <select class="form-select" id="phone1">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                        </select>        
                                    </div>
                                    <div class="col-4">
                                        <input type="number" id="phone2" class="form-control" maxlength="4" oninput="maxLengthCheck(this)">
                                    </div>
                                    <div class="col-4">
                                        <input type="number" id="phone3" class="form-control" maxlength="4" oninput="maxLengthCheck(this)">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="email">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">이메일</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="email" name="email">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col d-flex justify-content-center">
                                <button class="btn btn-secondary" id="btn-cancel">취소</button>
                                <button class="btn btn-primary" id="btn-signup">회원가입</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="footer">
            여기는 풋터
        </div>    
    </div>
<script>

    /* input number타입에 maxvalue 설정하기 (휴대전화번호) */
    function maxLengthCheck(object){
        if (object.value.length > object.maxLength){
            object.value = object.value.slice(0, object.maxLength);
        }    
    }
</script>
</body>
</html>