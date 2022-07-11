<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home</title>
  </head>
  <body>
  <button id ="volBoard">b</button>
  <script>
    document.querySelector("#volBoard").addEventListener("click",()=>{
      location.href = "/volBoard/lists";
    })
  </script>
  </body>
</html>
