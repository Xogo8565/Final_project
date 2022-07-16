<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</html>
