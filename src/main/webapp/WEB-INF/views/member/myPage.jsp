<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>마이페이지</title>
<style>
h5 {
	padding: 5px;
}

.list {
	margin: 10px;
}

.list::after {
	display: block;
	content: '';
	width: 50%;
}


.reviewImg{
width:50%;
height:50%;
margin-top:5px;
}
.list-row{
height:70px;
border-top: 1px solid lightgray;
}
.list-row:last-child{
border-bottom: 1px solid lightgray;
}

.imgDiv{
padding-left:40px;
padding-right:0;
padding-top:0px;
height:100%;

}
.imgDiv>img{
height:85%;
width:65%;
}

.nameDiv{
padding-top:25px;
padding-left:0;
padding-right:0;


}
.titleDiv{
padding-top:25px;
}
.scoreDiv{
padding-top:25px;

}
.write_dateDiv{
padding-top:25px;

}
.bottom-line{
margin-bottom:20px;
}
.listTitle{
margin-bottom:20px;
}
.listTitle>.nameDivT{
text-align:center;

}
.listTitle>.titleDivT{
text-align:left;
padding-left:25px;
}
.scoreDivT{
text-align:70%;
margin-right:0px;
}
.listTitle>.write_dateDivT{

text-align:left;
padding-left:35px;
}


.titleDiv > a {
	margin: 10px;
	cursor: pointer;
	color: #000;
	text-decoration:none;
}
  

.titleDiv >a:visited { color: #000; }

.titleDiv >a::after {
	display: block;
	content: '';
	width: 50%;
}

#footer{
	margin-top: 20px;
}
/* 마이페이지누르면 나오는 이미지*/
#mypageImg {
 	width: 250px;
}
.mypageMain {
text-align: center;
font-size: x-large;
width: fit-content;
}

.mypageMain span{
    color: #e3854a;
}
/* 컨텐트 부분 */
#contentBox{
	margin-top : 30px;
	margin-bottom : 50px;
}
a{
    text-decoration: none;
    color: #000;
}
a:hover{
    color: #000;
    font-weight: bold;
}
/*왼쪽 사이드*/
.myPageSideNav{
    background-color: #cfb988c7;
    padding: 40px;
}
/*오른쪽 회색창*/
#content{
    background-color: #f6f6f6;

}
/*sm 사이즈 영역*/
/*sm 사이즈 상단바*/
.myPage-sm-nav{
    text-align: center;
    margin-top: 10px;
    padding: 10px;   
}
.myPage-sm-nav span{
    margin-right: 10px;
    cursor: pointer;
}
.myPage-sm-nav span:hover{
    font-weight: bold;
}

.myPageAccess{
   margin-top: 20%;
   margin-left: 15%;
}
/*sm사이즈 배경창, 사진*/
.contentBox-sm{
    width: 100vw;
    height: 300px;
    margin-top: 30px;
    background-color: #f6f6f6;
}
.contentBox-sm img{
    margin-left: 30px;
    width: 400px;
}
/*게시글을 눌렀을때 나오는 자유게시판|실종게시판*/
.myPageBoardSelect{
    background-color: #f6f6f6;
    margin-left: 20px;
    text-align: center;
}
.myPageBoardSelect span:hover{
    font-weight: bold;
}
.myPageBoardSelect span{
    cursor: pointer;
}

</style>
</head>
<body>
	<div class="container">
		<div class="row header">
		</div>
		<div class="row">
			<div class="col-12 d-md-none">
                <!--sm사이즈 상단바-->
				<div class="myPage-sm-nav">
                    <span id="board">게시글</span>
                    <span id="support">후원내역</span>
                   <span id="modifyAccount">정보수정</span>
                    <span id="deleteAccount">회원탈퇴</span>
                </div>
			</div>
			<!--sm사이즈 상단바 게시글 눌렀을때 나오는 목록-->
            <div class="row">
                <div class="col myPageBoardSelect d-none">
                    <span>자유 게시판 </span>|
                    <span>실종 게시판 </span>
                </div>
            </div>
			<!--sm사이즈 사진과 환영문구-->
            <div class="row p-0">
				<div class="col-12 d-md-none">
                    <div class="contentBox-sm">
                        <img src="/resources/images/myPageDefault.png">
                        <div class="col" style="margin: auto;">
                            <p class="mypageMain" style="margin-left: 100px;"><span>${dto.nickname}</span>님 안녕하세요</p>
                        </div>    
                    </div>
                </div>

            </div>
			<!--마이페이지 사이드메뉴-->
			<div class="row" id="contentBox">
				<div class="col d-none d-md-block col-md-3 myPageSideNav">
					<div class="row">
						<div class="col">
							<h5>게시글 조회</h5>
						</div>
						<div class="row">
							<div class="col">
								<span class="list"><a href="">자유 게시판</a></span>
							</div>
						</div>
                        <div class="row">
							<div class="col">
								<span class="list"><a href="">실종 게시판</a></span>
							</div>
						</div>
                        <div class="row">
							<div class="col">
								<span class="list"><a href="">후기 게시판</a></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col" style="margin-bottom: 10px;">
							<h5><a href="">후원조회</a></h5>
						</div>
					</div>
					<div class="row">
						<div class="col" style="margin-bottom: 10px;">
							<h5><a href="">봉사신청 조회</a></h5>
						</div>
					</div>
                    <div class="row">
						<div class="col" style="margin-bottom: 10px;">
							<h5><a href="">회원정보 수정</a></h5>
						</div>
					</div>
                    <div class="row">
						<div class="col" style="margin-bottom: 10px;">
							<h5><a href="">회원 탈퇴</a></h5>
						</div>
					</div>
				</div>
				<!--md 이상 사이즈 사진 환영문구-->
				<div class="col-12 col-md-9 d-none d-md-block" id="content">
                        <div class="row myPageAccess">
                            <div class="col-3"><img src="/resources/images/myPageDefault.png" id="mypageImg"></div>
                            <div class="col" style="margin: auto;"><p class="mypageMain">
                                <span>${dto.nickname}</span>님, 환영합니다.</p>	 </div>                                  	
                    </div>  
                  <div class="row">
                    <div class="col">
                        <img src="/resources/images/myPage-content.gif" style="width: 400px; margin-left: 65%;">
                    </div>
                  </div>             		
				</div>
			</div>
		</div>
	</div>
    <script>
		//sm사이즈에서 상단바 게시글을 클릭했을때
        $("#board").on("click",function(){
            $(".contentBox-sm").remove();
            $(".myPageBoardSelect").removeClass("d-none");
			//append필요

        })

		//sm사이즈에서 상단바 후원내역을 클릭했을때
		$("#support").on("click",function(){
			$(".contentBox-sm").remove();
			$(".myPageBoardSelect").addClass("d-none");
			//append필요
		})

		//sm사이즈에서 상단바 정보수정 눌렀을 때
		$("#modifyAccount").on("click",function(){
			$(".contentBox-sm").remove();
			//append필요
		})

		//sm사이즈에서 회원탈퇴를 눌렀을때
		$("#deleteAccount").on("click",function(){
			$(".contentBox-sm").remove();
			//append필요
		})
    </script>
</body>
</html>