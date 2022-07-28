<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <title>${loginSession.member_id}님의 마이페이지 - Comme</title>
        </head>
        <style>
            #profileTap {
                list-style: none;
                font-size: 15px;
                padding: 0;
            }

            #profileTap li{
                text-align: center;
                float: left;
                border: 1px solid lightgray;
            }

            #profileTap li a{
                color: black;
                display: inline-block;
                padding: 7px 7px 7px 7px;
                min-width: 70px;
                text-decoration: none;
            }

            #profileTap li a:hover{
                background-color: rgb(98, 188, 240);
                color: white;
                text-decoration: none;
            }

            #profileInfo{
                font-size: 15px;
            }
            #profileBox{
                font-size: 13px;
            }

            th.col-2.profileTap{
                background-color: #f9f9f9;
            }

            #modifyBtn,
            #updatePwBtn,
            #deleteBtn{
                float: right;
                color: black;
                border: 1px solid lightgray;
                background-color: white;
                border-radius: 2px;
                padding: 5px;
                font-size: 13px;
            }

            #modifyBtn,
            #updatePwBtn{
                margin-right: 10px;
            }

            #profileBox,
            #tapBox,
            #btnBox{
                margin: 0 12vw 0 12vw;
            }

        </style>

        <body>
            <div>
                
                <jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>

                <div class="row mt-5" id="tapBox">
                    <div class="col">
                        <ul id="profileTap">
                            <li><a href="/member/toMyPage">회원정보</a></li>
                            <c:choose>
                               <c:when test="${loginSession.member_grade eq 2}">
                                    <li><a href="/member/toShelterVolList">봉사 신청 관리</a></li>
                                    <li><a href="/member/toMyBoard">내 글</a></li>
                                    <li><a href="/member/toMyComment">내 댓글</a></li>
                                    <li><a href="/member/toMySupport">후원 글 조회</a></li>
                                    <li><a href="/member/toMyPay">후원 내역 조회</a></li>
                               </c:when>
                               <c:when test="${loginSession.member_grade eq 4}">
                                    <li><a href="/manager/memberList?curPage=1">전체 회원 목록</a></li>
                                    <li><a href="/manager/toBlackList?curPage=1">블랙리스트 관리</a></li>
                                    <li><a href="/manager/toInquiryList?seq_category=${inquiry.seq_category}">문의/신고</a></li>
                                    <li><a href="/manager/toCategoryCM">카테고리 관리</a></li>
                                    <li><a href="/member/toMyBoard">내 글</a></li>
                                    <li><a href="/member/toMyComment">내 댓글</a></li>
                                    <li><a href="/manager/toAllPay">사용자 후원 내역 조회</a></li>
                               </c:when>
                               
                               <c:otherwise>
                                    <li><a href="/member/toCheckVol">봉사 신청 확인</a></li>
                                    <li><a href="/member/toMyBoard">내 글</a></li>
                                    <li><a href="/member/toMyComment">내 댓글</a></li>
                                    <li><a href="/member/toMyPayList">후원 내역 조회</a></li>
                               </c:otherwise>
                            </c:choose>
                            <li><a href="#" id="return">돌아가기</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row mt-3" id="profileBox">
                    <div class="col">
                        <h3>
                            <span id="profileInfo"><i class="fa-solid fa-address-card"></i>  회원 정보 보기</span>
                        </h3>

                        <table class="table">
                            <thead style="border-top: 1px solid lightgray;">
                                <tr>
                                    <th scope="col" class="col" colspan="2" style="text-align: center;">기본 정보</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th class="col-2 profileTap">아이디</th>
                                    <td class="col-10">${loginSession.member_id}</td>
                                </tr>
                                <tr>
                                    <th class="col-2 profileTap">닉네임</th>
                                    <td class="col-10">${loginSession.member_nickname}</td>
                                </tr>
                                <c:choose>
                                   <c:when test="${loginSession.member_grade eq '2'}">
                                        <tr>
                                            <th class="col-2 profileTap">대표자</th>
                                            <td class="col-10">${loginSession.member_name}</td>
                                        </tr>
                                   </c:when>
                                   <c:otherwise>
                                        <tr>
                                            <th class="col-2 profileTap">이름</th>
                                            <td class="col-10">${loginSession.member_name}</td>
                                        </tr>
                                   </c:otherwise>
                                </c:choose>
                                <tr>
                                    <th class="col-2 profileTap">메일주소</th>
                                    <td class="col-10">${loginSession.member_email}</td>
                                </tr>
                                <tr>
                                    <th class="col-2 profileTap">전화번호</th>
                                    <td class="col-10">${loginSession.member_phone}</td>
                                </tr>
                                <c:if test="${loginSession.member_grade eq 4}" >
                                <tr>
                                    <th class="col-2 profileTap">직급</th>
                                    <td class="col-10">매니저</td>
                                </tr>
                                </c:if>
                                
                                <c:if test="${loginSession.member_grade eq '2'}" >
                                    <tr>
                                        <th class="col-2 profileTap">사업자번호</th>
                                        <c:choose>
                                        <c:when test="${loginSession.member_brn eq null}">
                                            <td class="col-10">등록되어 있는 사업자 번호가 없습니다.</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="col-10">${loginSession.member_brn}</td>
                                        </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row mb-5" id="btnBox">
                    <div class="col">
                        <button type="button" id="deleteBtn">탈퇴</button>
                        <button type="button" id="updatePwBtn">비밀번호 변경</button>
                        <button type="button" id="modifyBtn">회원 정보 수정</button>
                    </div>
                </div>


                	<!-- footer -->
	            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>

            </div>

        </body>
        <script>
            document.getElementById('deleteBtn').addEventListener('click', function(){
                let check = confirm('사이트를 탈퇴하시겠습니까?');
                if(check){
                    alert('그동안 사이트를 이용해 주셔서 감사합니다.');
                    location.href = "/member/deleteMember";
                }
            })

            document.getElementById('updatePwBtn').addEventListener('click', function(){
                location.href = "/member/toModifyPw";
            })

            document.getElementById('modifyBtn').addEventListener('click', function(){
                location.href = "/member/toModifyMember";
            })

            if (!sessionStorage.getItem('referrer')){
                sessionStorage.setItem("referrer", document.referrer);
            }

            document.getElementById('return').addEventListener('click', () =>{
                const referrer = sessionStorage.getItem('referrer');
                sessionStorage.removeItem("referrer"); 
                location.href = referrer || '/';
            })
        </script>

        </html>