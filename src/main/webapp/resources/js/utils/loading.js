// 로딩 중 이미지 가져오기
    	function loadingSpinner(imageName) {    
    		LoadingWithMask('/resources/images/'+imageName+'.gif');    
    		setTimeout("closeLoadingWithMask()", 60000);
    		} 
    		
    	function LoadingWithMask(gif) {
    		//화면의 높이와 너비를 구합니다.    
    		let maskHeight = $(document).height();    
    		let maskWidth  = window.document.body.clientWidth;        
    		 //화면에 출력할 마스크를 설정해줍니다.    
    		let mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color: #e9e9e9; display:none; left:0; top:0;'></div>";    
    		let loadingImg = "<img src='"+ gif +"' id='loadingImg' style='position: absolute; display: block; top: 200px;'/>";     
    		//화면에 레이어 추가    
    		$('body').append(mask);  
    		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.    
    		$('#mask').css({            
    			'width' : maskWidth,            
    			'height': maskHeight,            
    			'opacity' : '0.3',
    			'display': 'flex',
    		    'justify-content' : 'center'
    			});       
    		//마스크 표시    
    		$('#mask').show();      
    		//로딩중 이미지 표시    
    		$('#mask').append(loadingImg);    
    		$('#loadingImg').show();
    		} 
    		
    	function closeLoadingWithMask() {    
    		$('#mask, #loadingImg').hide();    
    		$('#mask, #loadingImg').empty();  
    		}