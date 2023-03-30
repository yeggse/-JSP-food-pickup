<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  	<link rel="stylesheet" href="css/detail/MenuDetail.css">
  <title>메뉴 상세보기</title>
  <jsp:include page="/layout/header.jsp"></jsp:include>
</head>

<style>
	
		.contain {max-width:60rem; margin:30px auto; margin-top: 120px;  margin-bottom: 120px;}
  	    input {
            width: 50%;
            height: 13%	;
            margin-top: 0px;
	        padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
         } 
	      #btn{
		       background-color: #8FBC94;
		       width: 120px;
		       height: 50px;
		       border-radius: 10px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       font-weight: bolder;
		       color: white;
		       padding: 0px;
	       }
		h1{font-size: 1em;}
		h2{font-size: 2em;}

</style>

<body>
<div>
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app" style="height: 900px;">
		<div class="contain">
			<h2>메뉴 상세보기📝</h2>
			<div class="card">
				<h2 class="card-header p-4">
					음식명 : {{info.menuname}}
					<span style="font-size: large; float: right;">가격 : {{info.price}}</span>
				</h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;"> 재고 : {{info.supply}}
					<span  style="font-size: large; float: right;"> 픽업 시간 : {{info.pickuptime}}</span></h4>
				</div>
				<div class="card-body">
				   	<div v-if="info.picture != null" style="margin: 10px 10px 10px 10px;">	<!-- info.img : 이미지 경로(img/이미지 이름) DB 컬럼이랑 동일한 이름으로!-->
				   		<img :src="info.picture" style="max-width:300px; max-height:300px;"/>	<!-- src앞에 콜론: 을 붙이면 변수로 지정가능 -->
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.introduce}}
				   	</div>
			   	</div>
			</div>
			
		<div style="margin-bottom:200000px;">
			<button id="btn" @click="fnList" class="btn" style="float: right;">목록으로</button>
			<button id="btn" @click="fnEdit" class="btn" style="float: right;">수정하기</button>
		</div>
		</div>
	
	
	
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
 		  , idx : "${map.idx}"	// boardList 에서 받아온 값!!! for 이미지
   		  , userId : "${userId}"	//세션으로 id가져오기
   		  , resnum : "${resnum}"
   		  , reskind : "${reskind}"
 		  , selectedItemList : []
 	 	  
 
    } 
    , methods: {
    	// 메뉴 상세 기본 출력
    	fnGetBoard : function(){
            var self = this;
            console.log("idx는! == " + self.idx);
            var nparmap = {idx : self.idx};
            $.ajax({
                url:"/menu.detail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.board;
	                //self.commentList = data.commentList;
	                console.log(self.idx);
                }
            }); 
        }
		// 목록으로 가기 버튼
		, fnList : function(){
			location.href="/menumanagement.do";
		} 
		// 수정하기 버튼
        , fnEdit : function(){
    		var self = this;
   			self.pageChange("./menu.edit.do", {idx : self.idx});	// url이랑 index 모두 수정 필요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
	, created: function () {
	var self = this;
	self.fnGetBoard(); 
	}
});


</script>
