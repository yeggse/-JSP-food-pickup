<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<title>board 공지사항 기본 출력 페이지</title>
</head>
<style>
		        * {
	            font-family: 'Noto Sans KR', sans-serif;
	            text-decoration-line: none;
	        }
	        
    .container {max-width:1024px; margin:30px auto; margin-top: 120px;}	/* 게시글 출력 파트 */
	.board_list {table-layout: fixed; width:100%; border-top:2px solid #c6e5d9; border-bottom:2px solid #c6e5d9; margin:15px 0; border-collapse: collapse;}
	.board_list thead th:first-child {background-image:none;}
	.board_list thead th {border-bottom:1px solid #ccc; padding:13px 0; color:#3e4149; text-align: center; vertical-align:middle;}
	.board_list tbody td {border-top:1px solid #ccc; padding:13px 0; text-align:center; vertical-align:middle;}
	.board_list tbody tr:first-child td {border:none;}
	.board_list tbody tr:hover{background:#fffcf0; }
	.board_list tbody td.title {text-align:left; padding-left:20px;}
	.board_list tbody td a {display:inline-block}

	/* 화면 넘기는 아이템 디자인 */
.pagination {
        margin:24px;
        display: inline-flex;
        
    }
.pagination li {
    min-width:32px;
    padding:2px 6px;
    text-align:center;
    margin:0 3px;
    border-radius: 6px;
    border:1px solid #eee;
    color:#666;
}
.pagination li:hover {
    background: #E4DBD6;
}
.page-item a {
    color:#666;
    text-decoration: none;
}
	/* 페이징에 동그란 점 없어지게 하기 */
	li{
	list-style:none;
	}
	
	/* 페이징 컬러 */
.pagination li.active {
    background-color : #3e4149;	/* #E7AA8D */
    color:#fff;
}
 .pagination li.active a {
    color:#fff;
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
select {
	margin-bottom: 10px;
	margin-top: 10px;
	background: initial;
}
	       #btnList{
		       color: #8FBC94;
		       font-weight: bold; 
		       width: 80px;
		       height: 40px;
		       background-color: white;
		       border-radius: 20px;
		       border: white ;
		       font-size: large;
		       padding: 0px;
	       }
	       .btn-outline-success {
			    color: #198754;
			    border-color: #198754;
			    hover-color: #fff;
			    hover-bg: #198754;
			    hover-border-color: #198754;
			    focus-shadow-rgb: 25,135,84;
			   active-color: #fff;
			    active-bg: #198754;
			    active-border-color: #198754;
			    active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
			    disabled-color: #198754;
			   disabled-bg: transparent;
			    disabled-border-color: #198754;
			    gradient: none;
		    }
		    .btn1 {
		   		width: 80px;
		  		height: 43px;
			    padding-x: 0.75rem;
			    padding-y: 0.375rem;
			    font-family: ;
			    font-size: 1rem;
			    font-weight: 400;
			    line-height: 1.5;
			   color: #212529;
			    bg: transparent;
			    border-width: var(--bs-border-width);
			   border-color: transparent;
			    border-radius: 0.375rem;
			    hover-border-color: transparent;
			    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15),0 1px 1px rgba(0, 0, 0, 0.075);
			    disabled-opacity: 0.65;
			    focus-box-shadow: 0 0 0 0.25rem rgba(var(--bs-btn-focus-shadow-rgb), .5);
			    display: inline-block;
			    padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
			    font-family: var(--bs-btn-font-family);
			    font-size: var(--bs-btn-font-size);
			    font-weight: var(--bs-btn-font-weight);
			    line-height: var(--bs-btn-line-height);
			    color: var(--bs-btn-color);
			    text-align: center;
			    text-decoration: none;
			    vertical-align: middle;
			    cursor: pointer;
			    -webkit-user-select: none;
			    -moz-user-select: none;
			    user-select: none;
			    border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
			    border-radius: var(--bs-btn-border-radius);
			    background-color: var(--bs-btn-bg);
			    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
			}
			
			.form-item input {
			    width: 300px;
			    height: 43px;
			    padding: 12px;
			    font-size: 18px;
			    color: #111111;
			    border: 0;
			    border-radius: 5px;
			    border: 1px #cccccc solid;
                margin-top: 0px;
	      		padding: 10px;
           		box-sizing: border-box;
			}
			.form-item input:focus {
			    border-color:#198754;
			    outline: none;
			}
</style>
<body>
	<div id="app">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
				<h2>세잎 공지사항</h2>

			<div class="form-item input-group mb-3 " style="text-align: center; margin-left: 620px; float: left;">
			<input type="text" placeholder="찾고있는 공지사항이 있나요?" v-model="title" v-on:keyup.enter="fnGetList">
			<button @click="fnGetList" class="btn btn-outline-success" type="button" id="button-addon2">검색</button>
			</div>
			 		<form action="#" style="float: left; display: inline;">
						<select @change = "fnGetList" style="width: 110px; height: 30px; font-size: 
							large; font-weight: bold; text-align: center;" v-model="boardtype">
							<option value="">전체</option>
							<option value="일반회원">일반회원</option>
							<option value="사장님">사장님</option>
						</select>
					</form> 
			<span style="float: right; margin-top:10px; margin-bottom: 9px;">
				<button v-if="'admin' == userId" @click="fnAdd" class="myButton" style="float: right; margin-right: 10px;">작성하기</button>
		  		<button v-if="'admin' == userId" @click="fnRemove" class="myButton" style="float: right; margin-right : 5px;">삭제</button>
			</span>					
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/> 
					<col width="10%"/> 
					<col width="*"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr style="background: #c6e5d9; border-bottom: 2px solid #c6e5d9; ">
						<th scope="col">-</th>
						<th scope="col">번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetailView(item)">{{item.noticenum}}</td> 
	                   <td @click="fnDetailView(item)">{{item.boardtype}}</td> 
	                   <td @click="fnDetailView(item)">{{item.title}}</td> 
	                   <td @click="fnDetailView(item)">{{item.hits}}</td>
	                   <td @click="fnDetailView(item)">{{item.nickname}}</td>
	                   <td @click="fnDetailView(item)">{{item.startdate}}</td>
	               	
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->			
			<template>
			<paginate
				style="margin-top:5px; margin-bottom:100px;"
			    :page-count="pageCount"
			    :page-range="3"
			    :margin-pages="2"
			    :click-handler="changePage"
			    :prev-text="'<'"
			    :next-text="'>'"
			    :container-class="'pagination'"
			    :page-class="'page-item'">
			  </paginate>
			</template>
		  	<div>

		  	</div>
		  	
		  </div>	
	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
        list : [] 
       	, selectedItemList : []
		, selectPage: 1	// 기본 세팅이 1번 페이지로 맞추어져 있음.
       	, pageCount: 1
        , userId : "${userId}"
        , boardtype : ""
        , noticenum : ""
        , title : ""
        , hits : ""
        , nickname : ""
        , startdate : ""
        , boardtype : ""
    }   
    , methods: {
    	// 기본 출력 메소드 - 검색도 여기서 진행함~~
        fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10;
            var nparmap = {startNum : startNum, lastNum : lastNum, title : self.title, boardtype : self.boardtype};
            $.ajax({
                url:"/firstBoard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(data);
                }
            }); 
        }  

    	// 게시글 상세 확인
    	, fnDetailView : function(item){
    		var self = this;
    		self.pageChange("/main.board.detail.do", {noticenum : item.noticenum});	// 상세페이지로 해당 인덱스 번호를 넘겨줌~~!
    	}
		// 화면 전환 for 게시글 상세 확인
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
		
		// 페이지 전환 메소드
		, changePage : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);	// 한페이지에 10개씩 출력되도록 하기 위해 필요함
			var lastNum = 10;
	        var nparmap = {startNum : startNum, lastNum : lastNum, title : self.title, boardtype : self.boardtype};
	        $.ajax({
	            url:"/firstBoard.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(data);
	            }
	        }); 
		}
		// 작성하기 페이지로 이동
		, fnAdd : function(){
    		var self = this;
    		self.pageChange("/main.board.add.do", {});
		}
    	
		// 게시글 삭제하기
    	, fnRemove : function(){
    		var self = this;
    		if(self.selectedItemList.length == 0){
    			alert("삭제하실 게시글을 선택해 주세요.");
    			return;
    		}
    		var list = JSON.stringify(self.selectedItemList);
    		
    		var nparmap = {"test" : "1",  "list" : list};
             $.ajax({
                 url:"/deleteBoard.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {  
                	 alert("삭제되었습니다.");
                	 self.selectedItemList = [];
                	 self.fnGetList();
                 }
             });  
    	}
    } 
    , created: function () {
    	var self = this;
    	self.fnGetList();      
	}
});
</script> 