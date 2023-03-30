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
	
	<title>일반 회원 관리</title>
</head>
<style>
img{
width:6rem;
height:6rem;
}
/* ----------------------------------------------------- */
   
#btn{
	background-color: #8FBC94;
	width: 5rem;
	height: 2.5rem;
	border-radius: 1.25rem;
	border: solid 2px #8FBC94;
	font-size: large;
	color: white;
	padding: 0rem;
}
/* ------------------------------------------------------- */
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
.pagination {
        margin:1.5rem;
        display: inline-flex;
    }
.pagination li {
    min-width:32px;
    padding:2px 6px;
    text-align:center;
    margin:0 0.3rem;
    border-radius: 0.33rem;
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
.pagination li.active {
    background-color : red;	/* #E7AA8D */
    color:white;
}
 .pagination li.active a {
    color:whir;
} 
.tdinput{
width:2rem;
}
.container {
max-width:70rem; margin:auto; margin-top: 8rem;
}	/* 게시글 출력 파트 */
.board_list {
table-layout:; width:100%; border-top:2px solid #252525; border-bottom:1px solid #ccc; margin:1rem 0rem;
}
.board_list tbody td {
border-top:1px solid #ccc; padding:0.8rem 0rem; text-align:center; vertical-align:middle;
}
.board_list tbody tr:hover{
background:#ffff99;
}
</style>
<body>
<jsp:include page="/layout/adminmypage.jsp"></jsp:include>
	<div id="app" style="margin-bottom:100px">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
			<h2>일반 회원 관리🙆‍♀️ </h2>‍
			<div style="text-align: center;">
			
				<input style="width: 40%; padding: 2px;" type="text" placeholder="id 혹은 이름을 검색해 주세요" v-model="search"  v-on:keyup.enter="fnGetList"></input>
				<button id="btn" @click="fnGetList">검색</button>	
				
			</div>
			<table class="board_list">
				<colgroup>
					<col width="10%"/> 
					<col width="10%"/> 
					<col width="*%"/>
					<col width="15%"/>
					<col width="15%"/>
					
				</colgroup>
				<thead>
					<tr>
						<th scope="col">회원명</th>
						<th scope="col">닉네임</th>
						<th scope="col">아이디</th>
						<th scope="col">주소</th>
						<th scope="col">생년월일</th>
						<th scope="col">전화번호</th>
					</tr>
				</thead>
				<!-- db 수정되면 알맞은 값 가져오기 -->
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td @click="fnMemDetail(item)">{{item.name}}</td> 
	                   <td @click="fnMemDetail(item)">{{item.nickname}}</td> 
	                   <td @click="fnMemDetail(item)">{{item.id}}</td>
	                   <td @click="fnMemDetail(item)">{{item.address}}</td>
	                   <td @click="fnMemDetail(item)">{{item.frontregisnum}}</td>
	                   <td @click="fnMemDetail(item)">{{item.phonenum}}</td>
	                    
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->			
			<template>
			<paginate
				style=" margin-bottom: 200px;"
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
        , name : ""
        , nickname : ""
        , id : ""
        , address : ""
        , frontregisnum : ""
        , phonenum : ""
        , kind :"${kind}"
        , acc : ""
        , search : ""
       
    }   
    , methods: {
    	// 기본 출력 메소드
        fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10;
            var nparmap = {startNum : startNum, lastNum : lastNum, search : self.search}; //startNum:page에 표시되는 최소 게시물 갯수(0), lastNum:page에 표시되는 최대 게시물 갯수(10)
            $.ajax({
                url:"/normalMem.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);//게시물 갯수를 10으로 나누고 Math.ceil함수를 사용해서 필요한 페이지 갯수 정함 ex)(data.cnt/10)=1.02 -->페이지 2개
                	console.log(self.list+"DD");
                }
            }); 
        }
    	, fnMemDetail : function(item){
    		var self = this;
    		self.pageChange("/member.detail.do", {id : item.id});	// 상세페이지로 해당 인덱스 번호를 넘겨줌~~!
    	}
		// 화면 전환 for 멤버정보 상세 확인
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
	        var nparmap = {startNum : startNum, lastNum : lastNum};
	        $.ajax({
	            url:"/normalMem.dox",
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
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();    
	}
});
</script> 


