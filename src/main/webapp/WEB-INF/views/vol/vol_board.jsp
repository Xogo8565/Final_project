<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/07/08
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vol_board</title>
</head>
<body>
<div class="container">
    <div class="header">

    </div>
    <div class="content">
        <div class="content_header">
            <h4>봉사 게시판</h4>
            <label for="category"></label>
            <select name="category" id="category">
                <option value="제목">제목</option>
                <option value="내용">내용</option>
                <option value="작성자">작성자</option>
                <option value="지역">지역</option>
            </select>
            <button type="button" id="searchBtn"><img src="/resources/images/search.png"></button>
            <label for="search">
                <input type="text" id ="search">
            </label>
        </div>
        <div class="boardList">

        </div>
        <div class="content_footer">

        </div>
    </div>
    <div class="footer">

    </div>
</div>
</body>
</html>
