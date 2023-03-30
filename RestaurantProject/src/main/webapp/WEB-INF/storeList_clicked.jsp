<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="css/storeListClicked_Scroll.css"> -->
<title>[세잎] 업체군 리스트</title>
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

/* ul li태그에 리스트 스타일을 없앰 */
ul li {
	list-style: none;
}
/* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
a {
	text-decoration: none;
	color: #333;
}

/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼 배경색은 #ccc, 글자색은 검정색, 라인높이50px
menu박스 가운데정렬, 글자가운데 정렬 */
#filter {
	font: bold 16px "malgun gothic";
	width: 700px;
	height: 50px;
	background: #ccc;
	color: black;
	line-height: 50px;
	margin: 0 auto;
	text-align: center;
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#filter>ul>li {
	float: left;
	width: 140px;
	position: relative;
}

#filter>ul>li>ul {
	width: 130px;
	display: none;
	position: absolute;
	font-size: 14px;
	background: skyblue;
}

#filter>ul>li:hover>ul {
	display: block;
}

#filter>ul>li>ul>li:hover {
	background: orange;
	transition: ease 1s;
}

/* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
.position_res {
	font-size: 25px;
	font-weight: bold;
	margin-left: 390px;
	margin-top: 10px;
}

.title_food {
	font-size: 50px;
	font-weight: bold;
	margin-left: 150px;
	padding: 20px;
}

.grade {
	font-size: 20px;
	margin-top: 0px; /* 바깥쪽여백 */
	margin-left: 180px;
	color: #ed9108;
}

input {
	width: 400px;
	margin-top: 0px;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 10px;
	border: solid 2px #8FBC94;
	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
}

#btn_menu {
	background-color: #2ecc71;
	width: 250px;
	height: 40px;
	border-radius: 10px;
	border: solid 2px #2ecc71;
	font-size: large;
	color: white;
	padding: 0px;
	margin-top: 50px;
	margin-left: 100px;
}

#btn_review {
	background-color: gray;
	width: 250px;
	height: 40px;
	border-radius: 10px;
	border: solid 0px #gray;
	font-size: large;
	color: white;
	padding: 0px;
	margin-top: 50px;
	margin-left: 100px;
}

.count_menu {
	font-size: 30px;
	color: black;
	padding: 0px;
	margin-top: 50px;
	margin-left: 1500px;
}

#btn_order {
	background-color: #2ecc71;
	width: 190px;
	height: 50px;
	border-radius: 10px;
	font-size: large;
	color: white;
	padding: 0px;
	margin-top: 60px;
	margin-left: 74%;
	margin-bottom: 70px;
}

#btn_img {
	width: 350px;
	height: 210px;
	border-radius: 10px;
	margin-left: 50px;
	margin-top: 60px;
}

.text_img {
	width: 1300px;
	height: 210px;
	margin-left: 500px;
	margin-top: 60px;
	border: 1px solid green;
}
</style>

