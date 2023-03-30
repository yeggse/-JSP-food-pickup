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
	
	<title>boardDetail 페이지</title>
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
	       #btnn{
		       background-color: #8FBC94;
		       width: 80px;
		       height: 40px;
		       border-radius: 10px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       color: white;
		       padding: 0px;
	       }
	       
	       
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>리뷰 상세보기 </h2>
			<div class="card">
				<h2 class="card-header" style="font-size:larger; font-weight:600; text-align: center;"> 제목 : {{info.title}} </h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;">작성자 : {{info.nickname}}
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;">리뷰 작성일 : {{info.writedate}}</span></h4>
				</div>
				<div class="card-body">
				   	<div v-if="info.img != null" style="margin: 10px 10px 10px 10px;">	<!-- info.img : 이미지 경로(img/이미지 이름) DB 컬럼이랑 동일한 이름으로!-->
				   		<img :src="info.img"/>	<!-- src앞에 콜론: 을 붙이면 변수로 지정가능 -->
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			   	
			   	<div class = "card-body" v-if=" info.answer != null " style="font-size: 20px;">
					<label style="display: inline-flex; border-radius:5px; background-color:aliceblue; float: right;">사장님 댓글 작성 여부 : {{info.answer}}</label>
				</div>
			</div>
			<div>
			 	<div v-if="'${kind}' === 'B' && info.answer=='N'">
			 	<div class="card" style="margin-bottom:0px; margin-top:40px;">
			 	<h2 class="card-header" style=" font-size:large; font-weight:600; text-align: center;"> 사장님! 리뷰에 대한 댓글을 작성해 주세요😊	 </h2>
				</div>
					<textarea rows="3" cols="100" v-model="comments" style="margin-top:0px; width: -webkit-fill-available; height: 200px;"></textarea>
					<button @click="fnComment" id="btnn" style="margin-bottom:4px; float: right;">답변하기</button>
				</div>	
				<div v-else if="'${kind}' === 'B' && info.answer=='Y'">
			 	<div class="card" style="margin-bottom:0px; margin-top:40px;">
			 	<h2 class="card-header" style=" font-size:large; font-weight:600; text-align: center;"> 사장님께서 작성하신 댓글입니다😊	 </h2>
				</div>
					<div class = "card-body" style="margin-top:0px; width: -webkit-fill-available; height: 200px;">{{info.comments}}</div>
				</div>	
				
				<button @click="fnList" id="btnn" style="float: left; margin-bottom:200px; margin-right: 15px;">목록으로</button>
			</div>
	</div>
	        
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , info : {}
       , reviewnum : "${map.reviewnum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기
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
                url:"/detailReviewboard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.review;
	               
	                self.commentList = data.review;
	                console.log(self.commentList);
	                
                }
            }); 
        }
          
    	 , fnComment : function(){
			var self = this;
        	if(self.comments==""){
        		alert("댓글을 작성해 주세요");
        		return;
        	} else{
            	self.fnCommen();
        	}				
			
		} 
	    , fnCommen : function(){
	        var self = this;
	        var nparmap = {reviewnum : self.reviewnum, userId : self.userId, answer:self.answer, comments:self.comments};
	        $.ajax({
	            url:"/reviewcomment.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
		            	alert("댓글을 등록했습니다.");
		            	self.comment = "";
		            	self.fnList();
	            }
	        }); 
	    }
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/review.do";
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