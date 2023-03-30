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
		<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
</head>
<style>
	img{
	width:6rem;
	height:6rem;
	}
/* ----------------------------------------------------- */
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
#input {
   width: 25rem;
   margin-top: 0rem;
   padding: 3rem;
   box-sizing: border-box;
   border-radius: 0.66rem;
   border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
}
			
</style>
<body>
<jsp:include page="/layout/adminmypage.jsp"></jsp:include>

	<div id="app">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
			<h2>식당 종류별 리뷰 관리🙆‍♀️</h2>
			<div class="form-item input-group mb-3 " style="text-align: center; margin-left: 620px; float: left;">
				<input id="input" style="width: 300px; padding: 2px;" type="text" placeholder="어떤 점포의 리뷰를 찾으시나요?" v-model="resname"  v-on:keyup.enter="fnGetReview"></input>
				<button id="btn" @click="fnGetReview">검색</button>	
			</div>
				<form action="#" style="float: right; display: inline; margin-top:5px; margin-bottom:5px;">
					<select @change = "fnGetReview" style="width: 110px; height: 30px; font-size: large; font-weight: bold; text-align: center;" v-model="categori">
							<option value="">전체</option>
							<option value="한식">한식</option>
							<option value="양식">양식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="아시아">아시아</option>
						</select>
					</form> ‍
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/>
					<col width="10%"/> 
					<col width="10%"/> 
					<col width="*%"/>
					<col width="5%"/>
					<col width="10%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">-</th>
						<th scope="col">리뷰 번호</th>
						<th scope="col">업종</th>
						<th scope="col">점포명</th>
						<th scope="col">제목</th>
						<th scope="col">별점</th>
						<th scope="col">닉네임</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetail(item)">{{item.reviewnum}}</td> 
	                   <td @click="fnDetail(item)">{{item.categori}}</td> 
	                   <td @click="fnDetail(item)">{{item.resname}}</td>
	                   <td @click="fnDetail(item)">{{item.title}}</td>
	                   <td @click="fnDetail(item)">{{item.grade}}</td>
	                   <td @click="fnDetail(item)">{{item.nickname}}</td>
	                   <td @click="fnDetail(item)">{{item.writedate}}</td> 
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


</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
		el : '#app',
		data : {
			list :[]/* 게시판에 올려지는 글들은 다른 리스트 새로만들기1  */
			, selectPage: 1	// 기본 세팅이 1번 페이지로 맞추어져 있음.
	       	, pageCount: 1	        
	        , selectedItemList:[]
	        , reskind: "${map.reskind}"
			, flg : "${map.flg}"
			, resname : ""
			, categori : ""
		},
		methods : {
		fnGetReview : function() {
			var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10;
			var nparmap = {startNum : startNum, lastNum : lastNum, categori : self.categori,
						reskind: self.reskind, flg: self.flg, resname:self.resname};
			$.ajax({
				url : "/adminReviewList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list1;
					self.pageCount = Math.ceil(data.cnt / 10);
					console.log(self.list);
				}
			});
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
		// 페이지 전환 메소드
		, changePage : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);	// 한페이지에 10개씩 출력되도록 하기 위해 필요함
			var lastNum = 10;
	        var nparmap = {startNum : startNum, lastNum : lastNum, reskind: self.reskind, categori:self.categori,
	        				flg: self.flg, resname:self.resname};
	        $.ajax({
	            url:"/adminReviewList.dox",
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
		, fnDetail : function(item){
			var self = this;
			self.pageChange("/arevdetail.do", {reviewnum : item.reviewnum, resname:self.resname});	
		}
		// 화면 전환 for 상세 확인
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
		
	},
		created : function() {
			var self = this;
			self.fnGetReview();
			console.log(self.reskind);
			console.log(self.flg);
			
			
		}
	});
</script>


