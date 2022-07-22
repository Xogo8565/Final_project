<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8" %>
        <jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>


<html>
<head>
    <title>Error</title>
</head>
<style>
    :root {
        --sil: #d5d5d5;
        --bro: #CFB988;
    }
    .content {
        display: flex;
        align-items: center;
        gap: 30px;
        margin-top: 40px;
    }

    .imgContainer {
        flex-basis: 40%;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid var(--sil);
        padding: 20px;
    }

    .imgContainer img {
        width: 80%;
        height: auto;
    }

    .explain {
        flex-basis: 60%;
        display: flex;
        flex-direction: column;
        gap: 30px;
    }

    .explain span:first-child {
        font-size: 1.4em;
        font-weight: bolder;
    }

    .button {
        display: flex;
        gap: 20px;
    }

    #referer {
        background-color: var(--bro);
        border: none;
        color: white;
        border-radius: 5px;
    }

    #home {
        background-color: var(--sil);
        border: none;
        color: white;
        border-radius: 5px;
    }
</style>
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
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<body>
<div class="content">
    <div class="imgContainer">
        <img src="/resources/images/sad_cat.jpeg" alt="">
    </div>
    <div class="explain">
        <span>에러가 발생했습니다.</span>
        <span>요청하신 페이지를 처리하던 도중 예기치 못한 문제가 발생했습니다. 사용에 불편을 드려 대단히 죄송합니다.</span>
        <div class="button">
            <button id ="referer">이전 페이지로</button>
            <button id ="home">홈으로</button>
        </div>
    </div>
</div>
<script>
    document.querySelector("#home").addEventListener("click", ()=>{
        location.href = "/"
    })

    document.querySelector("#referer").addEventListener("click", ()=>{
        history.go(-1);
    })
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>


