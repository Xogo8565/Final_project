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

/* input 줄간격 */
.cls-inputRow {
    margin-bottom: 10px;
}

/* input 옆 버튼 */
.cls-inputBtn {
    width: 100%;
}

#btnChangePw,
#returnBtn2{
	width: 116px;
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
                                    <input type="text" class="form-control cls-input" id="email" name="member_email" placeholder="이메일을 입력하세요">
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-warning cls-inputBtn" id="submit">전송</button>
                                    <div class="spinner-border d-none" id="spinner" role="status"></div>
                                </div>
                            </div>
                            <div class="row cls-inputRow">
                                <div class="col-9">
                                    <input type="number" class="form-control cls-input" id="proof" placeholder="인증번호를 입력하세요" readonly>
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-warning cls-inputBtn" id="proofOk" disabled>확인</button>
                                </div>
                            </div>

														<div class="row buttonRow">
																<div class="col d-flex justify-content-center">
																		<button type="button" class="btn btn-light" id="returnBtn">돌아가기</button>
																</div>
														</div>
                            <div class="row">
                            	<div class="col d-none">
                            		<input type="text" id="proofNum">
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>

				<div class="row newPw d-none">
				
					<div class="row cls-inputRow">
						<div class="col-4 align-self-center">
							<label for="pw">
								<span class="cls-labelTitle">새로운 비밀번호</span>
							</label>
						</div>
                        <div class="col-8">
                            <input type="password" class="form-control" id="pw" name="member_pw">
                        </div>
					</div>
					<div class="row cls-inputRow">
						<div class="col-4 align-self-center">
							<label for="pw2">
								<span class="cls-labelTitle">새로운 비밀번호 확인</span>
							</label>
						</div>
                        <div class="col-8">
                            <input type="password" class="form-control" id="pw2">
                        </div>
					</div>
					<div class="row buttonRow">
	                    <div class="col d-flex justify-content-center">
	                        <button type="button" class="btn btn-light" id="btnChangePw">비밀번호 변경</button>
													<button type="button" class="btn btn-light" id="returnBtn2">돌아가기</button>
	                    </div>
	                </div>
				</div>


            </div>
        </div>

        <div class="footer">
            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
        </div>
    </div>
	<script>
	
		// 전송버튼 클릭 시 
		$("#submit").on("click", function(){
			let email = $("#email").val()
			
			// 이메일 유효성검사
			let regexEmail = /^[a-zA-z0-9][\w]+@[a-zA-z]+\.(com|net|co\.kr|or\.kr)$/;
			if(!regexEmail.test($("#email").val())){
				alert("이메일 형식에 맞게 입력해주세요.");
				return;
			}
			
			new Promise((succ, fail)=>{ // 첫번째로 실행될 ajax
				
				// 해당 이메일이 member table에 존재하는지 검사
				$.ajax({
					url : "/member/existEmail"
					, type : "post"
					, data : {email : email}
					, success : function(data) {
						console.log(data);
						if(data === "nope"){
							alert("회원가입 되지 않은 이메일입니다.");
							return;
						}else{
							succ(data);
						}
					}, error : function(e) {
						console.log(e);
						fail(e);
					}
				});
				
			}).then((arg)=>{ // 첫번째 ajax가 성공이라면 실행될 두번째 ajax
				
				// 스피너 보이게
				$("#spinner").removeClass("d-none");
				$("#submit").addClass("d-none");
				
				// 인증번호 이메일 전송
				$.ajax({
					url : "/member/mailCheck"
					, type : "post"
					, data : {email : email}
					, success : function(data) {
						console.log(data);
						if(data != null) {
							$("#proofNum").val(data);
							$("#proof").attr("readonly", false);
							$("#proofOk").attr("disabled", false);
							$("#spinner").addClass("d-none");
							$("#submit").removeClass("d-none");

							alert("인증메일이 전송되었습니다.");
						} else {
							alert("인증메일 전송에 실패했습니다. 관리자에게 문의하세요.");
						}
						
					}, error : function(e) {
						console.log(e);
					}
				});
				
			});

		});
		
		// 확인버튼 클릭 시
		$("#proofOk").on("click", function(){
			let proof = $("#proof").val();
			let data = $("#proofNum").val();
			
			if(proof == "") {
				alert("인증번호를 입력해주세요.");
				return;
			}
			
			if(proof === data) {
				$("#email").attr("readonly", true);
				$("#submit").attr("disabled", true);
				$("#proof").attr("readonly", true);
				$("#proofOk").attr("disabled", true);
				
				$(".newPw").removeClass("d-none");
				$("#returnBtn").addClass(" d-none");
				
				alert("인증이 완료되었습니다. 새로운 비밀번호를 설정해주세요.");
			} else {
				alert("인증번호가 일치하지 않습니다.");
				return;
			}
			
		});
		
		// 비밀번호 변경 클릭 시
		$("#btnChangePw").on("click", function(){
			
			let regexPw = /^[a-zA-z0-9~!@#$]{6,12}$/;
			
			if(!regexPw.test($("#pw").val())){
				alert("비밀번호는 영어 대소문자 숫자 특수문자(~!@#$)를 이용해서 6~12자 이내로 작성해 주세요.");
				return;
				
			}else if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호와 비밀번호 확인창에 있는 값이 일치하지 않습니다.");
				return;
				
			}else {
				
				$.ajax({
					url : "/member/changePw"
					, type : "post"
					, data : {member_pw : $("#pw").val(), member_email : $("#email").val()}
					, success : function(data){
						console.log(data);
						location.href = "/member/toLoginPage";
						alert("변경이 완료되었습니다.");
					}, error : function(e){
						console.log(e);
					}
				});
				
			}
			
		});

		document.addEventListener('click', function(e){
				if(e.target.id == "returnBtn" || e.target.id == "returnBtn2"){
					location.href = "javascript:history.back()";
				}

			})
		

    </script>

</body>
</html>