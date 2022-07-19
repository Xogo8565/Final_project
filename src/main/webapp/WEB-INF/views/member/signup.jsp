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
<title>회원가입</title>
</head>
<style>
    .textarea {
        width: 100%;
        height: 200px;
        resize: none;
        margin-bottom: 50px;
    }
    .textarea:focus {
        outline: none;
    }
    a {
        color: black;
        text-decoration: none;
    }
    a:hover {
        opacity: 0.8;
        color: black;
    }
    .bodyContent {
        margin-top: 30px;
    }
    .signupIcons {
        margin-top: 50px;
    }

    /* 약관명 */
    .cls-termsTitle {
        font-size: 20px;
    }

    /* 뒤로가기 */
    .toBack {
        margin-top: 50px;
    }

    /* 회원가입 그림 */
    .signupIconsPic {
        margin-bottom: 20px;
    }
</style>
<body>
    <div class="container">
        <div class="header">
            여기는 헤더
        </div>
    
        <div class="body">
            <div class="bodyTitle">
                <div class="row d-flex justify-content-center">
                    <div class="col  d-flex justify-content-center">
                        <h2>회원가입</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr>
                    </div>
                </div>
            </div>
            <div class="bodyContent">
                <div class="row">
                    <div class="col">
                        <p class="cls-termsTitle">이용약관</p>
                        <hr>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-11">
                        <textarea class="textarea" readonly>
                            제19조(회원의 ID 및 비밀번호에 대한 의무)
	    
	      ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
	    
	      ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
	    
	      ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.
	    
	    제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.
	    
	        1. 신청 또는 변경시 허위 내용의 등록
	        2. 타인의 정보 도용
	        3. “몰”에 게시된 정보의 변경
	        4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
	        5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
	        6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
	        7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
	    
	    제21조(연결“몰”과 피연결“몰” 간의 관계)
	    
	      ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.
	    
	      ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
	    
	    제22조(저작권의 귀속 및 이용제한)
	    
	      ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
	    
	      ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
	    
	      ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
	    
	    제23조(분쟁해결)
	    
	      ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
	    
	      ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
	    
	      ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
	    
	    제24조(재판권 및 준거법)
	    
	      ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
	    
	      ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
                        </textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p class="cls-termsTitle">개인정보 수집 및 이용 약관</p>
                        <hr>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-11">
                        <textarea class="textarea" readonly>
                            제19조(회원의 ID 및 비밀번호에 대한 의무)
	    
	      ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
	    
	      ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
	    
	      ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.
	    
	    제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.
	    
	        1. 신청 또는 변경시 허위 내용의 등록
	        2. 타인의 정보 도용
	        3. “몰”에 게시된 정보의 변경
	        4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
	        5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
	        6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
	        7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
	    
	    제21조(연결“몰”과 피연결“몰” 간의 관계)
	    
	      ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.
	    
	      ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
	    
	    제22조(저작권의 귀속 및 이용제한)
	    
	      ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
	    
	      ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
	    
	      ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
	    
	    제23조(분쟁해결)
	    
	      ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
	    
	      ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
	    
	      ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
	    
	    제24조(재판권 및 준거법)
	    
	      ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
	    
	      ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
                        </textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="checkbox" id="checkAll">
                        <label for="checkAll">&nbsp;전체 동의</label>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="checkbox" id="checkUse" class="cls-checkbox">
                        <label for="checkUse">&nbsp;이용약관 동의</label>
                    </div>
                    <div class="col">
                        <input type="checkbox" id="checkPerinfo" class="cls-checkbox">
                        <label for="checkPerinfo">&nbsp;개인정보 수집 및 이용 동의</label>
                    </div>
                </div>

                <div class="signupIcons">
                    <div class="row">
                        <div class="col d-flex justify-content-center">
                            <a href="javascript:toGeneralSignup()">
                                <div class="row">
                                    <img class="signupIconsPic" src="/resources/images/member/general_signup.png" style="width : 200px;">
                                </div>
                                <div class="row d-flex justify-content-center">
                                    일반회원
                                </div>
                            </a>
                        </div>
                        <div class="col d-flex justify-content-center">
                            <a href="javascript:toBusinessSignup()">
                                <div class="row">
                                    <img class="signupIconsPic" src="/resources/images/member/business_signup.png" style="width: 200px;">
                                </div>
                                <div class="row d-flex justify-content-center">
                                    기관회원
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="row toBack">
                    <div class="col d-flex justify-content-center">
                        <button type="button" class="btn btn-primary">뒤로가기</button>
                    </div>
                </div>


            </div>
        </div>
    
        <div class="footer">
            여기는 풋터
        </div>    
    </div>

<script>

    /* 전체체크 */
    $(document).ready(function(){
        $("#checkAll").click(function(){
            if ($("#checkAll").is(":checked")) {
                $(".cls-checkbox").prop("checked", true);
            } else {
                $(".cls-checkbox").prop("checked", false);
            }
        });

        $(".cls-checkbox").click(function(){
            let total = $(".cls-checkbox").length;
            let checked = $(".cls-checkbox:checked").length;

            if(total != checked) {
                $("#checkAll").prop("checked", false);
            } else {
                $("#checkAll").prop("checked", true);
            }
        });
    });
    
    
    /* 기관회원가입으로 이동 */
    function toBusinessSignup(){
    	if($("#checkAll").is(":checked")) {
    		location.href = "/member/toSignup_business";
    	} else {
    		alert("약관에 모두 동의해주세요.");
    		return;
    	}
    }
    
    
    /* 일반회원가입으로 이동 */
    function toGeneralSignup(){
    	if($("#checkAll").is(":checked")) {
    		location.href = "/member/toSingup_general";
    	} else {
    		alert("약관에 모두 동의해주세요.");
    		return;
    	}
    }




</script>
</body>
</html>