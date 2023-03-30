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
	
	<title>boardEdit 페이지</title>
</head>
<style>
  	      input {
            width: 400px;
            margin-top: 0px;
	        padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            border: solid 2px #548687;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
         }   
         textarea{
            width: 400px;
            margin-top: 0px;
	        padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/        
         }
	       #btnn{
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
				margin-right: 10px;
				margin-top: 5px;
			}
				       
			#btnn:hover {
				background:linear-gradient(to bottom, #77a809 5%, #89c403 100%);
				background-color:#77a809;
			}
			#btnn:active {
				position:relative;
				top:1px;
			}
select
		h1{font-size: 3em; }
		h2{font-size: 2em;}
		h3{font-size: 1.5em;}
		.container {
			max-width:60rem; margin:auto; margin-top: 12rem;
		}
</style>
<body>
	<div id="app">
		<div class="container">
			<h2 style="font-weight: bold; ">공지사항 수정하기</h2>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="text-align : center;" ><h3>제목</h3></td>
					<td><input type="text" id="title" name="title" v-model="title"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" v-model="content"></textarea>
					</td>
				</tr>
			</table>
		 	<button @click="fnList" id="btnn" style="float: right;">목록으로</button> 
			<button @click="fnSave" id="btnn" style="float: right;">저장</button>
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
       , noticenum : "${map.noticenum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기
       , selectedItemList : []
       , content : ""
       , title : ""
    }   
    , methods: {
    	// 게시글 상세 기본 출력
    	fnGetBoard : function(){
            var self = this;
            console.log("test == " + self.noticenum);
            var nparmap = {noticenum : self.noticenum};
            $.ajax({
                url:"/detailBoard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
                    self.title = data.board.title;
                    self.content = data.board.content;
                
                }
            }); 
        }
	// 저장 버튼
		, fnSave : function(){
    		var self = this;
	      	var nparmap = {title : self.title, content : self.content, noticenum : self.noticenum};
	        $.ajax({
	            url:"/editBoard.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	           	 	alert("저장되었습니다..");
	           		location.href="/main.board.do";
	            }
	        }); 
		}
    // 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/main.board.do";
    	} 
    }   
    , created: function () {
    	var self = this;
    	self.fnGetBoard(); 
	}
});
</script> 