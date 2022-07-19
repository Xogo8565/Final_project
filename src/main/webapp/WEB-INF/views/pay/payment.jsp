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

        .container {
            width: 100%;
            min-height: 1000px;
            height: 1px;
        }

        .header {
            height: 10%;
        }

        .footer {
            height: 10%;
        }

        .content {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: repeat(10, 1fr);
            gap: 30px;
            height: 65%;
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
            height: 60%;
        }

        .payment > div:last-child > button {
            width: 100%;
            background-color: var(--sky);
            border: none;
            color: #ffffff;
        }


    </style>
</head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
<div class="container">
    <div class="header">HEADER</div>
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
                        <input type="checkbox" id="selectAll"><span>전체 동의</span>
                    </label>
                    <label for="select1">
                        <input type="checkbox" id="select1"><span>개인정보처리방침</span>
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

        </div>
    </div>


    <div class="footer">FOOTER</div>
</div>
<script>
    const selectAll = document.querySelector("#selectAll");
    const select = document.querySelectorAll(".select input[type=checkbox]");

    selectAll.addEventListener("click", function () {
        if (this.checked) select.forEach((e) => {
            e.checked = true;
        });
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
        if(selected.length<2){
            alert("개인정보처리방침 혹은 구매 조건 확인 및 결제 진행에 동의해주세요")
            return
        } requestPay();
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
            if(rsp.success){
                console.log(rsp.amount);
                $.ajax({
                    url : "/pay/insert",
                    method : 'post',
                    data : {
                        seq_board : "${map.seq_board}",
                        pay_money : "${order_number*price}"
                    },
                    success : function (data) {
                        location.href = "/pay/result?seq_pay="+data;
                    },
                    error : function (e) {
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