<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Home</title>
  </head>
  <body>
  <button id ="supportBoard">s</button>
  <button id ="volBoard">b</button>
  <script>
    document.querySelector("#volBoard").addEventListener("click",()=>{
      location.href = "/volBoard/lists";
    });

    document.querySelector("#supportBoard").addEventListener("click",()=>{
      location.href = "/supportBoard/lists";
    })
  </script>
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
