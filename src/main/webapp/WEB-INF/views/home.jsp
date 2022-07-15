<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Home</title>
  </head>
  <body>

  <button type="button" id="board">board</button>
  <button type="button" id="boardWrite">boardWrite</button>

  </body>
  <script>
    document.getElementById('board').addEventListener('click', function(){
      location.href = "/board/toBoard";
    })

    document.getElementById('boardWrite').addEventListener('click', function(){
      location.href = "/board/toWrite";
    })
  </script>
</html>
