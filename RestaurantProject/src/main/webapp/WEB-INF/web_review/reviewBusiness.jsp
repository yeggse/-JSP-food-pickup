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
	
</head>
<style>
	img{
	width:6rem;
	height:6rem;
	}
	/* ----------------------------------------------------- */
	#input {
	   width: 25rem;
	   margin-top: 0rem;
	   padding: 0.66rem;
	   box-sizing: border-box;
	   border-radius: 0.66rem;
	   border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	}
	   
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
	.tdinput{
	width:2rem;
	}
	.container {
	max-width:70rem; margin:auto; margin-top: 8rem;
	}
	/* 게시글 출력 파트 */
	.board_list thead th:first-child {background-image:none;}
	.board_list thead th {border-bottom:1px solid #ccc; padding:13px 0; color:#3e4149; text-align: center; vertical-align:middle;}
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
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>

	<div id="app">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
			<h2>점포 리뷰 관리🙆‍♀️ - 검색버튼 활성화 필요</h2>‍
			<div style="text-align: center;">
			
				
			</div>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="10%"/> 
					<col width="10%"/> 
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">-</th>
						<th scope="col">리뷰 번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">별점</th>
						<th scope="col">닉네임</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetailreview(item)">{{item.reviewnum}}</td> 
	                   <td @click="fnDetailreview(item)">{{item.categori}}</td> 
	                   <td @click="fnDetailreview(item)">{{item.title}}</td>
	                   <td @click="fnDetailreview(item)">{{item.grade}}</td>
	                   <td @click="fnDetailreview(item)">{{item.nickname}}</td>
	                   <td @click="fnDetailreview(item)">{{item.writedate}}</td> 
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->		
			<template>
			<paginate
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
		el : '#app',
		data : {
			list :[]/* 게시판에 올려지는 글들은 다른 리스트 새로만들기  */
			, selectPage: 1	// 기본 세팅이 1번 페이지로 맞추어져 있음.
	       	, pageCount: 1	        
	        ,selectedItemList:[]
	        ,resnum : "${resnum}"
	        ,userId : "${userId}"
	        ,resname :  "${resname}"
	        ,reviewnum :  ""
	        ,categori : ""
	        ,grade : ""
	        ,nickname : ""
	        ,writedate : ""
		},
		methods : {
    	// 기본 출력 메소드 - 검색도 여기서 진행함~~
        fnGetReview : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10;
            var nparmap = {startNum : startNum, lastNum : lastNum, resnum: self.resnum};
            $.ajax({
                url:"/BuReviewList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list1;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(data.cnt);
                }
            }); 
        } 		
		// 페이지 전환 메소드
		, changePage : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);	// 한페이지에 10개씩 출력되도록 하기 위해 필요함
			var lastNum = 10;
	        var nparmap = {startNum : startNum, lastNum : lastNum, resnum: self.resnum};
	        $.ajax({
	            url:"/BuReviewList.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list1;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(data);
	            }
	        }); 
		}
		,fnDetailreview : function(item){
			var self = this;
			self.pageChange("/review.board.detail.do",{reviewnum : item.reviewnum, answer : item.answer});
			console.log(self.reviewnum);
		}
		, pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
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
		
		},
		created : function() {
			var self = this;
			self.fnGetReview();
			console.log(self.resname);
			console.log(self.userId);
			
		}
	});
</script>


