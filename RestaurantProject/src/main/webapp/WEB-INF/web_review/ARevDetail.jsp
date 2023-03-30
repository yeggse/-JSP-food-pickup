<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="css/boardDetail.css">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<title>bumDetail 페이지</title>
</head>
<style>
  	      input {
            width: 400px;
            margin-top: 0px;
	        padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
         }   
	       #btn{
		       background-color: #8FBC94;
		       width: 120px;
		       height: 40px;
		       border-radius: 10px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       color: white;
		       padding: 0px;
		       margin-top:10px;
		       margin-bottom:10px;
		       margin-right:10px;
	       }
</style>
<body>
	<div id="app" style="margin-bottom : 100px;">
		<div class="container">
			<h2>리뷰 상세 보기🔎 </h2>
			<div class="card">
				<h2 class="card-header p-4">
					업체명 : {{info.resname}}     
					<span  style="font-size: large; float: right; ">업체 번호 : {{info.resnum}}</span>
					<span  style="font-size: large; float: right;margin-right:40px;">카테고리 : {{info.categori}}</span>
					<span  style="font-size: large; float: right;margin-right:40px;"> 리뷰번호 : {{info.reviewnum}}</span>
				</h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;"> 제목 : {{info.title}}
				</div>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;"> 리뷰 작성일 : {{info.writedate}}
					<span style="font-size: large; float: right;"> 작성자 : {{info.nickname}}</span></h4>
				</div>				
				<div class="card-body1">
				<div v-if="info.img != null" style="margin: 10px 10px 10px 10px;">	<!-- info.img : 이미지 경로(img/이미지 이름) DB 컬럼이랑 동일한 이름으로!-->
				   		<img :src="info.img"/>	<!-- src앞에 콜론: 을 붙이면 변수로 지정가능 -->
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			   </div>
			   	<div v-if="info.answer=='N'">
			 		<div class="card" style="margin-bottom:0px; margin-top:40px;">
			 			<h2 class="card-header" style=" font-size:large; font-weight:600; text-align: center;"> 사장님께서 작성한 댓글이 없습니다😥</h2>
			 		</div>
			 	</div>
				<div v-else>
			 	<div class="card" style="margin-bottom:0px; margin-top:40px;">
			 	<h2 class="card-header" style=" font-size:large; font-weight:600; text-align: center;"> 사장님께서 작성하신 댓글입니다😊	 </h2>
				</div>
					<div class = "card-body1" style="margin-top:0px; width: -webkit-fill-available; height: 200px;">{{info.comments}}</div>
				</div>
				
				
			
			<div>
		 		<button @click="fnList" id="btn" style="float: right; margin-bottom: 200px;">목록으로</button> 
				<button @click="fnCheck" id="btn" style="float: right; margin-bottom: 200px;">리뷰 삭제</button>
			</div>
		
	</div>
	        
	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , info : {}
       , reviewnum : "${map.reviewnum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기 - admin을 의미함
       , comment : ""
       , commentList : []
       , answer : ""       
       , comments : ""      
    }   
    , methods: {
    	// 상세 기본 출력
    	fnGetReview : function(){
            var self = this;
            var nparmap = {reviewnum : self.reviewnum, comments:self.comments};
            $.ajax({
                url:"/ARevDetail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.board;
		               
	                self.commentList = data.board;
	                console.log(self.commentList);
                }
            }); 
        }
        // 삭제 확인 버튼
    	, fnCheck : function(){
       		var self = this;
	      	var nparmap = {reviewnum : self.reviewnum};
	       	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    		alert("리뷰 정보가 삭제되었습니다.");
	       		self.fnDelete();
	    	}else{   //취소
	    		 alert("리뷰 삭제가 취소되었습니다.");
	    		 location.href="/reviewadmin.do";
	    	 }
    	}
        // 삭제 실행
    	,fnDelete : function(){
       		var self = this;
	      	var nparmap = {reviewnum : self.reviewnum};
	        $.ajax({
	            url:"/deleteARev.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	           		location.href="/reviewadmin.do";
	            }
	        });  		
    	}
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/reviewadmin.do";
    	} 
    	// 페이지 이동
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	}
    }   
    , created: function(){
    	var self = this;
    	self.fnGetReview(); 
	}
});
</script> 