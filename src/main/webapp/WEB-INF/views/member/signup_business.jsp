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
<title>기관 회원가입</title>
</head>
<style>

	/* 바디부분 패딩 */
	.body {
		padding-left: 10%;
		padding-right: 10%;
		padding-top: 5%;
		padding-bottom: 5%;
	}

    /* 별표 */
    .cls-required {
        color: red;
    }

     /* 휴대전화 인풋창에 화살표 안나오게 */ 
    input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    /* 줄간격 설정 */
    .bodyContent .cls-inputRow {
        margin-top: 20px;
        margin-botton: 5px;
    }

    /* 버튼 간 간격 */
    #btn-cancel {
        margin-right: 20px;
    }
    
    /* 버튼로우 */
    .bodyContent .cls-btnRow {
    	margin-top: 30px;
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
                        <h1>Sign In</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr id="hr">
                    </div>
                </div>
            </div>
            <form id="signupForm" action="/member/signupBusiness" method="post">
            <div class="bodyContent">

                <div class="row d-flex justify-content-center">
                    <div class="col-9">
                    
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="name">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">대표자명</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="name" name="member_name">
                            </div>
                        </div>
                        <div class="row clsCheckInfo"> <!-- 입력안내문뜨는칸 -->
                        	<div class="col-3"></div>
                        	<div class="col-9"><span id="checkName"></span></div>
                        </div>
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="name">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">사업자 등록번호</span>
                                </label>
                            </div>
                            <div class="col-9">
                                <input type="text" class="form-control" id="business" name="member_brn">
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
                                <input type="text" class="form-control" id="id" name="member_id">
                            </div>
                            <div class="col-2">
                                <button type="button" class="btn btn-secondary" id="idCheckBtn">중복확인</button>
                            </div>
                        </div>
                        <div class="row clsCheckInfo"> <!-- 입력안내문뜨는칸 -->
                        	<div class="col-3"></div>
                        	<div class="col-9"><span id="checkId"></span></div>
                        </div>

                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="pw">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">비밀번호</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="password" class="form-control" id="pw" name="member_pw">
                            </div>
                        </div>
                        <div class="row clsCheckInfo"> <!-- 입력안내문뜨는칸 -->
                        	<div class="col-3"></div>
                        	<div class="col-9"><span id="checkPw"></span></div>
                        </div>

                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="pw2">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">비밀번호 확인</span>
                                </label>        
                            </div>
                            <div class="col-9">
                                <input type="password" class="form-control" id="pw2">
                            </div>
                        </div>
                        
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="nickname">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">닉네임</span>
                                </label>        
                            </div>
                            <div class="col-7">
                                <input type="text" class="form-control" id="nickname" name="member_nickname">
                            </div>
                            <div class="col-2">
                                <button type="button" id="nicknameCheck" class="btn btn-secondary">중복확인</button>
                            </div>
                        </div>
                        <div class="row clsCheckInfo"> <!-- 입력안내문뜨는칸 -->
                        	<div class="col-3"></div>
                        	<div class="col-9"><span id="checkNickname"></span></div>
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
                                            <option value="070">070</option>
                                            <option value="02">02</option>
                                            <option value="031">031</option>
                                            <option value="032">032</option>
                                            <option value="033">033</option>
                                            <option value="041">041</option>
                                            <option value="042">042</option>
                                            <option value="043">043</option>
                                            <option value="044">044</option>
                                            <option value="051">051</option>
                                            <option value="052">052</option>
                                            <option value="053">053</option>
                                            <option value="054">054</option>
                                            <option value="055">055</option>
                                            <option value="061">061</option>
                                            <option value="062">062</option>
                                            <option value="063">063</option>
                                            <option value="064">064</option>
                                        </select>        
                                    </div>
                                    <div class="col-4">
                                        <input type="number" id="phone2" class="form-control" maxlength="4" oninput="maxLengthCheck(this)">
                                    </div>
                                    <div class="col-4">
                                        <input type="number" id="phone3" class="form-control" maxlength="4" oninput="maxLengthCheck(this)">
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col d-none">
                                		<input type="text" id="phone" name="member_phone"> <!-- 폰번호 합쳐주는곳 -->
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
                            <div class="col-7">
                                <input type="text" class="form-control" id="email" name="member_email">
                            </div>
                            <div class="col-2">
                                <button type="button" id="emailCheckBtn" class="btn btn-secondary">중복확인</button>
                            </div>
                        </div>
                        <div class="row clsCheckInfo"> <!-- 입력안내문뜨는칸 -->
                        	<div class="col-3"></div>
                        	<div class="col-9"><span id="checkEmail"></span></div>
                        </div>

						<!-- 
                        <div class="row cls-inputRow">
                            <div class="col-3 align-self-center">
                                <label for="license">
                                    <span class="cls-required">*</span>
                                    <span class="cls-labelTitle">사업자등록번호</span>
                                </label>        
                            </div>
                            <div class="col-7">
                                <input type="text" class="form-control" id="license" name="member_brn">
                            </div>
                            <div class="col-2">
                                <button type="button" class="btn btn-primary">조회</button>
                            </div>
                        </div>
                        <div class="row clsCheckInfo">
                        	<div class="col-3"></div>
                        	<div class="col-9"><span id="checkLicense"></span></div>
                        </div>
						-->

                        <div class="row cls-btnRow">
                            <div class="col d-flex justify-content-center">
                                <!-- <button class="btn btn-secondary" id="btn-cancel">취소</button> -->
                                <button type="button" class="btn btn-warning" id="btn-signup">회원가입</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            
        </div>
    
        <div class="footer">
            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
        </div>    
    </div>
<script>

    /* input number타입에 maxvalue 설정하기 (휴대전화번호) */
    function maxLengthCheck(object){
        if (object.value.length > object.maxLength){
            object.value = object.value.slice(0, object.maxLength);
        }    
    }
    
    
	// 이름 조건 밑에 뜨게
	$("#name").focus(function(){
		$("#checkName").html("한글 및 영문으로 2~6자 이내로 작성해주세요.");
		$("#checkName").css("color", "green");
	});
	$("#name").blur(function(){
		$("#checkName").html("");
	});
	
	
	// 아이디 조건 밑에 뜨게
	$("#id").focus(function(){
		if($("#checkId").html() !== "사용가능한 아이디입니다."){
			$("#checkId").html("소문자와 숫자로 5~12자 이내로 작성해주세요.");
    		$("#checkId").css("color", "green");
    		$("#id").blur(function(){
	    		$("#checkId").html("");
	    	});
		}
	});


	// 아이디 중복 검사
	$("#idCheckBtn").on("click", function(){
		// 아이디 유효성 검사
		let regexId = /^[a-z0-9]{5,12}$/;
		if(!regexId.test($("#id").val())){
			$("#checkId").html("형식에 맞지않는 아이디입니다. 다시 입력해주세요.");
			$("#checkId").css("color", "red");
			$("#id").val("");
			return;
		}
		// ajax로 중복값 검사
		$.ajax({
			url: "/member/idCheck"
			, type: "post"
			, data: {id: $("#id").val()}
			, dataType: "text"
			, success: function(data){
				console.log(data);
				if(data === "nope"){
					$("#checkId").html("이미 사용중인 아이디입니다.");
					$("#checkId").css("color", "red");
					$("#id").val("");
				}else if(data === "ok"){
					$("#checkId").html("사용가능한 아이디입니다.");
					$("#checkId").css("color", "green");
				}
			}
			, error: function(e){
				console.log(e);
			}
		})
	});
	
	
	// 이메일 중복 검사
	
		$("#emailCheckBtn").on("click", function(){
		// 이메일 유효성 검사
		let regexEmail = /^[a-zA-z0-9][\w]+@[a-zA-z]+\.(com|net|co\.kr|or\.kr)$/;
		
		if(!regexEmail.test($("#email").val())){
			$("#checkEmail").html("형식에 맞지않는 이메일입니다. 다시 입력해주세요.");
			$("#checkEmail").css("color", "red");
			$("#email").val("");
			return;
		}
		// ajax로 중복값 검사
		$.ajax({
			url: "/member/emailCheck"
			, type: "post"
			, data: {email: $("#email").val()}
			, dataType: "text"
			, success: function(data){
				console.log(data);
				if(data === "nope"){
					$("#checkEmail").html("이미 사용중인 이메일입니다.");
					$("#checkEmail").css("color", "red");
					$("#email").val("");
				}else if(data === "ok"){
					$("#checkEmail").html("사용가능한 이메일입니다.");
					$("#checkEmail").css("color", "green");
				}
			}
			, error: function(e){
				console.log(e);
			}
		})
	});
	
	
	// 닉네임 조건 밑에 뜨게
	$("#nickname").focus(function(){
		if($("#checkNickname").html() !== "사용가능한 닉네임입니다."){
			$("#checkNickname").html("한글 및 숫자, 영문으로 2~8자 이내로 작성해주세요.");
    		$("#checkNickname").css("color", "green");
    		$("#nickname").blur(function(){
	    		$("#checkNickname").html("");
	    	});
		}
	});

    // 닉네임 중복 검사
    $("#nicknameCheck").on("click", function(){
        // 닉네임 유효성 검사
        let regexNickname = /^[a-zA-z0-9ㄱ-흫]{2,8}$/;
        
        if(!regexNickname.test($("#nickname").val())){
            $("#checkNickname").html("형식에 맞지않는 닉네임입니다. 다시 입력해주세요.");
            $("#checkNickname").css("color", "red");
            $("#nickname").val("");
            return;
        }
        // ajax로 중복값 검사
        $.ajax({
            url: "/member/nicknameCheck"
            , type: "post"
            , data: {nickname: $("#nickname").val()}
            , dataType: "text"
            , success: function(data){
                console.log(data);
                if(data === "nope"){
                    $("#checkNickname").html("이미 사용중인 닉네임입니다.");
                    $("#checkNickname").css("color", "red");
                    $("#nickname").val("");
                }else if(data === "ok"){
                    $("#checkNickname").html("사용가능한 닉네임입니다.");
                    $("#checkNickname").css("color", "green");
                }
            }
            , error: function(e){
                console.log(e);
            }
        })
	});
	
	
	// 비밀번호 조건 밑에 뜨게
	$("#pw").focus(function(){
		$("#checkPw").html("대소문자, 숫자, 특수문자(~!@#$)를 이용해서 6~12자 이내로 작성해 주세요.");
		$("#checkPw").css("color", "green");
		
	});
	$("#pw").blur(function(){
		$("#checkPw").html("");
	});
	
	
	

	// 취소 버튼을 눌렀을때
	$("#btn-cancel").on("click", function(){
		location.href="/member/toSignupPage";
	});
	
	// 회원가입 버튼을 눌렀을때
	$("#btn-signup").on("click", function(){
		let regexName = /[a-zA-Z가-힣]{2,6}$/;
		let regexId = /^[a-z0-9]{5,12}$/;
		let regexNickname = /^[a-zA-z0-9ㄱ-흫]{2,8}$/;
		let regexPw = /^[a-zA-z0-9~!@#$]{6,12}$/;
		let regexEmail = /^[a-zA-z0-9][\w]+@[a-zA-z]+\.(com|net|co\.kr|or\.kr)$/;
		let regexPhone = /^[0-9-]{13}$/;

        //사업자 등록번호 검사
        // bizID는 숫자만 10자리로 해서 문자열로 넘긴다.
        let regexBrn = /\s/g;
        let checkID = [1, 3, 7, 1, 3, 7, 1, 3, 5, 1];
        let tmpBizID, i, chkSum=0, c2, remander;
        let bizID = document.querySelector("#business").value;
        bizID = bizID.replace(/-/gi,'');

        for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i);
        c2 = "0" + (checkID[8] * bizID.charAt(8));
        c2 = c2.substring(c2.length - 2, c2.length);
        chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
        remander = (10 - (chkSum % 10)) % 10 ;
		
		// phone번호 합쳐주는 작업
		// select박스에서 선택된 값을 가져오는 방법
		//console.log($("#phone1 option:selected").val());
		let phone = $("#phone1 option:selected").val() + '-' + $("#phone2").val() + '-' + $("#phone3").val();
		$("#phone").val(phone);
		
		if($("#name").val() === ""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}else if(!regexName.test($("#name").val())){
			alert("이름은 한글 및 영문으로 2~10자 이내로 작성해주세요.");
			$("#name").focus();
			return;
		} else if (Math.floor(bizID.charAt(9)) !== remander || isNaN(bizID) || bizID.match(regexBrn) || bizID.length < 10){
            alert("사업자 번호가 유효하지 않습니다");
            $("#business").focus();
            return;
        }
        else if(!regexId.test($("#id").val())){
			alert("아이디는 영어소문자와 숫자로 5~12자 이내로 작성해주세요.");
			$("#id").focus();
			return;
		}else if($("#checkId").html() !== "사용가능한 아이디입니다."){
			alert("아이디 중복확인을 해주세요.");
			$("#id").focus();
			return;
		}else if($("#checkEmail").html() !== "사용가능한 이메일입니다."){
			alert("이메일 중복확인을 해주세요.");
			$("#email").focus();
			return;
		}else if(!regexNickname.test($("#nickname").val())){
			alert("닉네임은 영어대소문자 또는 한글 또는 숫자를 이용해서 2 ~ 8자 이내로 작성해 주세요.");
			$("#nickname").focus();
			return;
		}else if($("#checkNickname").html() !== "사용가능한 닉네임입니다."){
			alert("닉네임 중복확인을 해주세요.");
			$("#nickname").focus();
			return;
		}else if(!regexPw.test($("#pw").val())){
			alert("비밀번호는 영어 대소문자 숫자 특수문자(~!@#$)를 이용해서 6~12자 이내로 작성해 주세요.");
			$("#pw").focus();
			return;
		}else if($("#pw").val() !== $("#pw2").val()){
			alert("비밀번호와 비밀번호 확인창에 있는 값이 일치하지 않습니다.");
			return;
		}else if(!regexPhone.test(phone)){ // 숫자 데이터에 대한 별도의 형변환이 필요없음
			alert("휴대폰번호는 각각 4자리의 숫자로 입력해주세요.");
			return;
		}else if(!regexEmail.test($("#email").val())){
			alert("이메일 형식에 맞게 입력해주세요.");
			$("#email").focus();
			return;
		}
		
        let brn1 = bizID.substr(0,3);
        let brn2 = bizID.substr(3,2);
        let brn3 = bizID.substr(5);
            
        document.querySelector("#business").value = brn1 + '-' + brn2 + '-' + brn3;
        
		$("#signupForm").submit();
		alert("회원가입이 완료되었습니다.");
	});

</script>
</body>
</html>