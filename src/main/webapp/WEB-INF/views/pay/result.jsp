<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            min-height: 500px;
            margin-top: 50px;
            margin-bottom: 50px;
            padding-left: 90px;
            padding-right: 90px;
        }

        .payment_header {
            border-bottom: 1px solid black;
            font-size: 1.5em;
        }

        .payment {
            display: flex;
            gap: 30px;
            height: 80%;
            margin-top: 50px;
        }

        .payment > div {
            flex-basis: 50%;
        }

        .payment > div:first-child {
            padding-left: 5%;
            height: 100%;
        }

        .payment_result_header {
            border-bottom: 1px solid var(--sil);
            margin-bottom: 40px;
            font-size: 1.5em;
        }

        .payment_no, .patron_info {
            display: flex;
            gap: 30px;
            margin-bottom: 40px;
        }

        .payment_no > div:first-child, .patron_info > div:first-child {
            flex-basis: 40%;
        }

        .payment_no > div:last-child, .patron_info > div:last-child {
            flex-basis: 60%
        }

        .patron_info > div:last-child {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .patronage_container {
            border: 1px solid var(--sil);
            height: 100%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-self: center;
            gap: 20px;
        }

        .patronage_container > .logo_img {
            flex-basis: 40%;
            border-bottom: 1px solid black;
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .patronage_container > .logo_img img {
            width: 80%;
            height: auto;
        }

        .patronage_container > .patronage {
            flex-basis: 40%;
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .patronage_container > .buttonDiv {
            flex-basis: 10%;
        }

        .patronage .patronage_img {
            flex-basis: 30%;
        }

        .patronage .patronage_img img {
            width: 100%;
            height: auto;
        }

        .patronage .patronage_info {
            flex-basis: 70%;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .buttonDiv {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .buttonDiv button {
            background-color: var(--grey);
            color: #ffffff;
            border: none;
            height: 100%;
            width: 50%;
        }




    </style>
</head>
<link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
      crossorigin="anonymous">
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"/>
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<body>

<div class="content">
    <div class="payment_header">
        주문 / 결제
    </div>
    <div class="payment">
        <div class="payment_result">
            <div class="payment_result_header">
                결제가 정상적으로 완료되었습니다.
            </div>
            <div class="payment_no">
                <div>
                    <span>결제번호</span>
                </div>
                <div>
                    <span><c:out value="${map.seq_pay}"/></span>
                </div>
            </div>
            <div class="patron_info">
                <div>
                    <span>후원자 정보</span>
                </div>
                <div>
                    <span><c:out value="${map.member_name}"/> </span><span><c:out
                        value="${map.member_phone}"/></span><span><c:out value="${map.member_email}"/></span>
                </div>
            </div>
        </div>
        <div class="patronage_container">
            <div class="logo_img">
                <img src="/resources/images/animals.jpeg" alt="">
            </div>
            <div class="patronage">
                <div class="patronage_img">
                    <c:if test="${not empty map.files_sys}">
                        <img src="/files/support/${map.files_sys}" alt="">
                    </c:if>
                    <c:if test="${empty map.files_sys}">
                        <img src="/resources/images/No_image.png" alt="">
                    </c:if>
                </div>
                <div class="patronage_info">
                    <span><c:out value="${map.writer_nickname}"/></span>
                    <span><c:out value="${map.board_title}"/></span>
                    <span><fmt:formatNumber type="number" value="${map.pay_money}" maxFractionDigits="3"/> 원</span>
                </div>
            </div>
            <div class="buttonDiv">
                <button type="button" id="home">홈으로</button>
            </div>
        </div>

    </div>
</div>

<script>
    document.querySelector("#home").addEventListener("click",()=>{
        location.href = "/";
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
