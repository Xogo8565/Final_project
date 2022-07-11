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
    <title>유기동물 상세페이지</title>
    <style>
    .header{
        height: 150px;
        background-color: rgb(207, 185, 136);
        color: rgb(207, 147, 111);
    }
    #detailImg{
    	margin: 10px;
    }
    
    .list-group .title{
        width: 10em;
    }
    .list-group .content{
        width: 30em;
    }
    
    </style>
</head>
<body>
    <div class="container">
        <div class="header"></div>
        ${data}
        <div class="col d-flex justify-content-center">
            <img class="img-fluid rounded" src="${data.POPFILE}" id="detailImg">
        </div> 
        <div class="contentContainer">
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">보호시작일</li>
                    <li class="list-group-item content">${data.happenDt}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">품종</li>
                    <li class="list-group-item content">${data.kindCd}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">발견장소</li>
                    <li class="list-group-item content">${data.orgNm}&nbsp;${data.happenPlace}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">특징</li>
                    <li class="list-group-item content">${data.colorCd}&nbsp;${data.specialMark}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">보호소명</li>
                    <li class="list-group-item content">${data.careNm}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">연락처</li>
                    <li class="list-group-item content">${data.careTel}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">보호장소</li>
                    <li class="list-group-item content">${data.careAddr}</li>
                </ul>
            </div>
            <div class="col d-flex justify-content-center">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item title">상태</li>
                    <li class="list-group-item content">${data.processState}</li>
                </ul>
            </div>
        </div>
        <div class="col text-center mt-5" id="comment">
            <h3>[해당 유기동물에 관한 모든 문의는 해당 보호소로 부탁드립니다.]</h3>
        </div>
        <div class="col d-flex justify-content-center mt-5" id="btnSpace">
            <button type="button" class="btn btn-secondary" id="back">뒤로가기</button>
        </div>

    </div>
    <script>
    	document.getElementById("back").onclick = function(){
    		location.href = "/shelterAnimal/toShelterAnimal";
    	}
    </script>
</body>
</html>