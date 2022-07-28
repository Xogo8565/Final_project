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
    <title>${loginSession.member_id}님의 - 비밀번호 변경</title>
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


/* 인풋창에 화살표 안나오게 */ 
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}


/* input 줄간격 */
.cls-inputRow {
    margin-bottom: 10px;
}

label{
    margin-right: 40px;
    width: 150px;
}
input{
    width: 250px;
}

button{
    width: 120px;
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
                        <h1>비밀번호 변경</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr id="hr">
                    </div>
                </div>
            </div>

            <div class="bodyContent">
                <div class="row cls-inputRow">
                    <div class="col d-flex justify-content-center">
                        <label for="pw">
                            <span class="cls-labelTitle">기존 비밀번호</span>
                        </label>
                        <input type="password" id="pw1" name="member_pw">
                    </div>
                </div>

                <div class="row cls-inputRow">
                    <div class="col d-flex justify-content-center">
                        <label for="pw">
                            <span class="cls-labelTitle">새로운 비밀번호</span>
                        </label>
                        <input type="password" id="pw2" name="member_pw">
                    </div>
                </div>

                <div class="row cls-inputRow">
                    <div class="col d-flex justify-content-center">
                        <label for="pw">
                            <span class="cls-labelTitle">새로운 비밀번호 확인</span>
                        </label>
                        <input type="password" id="pw3" name="member_pw">
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col d-flex justify-content-center">
                        <button type="button" class="btn btn-light" id="btnChangePw">비밀번호 변경</button>
                        <button type="button" class="btn btn-light" id="returnBtn">돌아가기</button>
                    </div>
                </div>


            </div>
        </div>

        <div class="footer">
            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
        </div>
    </div>
	<script>

        document.getElementById("returnBtn").addEventListener('click', function(){
            location.href = "javascript:history.back()";
        })
	
		// 비밀번호 변경 클릭 시
		$("#btnChangePw").on("click", function(){
			
			let regexPw = /^[a-zA-z0-9~!@#$]{6,12}$/;
			
			if(!regexPw.test($("#pw2").val())){
				alert("비밀번호는 영어 대소문자 숫자 특수문자(~!@#$)를 이용해서 6~12자 이내로 작성해 주세요.");
				return;
				
			}else if($("#pw2").val() !== $("#pw3").val()){
				alert("비밀번호와 비밀번호 확인창에 있는 값이 일치하지 않습니다.");
				return;
				
			}else {

				$.ajax({
					url : "/member/checkPw"
					, type : "post"
					, data : {member_pw : $("#pw1").val()}
					, success : function(data){
						console.log(data);
                        if(data !== 'success'){
                            alert('기존 비밀번호가 일치하지 않습니다.');
                            $("#pw1").val('');
                            return;
                        }else{
                            $.ajax({
                                url : "/member/modifyPw"
                                , type : "post"
                                , data : {member_pw : $("#pw2").val()}
                                , success : function(data){
                                    console.log(data);
                                    alert("변경이 완료되었습니다.");
                                    location.href = "javascript:history.back()";
                                }, error : function(e){
                                    console.log(e);
                                }
                            });
                        }
                            
					}, error : function(e){
						console.log(e);
					}
				});

			}
		});
		

    </script>

</body>
</html>