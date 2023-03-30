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
	       		.containers {
			max-width:60rem; margin:auto; margin-top: 12rem; z-index:-100px;
		}
		.myButton {
			box-shadow:inset 0px 1px 0px 0px #a4e271;
			background-color:#a5d296;
			border-radius:6px;
			border:1px solid #74b807;
			display:inline-block;
			cursor:pointer;
			color:#ffffff;
			font-family:Arial;
			font-size:15px;
			font-weight:bold;
			padding:6px 24px;
			text-decoration:none;
		}
		.myButton:hover {
			background:linear-gradient(to bottom, #77a809 5%, #89c403 100%);
			background-color:#77a809;
		}
		.myButton:active {
			position:relative;
			top:1px;
		}
</style>
<body>
	<div id="app">
		<div class="containers">
			<h2>공지사항 상세보기 </h2>
			<div class="card">
				<h2 class="card-header p-4">
					제목 : {{info.title}}
				</h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;">분류 : {{info.boardtype}}
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;">작성일 : {{info.startdate}}</span></h4>
				</div>
				<div class="card-body">
				   	<div v-if="info.image != null" style="margin: 10px 10px 10px 10px;">	<!-- info.img : 이미지 경로(img/이미지 이름) DB 컬럼이랑 동일한 이름으로!-->
				   		<img :src="info.image" style="max-width:600px; max-height:600px; "/>	<!-- src앞에 콜론: 을 붙이면 변수로 지정가능 -->
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			</div>
			<div v-for="(item, index) in commentList" style="font-size: 20px;">
				{{item.nickname}}({{item.startdate}}) : {{item.content}}
			</div>
			<div style="margin-bottom:100px;">
		 	<button @click="fnList" class="myButton" style="float: right;">목록으로</button> 
		 	<button v-if="'admin' == userId"  @click="fnEdit" class="myButton">수정하기</button>	 
		 	</div>	
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
       , idx : "${map.noticenum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기
       , comment : ""
       , commentList : []
       
    }   
    , methods: {
    	// 게시글 상세 기본 출력
    	fnGetBoard : function(){
            var self = this;
            console.log("test == " + self.idx);
            var nparmap = {noticenum : self.idx};
            $.ajax({
                url:"/detailBoard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.board;
	                console.log(self.info);
	                //self.commentList = data.commentList;
	                console.log(self.idx);
	                
                }
            }); 
        }
        
    	, fnEdit : function(){
			var self = this;
			self.pageChange("./main.board.edit.do", {noticenum : self.idx});	
			
		}
		
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/main.board.do";
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
    	self.fnGetBoard(); 
	}
});
</script> 