<body>
	<div id="app" style="width: 100%; padding-top: 120px;" anlign="center">
		<div class="title_food">{{res.resname}}</div>
		<span class="grade" style="margin-left: 180px;">평점 :{{res.grade}}</span> 
		<span class="position_res" style="marin-top: -50px;"> 가게위치:{{res.resadd}} <!-- {{list[0].pickuptime}} 집에서 mysqpl로 다시 수정하기.--></span>
		<!-- 가계주소들어와야함 -->
		<div class="position_res" style="margin-left: 619px;">운영시간 : </div>
		<!-- 가계주소들어와야함 1-->
		<div>
			<button id="btn_menu" @click="fnClick1">메뉴</button>
			<button id="btn_review" @click="fnClick">리뷰</button>
		</div>
		<div style="margin-top: 50px;">
			<!-- 값이 없을때를 대비해서 예외처리도 해줘야한다. -->
			<!-- {{list[0].price}} 포문없을때 출력하는 방법-->
			<!-- 지금 예쁘게 나오는 예시 -->
			<div v-if="flg">
				<span class="count_menu">메뉴선택 갯수</span>
				<div v-for="(item, index) in list" style="height:200px;">
					<div style="margin-top: 30px; margin-left: 60px; width: 300px; height: 180px; border-radius: 10px; border: 1px solid red; float: left; margin-right: 60px;">
						<img style="margin-left: 0px" width="100%" height="100%" :src="item.picture"/>
						
					</div>
					<div
						style="margin-top: 30px; margin-right: 100px; width: 1000px; height: 180px; border: 1px solid green; float: left;">
						<div style="margin-bottom: 10px;">메뉴명:{{item.menuname}}</div>
						<div style="margin-bottom: 10px;">수량:{{item.supply}}</div>
						<div style="margin-bottom: 10px;">가격:{{item.price}}</div>
						<div style="margin-bottom: 10px;">간단한 음식설명:{{item.introduce}}</div>
					</div>
					<div style="padding-top: 110px;">
						<button @click="fnMenudegrease(item)">-</button>
						<input style="width:50px; text-align:center;"  type="text" name="calcul" :value="item.sum"/> <!-- resmenu.xml에 ,0 as sum 을 넣음으로써 첫번째 값을 0으로 다 넣은 임의의 컬럼을 만들어줘서 가능함. :표시는 가져올때 씀 -->
						<button @click="fnMenuincrease(item)">+</button>
					</div>
				</div>
					<div>
						<button id="btn_order" @click = "fnView">주문시작</button>
					</div>
			</div>
			<div v-else><h2 style="margin-left: 50px;">게시글 목록</h2>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/>
					<col width="*"/>
					<col width="5%"/>
					<col width="10%"/>
					<col width="25%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">분류</th>
						<th scope="col">작성자닉네임</th>
						<th scope="col">제목</th>
						<th scope="col">날짜</th>
						<th scope="col">별점</th>
					</tr>
				</thead>
			
			</table>
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
			</div>
			
		</div>



	</div>

</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list :[]
			/* 게시판에 올려지는 글들은 다른 리스트 새로만들기  */
			,info : {}
			
			,flg : true
			/* ,res : ${res} // Main type의 객체이름 res로(where=resnum 들고오는 과정) 당겨쓰는 과정 in ResmenuController */
			,user : ${userVO}// user전체가 getter/setter되서 가져고 오는 형식. {{user.id}},{{user.name}} 쓸때 이렇게 쓸수있음. 여기한번 지정하고 다른데서 계속 쓸 수 있음.
							// 기존 방법과 차이 userId: "${userId}" 이렇게 적어 줬었음.
		    ,sum : 0
		    /* ,time : ${time} */
		},
		methods : {
			fnGetImg : function() {
				var self = this;
				var nparmap = {resnum: self.res.resnum, idx: self.idx};
				$.ajax({
					url : "/Res.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.info = data.resimg;
						console.log(self.idx);
						console.log(self.list);
						
					}
				});
			}
		,fnClick : function() {
			var self = this;
			self.flg = false;
		}
		,fnClick1 : function() {
			var self = this;
			self.flg = true;
		}
		, fnMenuincrease : function(item){
			var self = this;
			if(item.supply > item.sum){
				item.sum += 1;	
			}else{
				alert("주문수량을 초과하였습니다.");
				return item.sum;
			}
		}
		, fnMenudegrease : function(item){
			var self = this;
			if(item.sum < 1){
				alert("주문수량을 체크해 주세요.");
				return item.sum=0;	
			}else{
				item.sum -= 1;	
			}
			
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
		, fnView : function(){
			var self = this;
			self.pageChange("/main.payment.do", {list : self.list,resname:self.res.resname}); /// 주문갯수를 포함하는 리스트를 넘김
		}
		},
		created : function() {
			var self = this;
			this.fnGetImg();
			
		}
	});
</script>