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
    <title>아이디 찾기</title>
</head>
<style>

	/* 바디부분 패딩 */
	.body {
		padding-left: 10%;
		padding-right: 10%;
		padding-top: 5%;
		padding-bottom: 5%;
	}

/* 타이틀 수평선 hr */
#hr {
    margin: 16px;
}

/* 줄간격 여백주기 */
.bodyContent > .rowInput {
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


/* 찾기 너비 */
.cls-findBox {
    width: 400px;
    margin-bottom: 25px;
}

/* 휴대전화 인풋창에 화살표 안나오게 */ 
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}

/* 라벨링 */
.cls-label {
    margin-bottom: 10px;
}

/* 아이디찾기버튼 */
.buttonRow {
    margin-top: 20px;
    margin-bottom: 50px;
}

#btnFindId {
    width: 200px;
}

/* 결과창 */
.cls-resultTitleRow {
	margin-top: 60px;
}

.cls-resultIdRow {
	margin-bottom: 50px;
}

#btnFindId,
#returnBtn{
    width: 200px;
    margin-right: 10px;
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
                        <h1>아이디 찾기</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr id="hr">
                    </div>
                </div>
            </div>

            <div class="bodyContent">

                <div class="row rowInput">
                    <div class="col d-flex justify-content-center">
                        <div class="cls-findBox">
                            <div class="row cls-label">
                                <div class="col">
                                    <input type="radio" id="findToEmail" name="findOption" value="findToEmail" checked>
                                    <label for="findToEmail">&nbsp;가입한 이메일로 찾기</label>    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row rowInput">
                    <div class="col d-flex justify-content-center">
                        <div class="cls-findBox">
                            <div class="row cls-label">
                                <div class="col">
                                    <input type="radio" id="findToPhone" value="findToPhone" name="findOption">
                                    <label for="findToPhone">&nbsp;가입한 휴대전화로 찾기</label>    
                                </div>
                            </div>
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
                                	<input type="text" id="phone" name="phone"> <!-- 폰번호 합쳐주는곳 -->
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="row buttonRow">
                    <div class="col d-flex justify-content-center">
                        <button type="button" class="btn btn-light" id="btnFindId">아이디 찾기</button>
                        <button type="button" class="btn btn-light" id="returnBtn">돌아가기</button>
                    </div>
                </div>
                
                <div class="row cls-resultTitleRow">
                	<div class="col d-flex justify-content-center">
                		<h4 id="clsResultTitle"></h4>
                	</div>
                </div>
                <div class="row cls-resultIdRow">
                	<div class="col d-flex justify-content-center">
                		<span id="clsResultId"></span>
                	</div>
                </div>

            </div>
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
        
        
        // 아이디찾기 버튼 눌렀을 때
        $("#btnFindId").on("click", function(){
        	
    		// phone번호 합쳐주는 작업
    		// select박스에서 선택된 값을 가져오는 방법
    		//console.log($("#phone1 option:selected").val());
    		let phone = $("#phone1 option:selected").val() + '-' + $("#phone2").val() + '-' + $("#phone3").val();
    		// console.log(phone);
    		$("#phone").val(phone);
			
    		// 라디오 인풋 값 가져오기
    		let radio = $("input[name='findOption']:checked").val();
    		console.log(radio);
    		
    		if(radio == 'findToEmail') { // 이메일로 찾기
    			
    			// 이메일 유효성검사
    			let regexEmail = /^[a-zA-z0-9][\w]+@[a-zA-z]+\.(com|net|co\.kr|or\.kr)$/;
    			if(!regexEmail.test($("#email").val())){
    				alert("이메일 형식에 맞게 입력해주세요.");
    				return;
    			}
				
    			$.ajax({
    				url : "/member/findToEmail"
    				, type : "post"
    				, data : {member_email : $("#email").val()}
    				, success : function(data) {
    					console.log(data);
    					$("#clsResultTitle").html("회원님의 아이디");
    					$("#clsResultId").html(data);

    				}, error : function(e) {
    					console.log(e);
    				}
    			});
    			
    		} else if (radio == 'findToPhone') { // 전화번호로 찾기
    			
    			// 전화번호 유효성검사
    			let regexPhone = /^[0-9-]{13}$/;
    			if(!regexPhone.test($("#phone").val())){
    				alert("휴대폰번호는 각각 4자리의 숫자로 입력해주세요.");
    				return;
    			}
    			
    			$.ajax({
    				url : "/member/findToPhone"
    				, type : "post"
    				, data : {member_phone : $("#phone").val()}
    				, success : function(data) {
    					console.log(data);
    					$("#clsResultTitle").html("회원님의 아이디");
    					$("#clsResultId").html(data);
    				}, error : function(e) {
    					$("#clsResultTitle").html("아이디가 존재하지 않습니다.");
    				}
    			});

    			
    		}
    		
		});
        
        document.getElementById('returnBtn').addEventListener('click', function(){
            location.href = document.referrer;
        })
        
        
    </script>    

</body>
</html>