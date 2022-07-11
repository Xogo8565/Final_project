<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,600,1,0" />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>유기동물 현황</title>
</head>
<style>
    .header{
        height: 150px;
        background-color: rgb(207, 185, 136);
        color: rgb(207, 147, 111);
    }
    .apiLink{
        text-decoration: none;
        color: black;
    }
    .input-group{
        width: 20em;
    }
    #iconNote{
        margin-top: 10px;
        color: rgb(207, 147, 111);
    }
    #iconSearch{
        color: white;
        background-color: rgb(207, 185, 136);
        border:none;
    }
    #search{
        border:1px solid rgb(207, 185, 136);
    }
    #search:focus{
        color: black;
        outline: none !important;
        box-shadow: none;
        border:1px solid rgb(207, 185, 136);
    }
    #btnSearch{
        color: white;
        background-color: rgb(207, 185, 136);
    }
    .cardImg{
    	height: 300px;
    }
    .page-item > a{
        color: white;
        background-color: rgb(207, 185, 136);
    }
    .page-item > a:hover{
        color: rgb(207, 147, 111);
        background-color: rgb(231, 214, 176);
    }
    .page-item > a:focus{
        color: rgb(207, 147, 111);
        background-color: rgb(231, 214, 176);
        outline: none !important;
        box-shadow: none;
    }
</style>
<body>
    <div class="container">
        <div class="header"></div>
        <div class="row">
            <h4><span class="material-symbols-outlined" id="iconNote">speaker_notes</span>&nbsp;&nbsp;&nbsp;꼼의 유기동물 소식입니다</h4>
        </div>
        <div class="row justify-content-end mt-5">
            <div class="input-group mb-3">
                <span class="input-group-text material-symbols-outlined" id="iconSearch">search</span>
                <input type="text" id="search" name="search" class="form-control" placeholder="검색" aria-describedby="btnSearch">
                <button class="btn" type="button" id="btnSearch">검색</button>
            </div>
        </div>
        <%-- 목록 출력 --%>
        <div class="card-group justify-content-center">
        	<c:forEach items="${data.response.body.items.item}" var="item">
				<a class="apiLink d-flex" href="/shelterAnimal/toDetail?desertionNo=${item.desertionNo}">
					<div class="card col-3 m-2" style="width: 18rem;">
						<img src="${item.popfile}" class="cardImg">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">발견장소 :
								${item.orgNm}&nbsp;${item.happenPlace}</li>
							<li class="list-group-item">품종 : ${item.kindCd}</li>
							<li class="list-group-item">특징 : ${item.specialMark}</li>
							<li class="list-group-item">보호시작일 : ${item.happenDt}</li>
						</ul>
					</div>
				</a>
			</c:forEach>
		</div>
		
		<%-- 페이징
		<nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center mt-5">
              	<li class="page-item">
                	<a class="page-link" href="" aria-label="Previous">
                  	<span aria-hidden="true">&laquo;</span>
                	</a>
              	</li>
              	<c:forEach items="${data.response.body}" var="item">
              	<li class="page-item"><input type="text" class="pageNum d-none" name="pageNum" value="${data.response.body.pageNo}"><a class="page-link">1</a></li>
              	</c:forEach>
              	<li class="page-item">
                	<a class="page-link" href="" aria-label="Next">
                  		<span aria-hidden="true">&raquo;</span>
                	</a>
              	</li>
            </ul>
          </nav> --%>
          
		<%-- 페이징 --%>
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center mt-5">
              <c:if test="${curPageMap.needPrev eq true}">
              	<li class="page-item">
                	<a class="page-link" href="/shelterAnimal/toShelterAnimal?curPage=${curPageMap.startNavi-1}" aria-label="Previous">
                  	<span aria-hidden="true">&laquo;</span>
                	</a>
              	</li>
              </c:if>
              <c:forEach var="pageNum" begin="${curPageMap.startNavi}" end="${curPageMap.endNavi}" step="1">
              	<li class="page-item"><a class="page-link" href="/shelterAnimal/toShelterAnimal?curPage=${pageNum}">${pageNum}</a></li>
              	<%-- ajax페이징 <li class="page-item"><input class="pageAjax" type="button" value="${pageNum}"></li> --%>
              </c:forEach>
              <c:if test="${curPageMap.needNext eq true}">
              	<li class="page-item">
                	<a class="page-link" href="/shelterAnimal/toShelterAnimal?curPage=${curPageMap.endNavi+1}" aria-label="Next">
                  		<span aria-hidden="true">&raquo;</span>
                	</a>
              	</li>
              </c:if>
            </ul>
          </nav>
    
    </div>
    <script>
    	 /* $(".pageAjax").on("click", function(){ // ajax 페이징 상단부터 안나와서 보류
    		let pageNum = $(this).val();
    		$.ajax({
    			url: "/shelterAnimal/toAjax?curPage="+pageNum,
    			type: "get",
    			dataType: "Json",
    			success: function(data){
    				const dataList = (data.response.body.items.item);
    				console.log(dataList);
    				$(".card-group").empty();
    				for(let item of dataList){
    					
    					let a = $("<a class='apiLink d-flex' href=''>").attr("href", "/shelterAnimal/toDetail?desertionNo="+(item.desertionNo));
    					let div = $("<div class='card col-3 m-2' style='width: 18rem;'>");
    					let img = $("<img class='cardImg'>").attr("src", (item.popfile));
    					let ul = $("<ul class='list-group list-group-flush'>");
    					let li1 = $("<li class='list-group-item'>").html('발견장소 : '+(item.orgNm)+'&nbsp;'+(item.happenPlace));
    					let li2 = $("<li class='list-group-item'>").html('품종 : '+(item.kindCd));
    					let li3 = $("<li class='list-group-item'>").html('특징 : '+(item.specialMark));
    					let li4 = $("<li class='list-group-item'>").html('보호시작일 : '+(item.happenDt));
    					let input = $("<input type='text' name='desertionNo'>").addClass("d-none").attr("value",(item.desertionNo));
    					ul.append(li1, li2, li3, li4);
    					div.append(img, ul);
    					a.append(div);
    					a.appendTo(".card-group");
    				}
    				
    			},error: function(e){
    				console.log(e);
    			}
    		})
    	})*/
    </script>
</body>
</html>