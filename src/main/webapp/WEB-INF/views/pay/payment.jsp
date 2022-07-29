<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/07/18
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/frame/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        :root {
            --sil: #d5d5d5;
            --order: #d9d9d9;
            --grey: #313131;
            --sky: #3a84ca;
        }

        * {
            box-sizing: border-box;
        }


        .content {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: repeat(10, 1fr);
            gap: 30px;
            min-height: 1000px;
            margin-top: 50px;
            margin-bottom: 50px;
            padding-left: 90px;
            padding-right: 90px;
        }

        .content > div {
            border: 1px solid #000000;
        }

        .patronage_container {
            grid-area: 1/1/5/6;
            padding: 30px;
        }

        .patron_container {
            grid-area: 5/1/11/6;
            padding: 30px;
        }

        .payment_container {
            grid-area: 1/6/5/11;
            padding: 30px;
        }

        .img_container {
            grid-area: 5/6/11/11;
            padding: 30px;
        }

        .content_header {
            height: 50px;
            font-size: 1.3em;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
        }

        .patronage {
            display: flex;
            gap: 20px;
            height: 60%;
        }

        .patronage .patronageImg {
            flex-basis: 30%;
        }

        .patronage .patronageImg img {
            width: 100%;
            height: 100%;
        }

        .patronage .patronageInfo {
            flex-basis: 70%;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .patronage .patronageInfo span {
            flex-basis: 33%;
        }

        .patronageInfo > span:nth-child(2) {
            color: var(--sil);
            font-size: 0.8em;
        }

        .patron {
            display: flex;
            flex-direction: column;
            gap: 30px;
            height: 60%;
        }

        .patron > .input {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            flex-basis: 50%;
            align-items: center;
            justify-self: center;
        }

        .patron > .input > input {
            height: 30px;
        }

        .patron > .input > input:not(:last-child) {
            width: 45%;
        }

        .patron > .input > input:last-child {
            width: 91.5%;
        }

        .patron > .select {
            flex-basis: 50%;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .patron > .select > label:not(:first-child) {
            position: relative;
            left: 20px;
        }

        .payment {
            display: flex;
            flex-direction: column;
            height: 60%;
            gap: 20px;
        }

        .payment > div {
            display: flex;
            justify-content: space-between;
        }

        .payment > div:first-child {
            border-bottom: 1px solid black;
            font-size: 0.8em;
        }

        .payment > div:first-child > span:first-child {
            color: var(--sil);
        }

        .payment > div:last-child {
            margin-top: 10%;
            height: 40%;
        }

        .payment > div:last-child > button {
            width: 100%;
            background-color: var(--sky);
            border: none;
            color: #ffffff;
        }

        .img_container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .img_container img {
            width: 80%;
            height: auto;
        }

        @media screen and (max-width: 960px) {
            .patronage_container {
                grid-area : 1/1/4/10;
            }
            .patronage {
                flex-direction: column;
            }
            .patron_container {
                grid-area : 4/1/7/10;
            }
            .payment_container {
                grid-area : 7/1/9/10;
            }
            .img_container {
                display: none;
            }
            .content {
                min-height: 1500px;
            }
        }

    </style>
</head>
<link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
      crossorigin="anonymous">
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<body>

<div class="content">
    <div class="patronage_container">
        <div class="content_header">
            <span>후원 정보</span>
        </div>
        <div class="patronage">
            <div class="patronageImg">
                <c:if test="${not empty map.files_sys}">
                    <img src="/files/support/${map.files_sys}" alt="">
                </c:if>
                <c:if test="${empty map.files_sys}">
                    <img src="/resources/images/No_image.png" alt="">
                </c:if>
            </div>
            <div class="patronageInfo">
                <span><c:out value="${map.board_title}"/></span>
                <span><fmt:formatNumber type="number" value="${order_number}" maxFractionDigits="3"/> 개</span>
                <span><fmt:formatNumber type="number" value="${price*order_number}" maxFractionDigits="3"/> 원</span>
            </div>
        </div>
    </div>
    <div class="patron_container">
        <div class="content_header">
            <span>후원자 정보</span>
        </div>
        <div class="patron">
            <div class="input">
                <input type="text" name="name" id="name" value="${loginSession.member_name}" readonly>
                <input type="tel" name="tel" id="tel" value="${loginSession.member_phone}" readonly>
                <input type="email" name="email" id="email" value="${loginSession.member_email}" readonly>
            </div>
            <div class="select">
                <label for="selectAll">
                    <input type="checkbox" id="selectAll"><span data-toggle="modal" data-target="#myPerInfoModal">전체 동의</span>
                </label>
                <label for="select1">
                    <input type="checkbox" id="select1"><span data-toggle="modal" data-target="#myPerInfoModal">개인정보처리방침</span>
                </label>
                <label for="select2">
                    <input type="checkbox" id="select2"><span>구매 조건 확인 및 결제 진행 동의</span>
                </label>
            </div>
        </div>
    </div>
    <div class="payment_container">
        <div class="content_header">
            <span>주문 요약</span>
        </div>
        <div class="payment">
            <div class="orderedList">
                <span>금액</span>
                <span><fmt:formatNumber type="number" value="${price}" maxFractionDigits="3"/> 원</span>
            </div>
            <div class="total">
                <span>총 금액</span>
                <span><fmt:formatNumber type="number" value="${order_number*price}" maxFractionDigits="3"/> 원</span>
            </div>
            <div class="button">
                <button type="button" id='pay'>신청(후원)하기</button>
            </div>
        </div>
    </div>
    <div class="img_container">
        <img src="/resources/images/animals.jpeg" alt="">
    </div>
</div>
<div class="modal" id="myPerInfoModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal header -->
            <div class="modal-header">
                <h4 class="modal-title">개인정보처리방침</h4>
                <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                <button type="button" class="btn-close" data-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                Comme(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.
                <br><br>
                제1조 (개인정보의 처리목적)<br>
                회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
                <br><br>
                1. 홈페이지 회원 가입 및 관리
                회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다.
                <br><br>
                2. 재화 또는 서비스 제공
                물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심 등을 목적으로 개인정보를 처리합니다.
                <br><br>
                3. 고충처리
                민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.
                <br><br>
                제2조 (개인정보의 처리 및 보유기간)<br>
                ① 회사는 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
                ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
                <br><br>
                1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지
                다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지
                1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지
                2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지
                <br><br>
                2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지
                다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지
                1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록
                - 표시․광고에 관한 기록 : 6월
                - 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년
                - 소비자 불만 또는 분쟁처리에 관한 기록 : 3년
                2) 「통신비밀보호법」제41조에 따른 통신사실확인자료 보관
                - 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년
                - 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월
                <br><br>
                제3조(정보주체의 권리․의무 및 행사방법)<br>
                ① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
                1. 개인정보 열람요구
                2. 오류 등이 있을 경우 정정 요구
                3. 삭제요구
                4. 처리정지 요구
                ② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.
                ③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
                ④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
                ⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다.
                <br><br>
                제4조(처리하는 개인정보 항목)<br>
                회사는 다음의 개인정보 항목을 처리하고 있습니다.
                <br><br>
                1. 홈페이지 회원 가입 및 관리
                필수항목 : <예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소, 아이핀번호, 암호화된 이용자 확인값(CI)>
                선택항목 : <예) 결혼여부, 관심분야>
                <br><br>
                2. 재화 또는 서비스 제공
                필수항목 : <예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 아이핀번호, 신용카드번호, 은행계좌정보, 암호화된 이용자 확인값(CI) 등 결제정보>
                선택항목 : <관심분야, 과거 구매내역>
                <br><br>
                3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.
                IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등
                <br><br>
                제5조(개인정보의 파기)<br>
                ① 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
                ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
                ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
                1. 파기절차
                회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
                2. 파기방법
                회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.
            </div>
        </div>
    </div>
</div>

<script>
    const selectAll = document.querySelector("#selectAll");
    const select = document.querySelectorAll(".select input[type=checkbox]");

    selectAll.addEventListener("click", function () {
        if (this.checked) {
            select.forEach((e) => {
                e.checked = true;
            });
        }

        else select.forEach((e) => {
            e.checked = false;
        });
    });

    select.forEach(
        e => {
            e.addEventListener("click", function () {
                const selected = document.querySelectorAll(".select input[type=checkbox]:checked");
                selectAll.checked = select.length === selected.length;
            })
        }
    )

    document.querySelector("#pay").addEventListener("click", () => {
        const selected = document.querySelectorAll(".select input[type=checkbox]:checked");
        if (selected.length < 2) {
            alert("개인정보처리방침 혹은 구매 조건 확인 및 결제 진행에 동의해주세요")
            return
        }
        requestPay();
    });

    function requestPay() {
        let IMP = window.IMP; // <- 생략해도 무방함.
        IMP.init("imp39790426");

        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "INIpayTest",
            pay_method: "card",
            name: "${map.board_title}",
            amount: ${order_number*price},
            buyer_email: document.querySelector("#email").value,
            buyer_name: document.querySelector("#name").value,
            buyer_tel: document.querySelector("#tel").value,
            buyer_addr: null,
            buyer_postcode: null
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp.amount);
                $.ajax({
                    url: "/pay/insert",
                    method: 'post',
                    data: {
                        seq_board: "${map.seq_board}",
                        pay_money: "${order_number*price}"
                    },
                    success: function (data) {
                        location.href = "/pay/result?seq_pay=" + data;
                    },
                    error: function (e) {
                        console.log(e)
                    }
                })
            } else {
                alert("결제에 실패하셨습니다");
            }
        });
    }


</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
