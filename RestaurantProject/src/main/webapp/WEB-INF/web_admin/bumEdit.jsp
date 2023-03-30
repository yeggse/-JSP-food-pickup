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
	
	<title>bumEdit 페이지</title>
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
		       width: 80px;
		       height: 40px;
		       border-radius: 20px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       color: white;
		       padding: 0px;
	       }
		h1{font-size: 3em;}
		h2{font-size: 2em;}
		h3{font-size: 1.5em;}
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>사업자 회원 정보 수정</h2>
			<div style="margin-left: 50px;"><h3>회원님의 비밀번호는 아이디와 동일하게 지정합니다. 개별 번경 필수임을 공지하세요.</h3></div>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="text-align : center;" ><h3>id {{id}}님의 비밀번호 수정</h3></td>
					
				</tr>
				<tr>
				<td><input type="text" id="title" name="pwd" v-model="pwd"></td>
				</tr>
			</table>
		 	<button @click="fnList" class="btn" style="float: right;">목록으로</button> 
			<button @click="fnSave" class="btn" style="float: right;">저장</button>
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
       , id : "${map.id}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기
       , selectedItemList : []
       , pwd : ""
    }   
    , methods: {
	// 저장 버튼
		fnSave : function(){
    		var self = this;
	      	var nparmap = {pwd : self.pwd, id : self.id};
	        $.ajax({
	            url:"/bumEdit.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	           	 	alert("비밀번호가 변경 되었습니다.");
	           		location.href="/BuMemList.do";
	            }
	        }); 
		}
    // 목록으로 가기 버튼
    	, fnList : function(){
    		/* location.href="/main.board.do"; */
    		window.history.back();
    	} 
    }   
    , created: function () {
	}
});
</script> 