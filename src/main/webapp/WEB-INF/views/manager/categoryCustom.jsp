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
            <title>카테고리 관리 - Comme</title>
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
            #profileBox,
            #mainCategory{
                font-size: 13px;
            }

            .category_delete, 
            .category_modify,
            .selectCategory,
            .registerBtn,
            .subCategory_modify,
            .subCategory_delete, 
            .subRegisterBtn,
            #comment_close{
                font-size: 13px;
                text-decoration: none;
                color: #555;
                background-color: white;
                border-style: none;
            }

            .category_delete:hover, 
            .category_modify:hover, 
            #comment_close:hover,
            .registerBtn:hover,
            .subCategory_modify:hover,
            .subCategory_delete:hover,
            .subRegisterBtn:hover,
            .selectCategory:hover{
                text-decoration: underline;
            }

            .fa-pen, 
            .fa-eraser, 
            .fa-arrow-pointer{
                color: rgb(41, 184, 250);
            }
                
            #addCategory,
            #addSubCategory,
            #subCategory,
            #mainCategory{
                position: relative;
                top: 0;
                color: black;
                border: 1px solid lightgray;
                background-color: white;
                border-radius: 2px;
                font-size: 13px;
            }

            .inputBox{
                display: inline-block; 
                height: 28px;
                margin-top: 5px;
            }

            .categoryName,
            .subCategoryName{
                border-style: none;
                color: black;
            }

            #mainCategoryBox{
                text-align: center;
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
                            <li><a href="/manager/memberList?curPage=1">전체 회원 목록</a></li>
                            <li><a href="/manager/toBlackList?curPage=1">블랙리스트 관리</a></li>
                            <li><a href="/manager/toInquiryList?seq_category=${inquiry.seq_category}">문의/신고</a></li>
                            <li><a href="/manager/toCategoryCM">카테고리 관리</a></li>
                            <li><a href="/member/toMyBoard">내 글</a></li>
                            <li><a href="/member/toMyComment">내 댓글</a></li>
                            <li><a href="/manager/toAllPay">사용자 후원 내역 조회</a></li>
                            <li><a href="#" id="return">돌아가기</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row mt-3" id="profileBox">
                    <h3>
                        <span id="profileInfo"><i class="fa-solid fa-list"></i>  &nbsp;카테고리 관리</span>
                    </h3>
                    <div class="col-6">
                        <table class="table">
                            <thead style="border-top: 1px solid lightgray;">
                                <tr>
                                    <th scope="col" class="col" colspan="2" style="text-align: center;">상위 카테고리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${mainCategory}" var="dto">
                                    <tr>
                                        <th class="col-6"><input type="text" class="categoryName" value="${dto.category_name}" disabled></th>
                                        <td class="col-6">
                                            <button type="button" class="selectCategory" value="${dto.seq_category}"><i class="fa-solid fa-arrow-pointer"></i>  선택</button>
                                            <button type="button" class="category_modify" value="${dto.seq_category}"><i class="fa-solid fa-pen"></i>  수정</button>
                                            <button type="button" class="registerBtn d-none" value="${dto.seq_category}"><i class="fa-solid fa-pen"></i>  완료</button>
                                            <button type="button" class="category_delete" value="${dto.seq_category}"><i class="fa-solid fa-eraser"></i> 삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr id="mainCategoryBox">
                                    <td colspan="2">
                                        <span class="inputBox">
                                            <form action="/manager/addMainCategory" method="get">
                                                <input type="text" id="mainCategory" name="category_name" placeholder="카테고리명을 입력해주세요." required>
                                                <button type="submit" id="addCategory">추가</button>
                                            </form>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-6">
                        <table class="table">
                            <thead style="border-top: 1px solid lightgray;">
                                <tr>
                                    <th scope="col" class="col" colspan="2" style="text-align: center;">하위 카테고리</th>
                                </tr>
                            </thead>
                            <tbody id="subCategoryBox">
                                <tr>
                                    <td class="col-12" style="text-align: center;">상위 카테고리를 선택해주세요.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                	<!-- footer -->
	            <jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>

            </div>

        </body>

        <script>
            function enterkey() {
                if (window.event.keyCode == 13) {
                    addSubCategory();
                }
            }

            function addSubCategory(e){
                $.ajax({
                    url: '/manager/addSubCategory',
                    type: "get",
                    data: {category_name: document.getElementById('subCategory').value, category_pk: document.getElementById('category_pk').value},
                    success: function (data) {
                        console.log(data);

                        let tr = $('<tr>');
                        let th = $('<th>').attr('class', 'col-6');
                        let input = $('<input>').attr({
                            type: 'text',
                            class: 'subCategoryName',
                            disabled: true,
                            value: document.getElementById('subCategory').value
                        })

                        let td = $('<td>').attr('class', 'col-6')
                        
                        let button1 = $('<button>').attr({
                            class: "subCategory_modify",
                            type: "button",
                            value: data
                        })
                        let button2 = $('<button>').attr({
                            class: "subCategory_delete",
                            type: "button",
                            value: data
                        })
                        let button3 = $('<button>').attr({
                            class: "subRegisterBtn d-none",
                            type: "button",
                            value: data
                        })
                        let i1 = $('<i>').attr('class', 'fa-solid fa-pen');
                        let i3 = $('<i>').attr('class', 'fa-solid fa-pen');
                        let i2 = $('<i>').attr('class', 'fa-solid fa-eraser');
                        button1.append(i1, ' 수정&nbsp;');
                        button2.append(i2, ' 삭제');
                        button3.append(i3, ' 완료&nbsp;');
                        th.append(input);
                        td.append(button1, button3 ,button2);
                        tr.append(th, td);
                        $('#subCategory').closest('tr').before(tr);

                        document.getElementById('subCategory').value = '';
                    },
                    error: function (e) {
                        console.log(e);
                    }
                })
            }


            document.addEventListener('click', function(e){
                if(e.target.className == 'selectCategory'){
                    $.ajax({
                        url: '/manager/selectCategory',
                        type: "get",
                        data: {seq_category: e.target.value},
                        success: function (data) {
                            document.getElementById('subCategoryBox').replaceChildren();
                            if(data.length == 0){
                                let tr1 = $('<tr>');
                                let td = $('<td>').attr({
                                    class: 'col-12',
                                    style: 'text-align: center'
                                }).append('하위 카테고리 요소가 없습니다.');

                                tr1.append(td);
                                tr1.appendTo('#subCategoryBox');
                                
                            }else{
                                for(let dto of data){
                                    let tr = $('<tr>');
                                    let th = $('<th>').attr('class', 'col-6');
                                    let input = $('<input>').attr({
                                        type: 'text',
                                        class: 'subCategoryName',
                                        disabled: true,
                                        value: dto.category_name
                                    })

                                    let td = $('<td>').attr('class', 'col-6')
                                    
                                    let button1 = $('<button>').attr({
                                        class: "subCategory_modify",
                                        type: "button",
                                        value: dto.seq_category
                                    })
                                    let button2 = $('<button>').attr({
                                        class: "subCategory_delete",
                                        type: "button",
                                        value: dto.seq_category
                                    })
                                    let button3 = $('<button>').attr({
                                        class: "subRegisterBtn d-none",
                                        type: "button",
                                        value: dto.seq_category
                                    })
                                    let i1 = $('<i>').attr('class', 'fa-solid fa-pen');
                                    let i3 = $('<i>').attr('class', 'fa-solid fa-pen');
                                    let i2 = $('<i>').attr('class', 'fa-solid fa-eraser');
                                    button1.append(i1, ' 수정&nbsp;');
                                    button2.append(i2, ' 삭제');
                                    button3.append(i3, ' 완료&nbsp;');
                                    th.append(input);
                                    td.append(button1, button3 ,button2);
                                    tr.append(th, td);
                                    tr.appendTo('#subCategoryBox');
                                }
                            }
                            let tr2 = $('<tr>').attr('style', 'text-align: center');
                            let td2 = $('<td>').attr('colspan' , '2');
                            let span = $('<span>').attr('class', 'inputBox');
                            let form = $('<form>').attr({
                                action: '/manager/addSubCategory',
                                method: 'get'
                            })
                            let input = $('<input>').attr({
                                type: 'text',
                                id: 'subCategory',
                                name: 'category_name',
                                placeholder: '카테고리명을 입력해주세요.',
                            })
                            let input2 = $('<input>').attr({
                                type: 'hidden',
                                id: 'category_pk',
                                name: 'category_pk',
                                value: e.target.value
                            })
                            let button = $('<button>').attr({
                                type: 'button',
                                id: 'addSubCategory'
                            }).append('추가')
                            span.append(input, input2,'&nbsp;' ,button);
                            td2.append(span);
                            tr2.append(td2);
                            tr2.appendTo('#subCategoryBox');

                        },
                        error: function (e) {
                            console.log(e);
                        }
                    })
                }else if(e.target.className === 'category_delete'){
                    let check = confirm('해당 카테고리를 삭제하시겠습니까?');
                    if(check){
                        location.href = '/manager/deleteMainCategory?seq_category=' + e.target.value;
                    }
                }else if(e.target.className === 'category_modify'){
                    let input = e.target.closest('tr').querySelector('input');
                    input.disabled = false;
                    input.focus();

                    e.target.className += ' d-none';
                    let registerBtn = e.target.closest('tr').querySelector('.registerBtn');
                    registerBtn.className = 'registerBtn';
                }else if(e.target.className === 'registerBtn'){
                    let input = e.target.closest('tr').querySelector('input');
                    location.href = '/manager/mofidyMainCategory?seq_category=' + e.target.value + '&category_name=' + input.value;
                }else if(e.target.className === 'subCategory'){

                }else if(e.target.id === 'addSubCategory'){
                    if(!document.getElementById('subCategory').value){
                        alert('내용을 입력해주세요.');
                        return;
                    }
                    addSubCategory(e);
                }else if(e.target.className === 'subCategory_delete'){
                    let check = confirm('해당 카테고리를 삭제하시겠습니까?');
                    if(check){
                        $.ajax({
                            url: '/manager/deleteSubCategory',
                            type: "get",
                            data: {seq_category: e.target.value},
                            success: function (data) {
                                e.target.closest('tr').remove();
                            },
                            error: function (e) {
                                console.log(e);
                            }
                        })
                    }
                }else if(e.target.className === 'subCategory_modify'){
                    let input = e.target.closest('tr').querySelector('input');
                    input.disabled = false;
                    input.focus();

                    e.target.className += ' d-none';
                    let subRegisterBtn = e.target.closest('tr').querySelector('.subRegisterBtn');
                    subRegisterBtn.className = 'subRegisterBtn';
                }else if(e.target.className === 'subRegisterBtn'){
                    let input = e.target.closest('tr').querySelector('input');
                    $.ajax({
                        url: '/manager/mofidySubCategory',
                        type: "get",
                        data: {seq_category: e.target.value, category_name: input.value},
                        success: function (data) {
                            input.disabled = true;
                            e.target.className += ' d-none';
                            let subCategory_modify = e.target.closest('tr').querySelector('.subCategory_modify');
                            subCategory_modify.className = 'subCategory_modify';                            
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    })
                }
                
            })

            document.addEventListener('keyup', function(e){
                if(e.target.id === 'subCategory' && e.keyCode === 13){
                    if(!document.getElementById('subCategory').value && e.keyCode === 13){
                        alert('내용을 입력해주세요.');
                        return;
                    }
                    addSubCategory(e);
                }
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