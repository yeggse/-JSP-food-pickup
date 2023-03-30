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
	
	<title>memDetail 페이지</title>
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
		<div class="container">
			<h2>일반회원 상세 정보🔎 </h2>
			<div class="card">
				<h2 class="card-header p-4">
					회원명 : {{info.name}}
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;">회원ID : {{info.id}}</span>
				</h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;"> 닉네임 : {{info.nickname}}
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;"> 생년월일 : {{info.frontregisnum}}</span></h4>
				</div>
				<div class="card-body1">
				   	<div style="margin: 10px 10px 10px 10px;">
				   		주소 : {{info.address}}
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		연락처 : {{info.phonenum}}
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		계좌번호 : {{info.acc}}
				   	</div>
			   	</div>
			</div>
		 	<button @click="fnList" class="myButton" style="float: right;">목록으로</button> 
		 	<button v-if="'admin' == userId"  @click="fnEdit" class="myButton">수정하기</button>	 	
			<button @click="fnCheck" class="myButton" style="float: right; margin-right:30px;">회원 삭제</button>
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
       , id : "${map.id}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기 - admin을 의미함
       , comment : ""
       , commentList : []
       
    }   
    , methods: {
    	// 회원정보 출력
    	fnGetMember : function(){
            var self = this;
            var nparmap = {id : self.id};
            $.ajax({
                url:"/detailMem.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.board;	// serviceImp 파트에서 넘어오는 것!
	                //self.commentList = data.commentList;
	                console.log(self.idx);
                }
            }); 
        }
    	// 수정하기
    	, fnEdit : function(){
			var self = this;
			self.pageChange("./memedit.do", {id : self.id});	
			
		}
        // 회원 탈퇴 확인 버튼
    	, fnCheck : function(){
       		var self = this;
	      	var nparmap = {id : self.id};
	       	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    		alert("회원 정보가 삭제되었습니다.");
	       		self.fnDelete();
	       	
	    	}else{   //취소
	    		 alert("회원 삭제가 취소되었습니다.");
	    		 location.href="/normalMem.do";
	    	 }
    	}
        // 회원탈퇴 실행
    	,fnDelete : function(){
       		var self = this;
	      	var nparmap = {id : self.id};
	        $.ajax({
	            url:"/deleteMem.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	           		location.href="/normalMem.do";
	            }
	        });  		
    	}
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/normalMem.do";
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
    	self.fnGetMember(); 
	}
});
</script> 