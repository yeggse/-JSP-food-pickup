<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="css/storeListClicked_Scroll.css"> -->
<title>[세잎] 업체군 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<!-- 구글 폰트 사용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/js-load.js"></script>

</head>



<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
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

/*상호명 별점 가게설명  */
.div1{
width:50rem;
height:10rem;

}
.title_food {
	width:25rem;
	height:9.9rem;
	margin:auto;
	margin-left:0rem;
	padding: 2rem;
	font-size: 3rem;
	font-weight: bold;
}
.star{
width:25rem;
height:9.9rem;
margin:auto;
margin-top:-10rem;
margin-left:25rem;
padding:2rem;
text-align:left;
}
/* 버튼div  */
.div2{
width:51rem;
height:5rem;
margin:auto;
margin-bottom:-0.3rem;
}

.btn1{
width:24.87rem;
height:4.7rem;
background:white;
border-left: 0.15rem solid #dcdcdc;
border-rigth: 0.15rem solid #dcdcdc;
border-top:none;
border-bottom:none;
margin:0rem;
}
.btn1:hover{
background: #dcdcdc;
}
.btn2{
width:24.87rem;
height:4.7rem;
background:white;
border-left: none;
border-right: 0.15rem solid #dcdcdc;
border-top:none;
border-bottom:none;
margin:0rem;
}
.btn2:hover{
background: #dcdcdc;
}

.count_menu {
	width:15rem;
	height:4rem;
	font-size: 1.5rem;
	padding:0.5rem;
	margin:auto;
	margin-left:70rem;
}

#vif{
width:55rem;
height:100%;
}

.itemMain{
width:55rem;
height:10rem;

}
/* 메뉴사진  */
.itemImg{
width:10rem ;
height:8rem;

margin:auto;
margin-left:1rem;
margin-top:1rem;

float: left; 
border: 1px solid red; 
}

/* 메뉴설명 */
.menuInformation{
width: 30rem; 
height: 8rem; 
margin:auto;
margin-left:0rem;
margin-top:1rem;
float: left;
text-align:left;
border: 1px solid green; 
}

/*메뉴 갯수 선택버튼  */
.itemBtn{
width:3.5rem;
height:8.1rem;
margin-top:1rem;
margin-left:43rem;
position:absolute;
z-index:-1;
}
.div1{
width:50rem;
height:100%;
border:0.15rem solid #dcdcdc;
}

.input2{
width: 3rem; 
height:2.5rem;
text-align: center;
margin:auto;
margin-top:1rem;
margin-bottom:0rem;
margin-right:5rem;
}
.btnPM{
width:3rem;
height:2rem;
margin:auto;
margin-top:0.8rem;
margin-right:5rem;
}
.btnPM:hover{
background: #gray;
}

</style>




<body>
	<!-- 메인 프레임 -->
	<div id="app" style="width: 100%; padding-top: 120px;" align="center">
	
		<div class="div1">
			<!-- 상호명 -->
			<div class="title_food">
				{{res.resname}}
			</div>
		
			<!-- 평점 / 가게위치 -->
			<div class="star">
				⭐평점:{{grade}}<br><br>
				🏠가게위치:{{res.resadd}} 
			</div>
		</div>

		<!-- 버튼 -->
		<div class="div2">
			<button class="btn1" @click="fnClick1">메뉴</button>
			<button class="btn2" @click="fnClick">리뷰 목록</button>
		</div>
		
		
		<!-- 시작================================================================================================ -->
			<!-- 여기부터 결제페이지까지 한 덩어리 -->
			<div v-if="flg" id="vif">
				


				<div class="div1">
				<!-- db에서 리스트 불러오기 -->
				<div v-for="(item, index) in list" class="itemMain">
						<img :src="item.picture" class="itemImg" />
					<div class="menuInformation">
						메뉴명:{{item.menuname}}<br>
						수량:{{item.supply}}<br>
						가격:{{item.price}}<br>
						간단한 음식설명:{{item.introduce}}
					</div>
						<button class="btnPM" @click="fnMenuincrease(item)">+</button><br>
						<input class="input2" type="text" name="calcul" :value="item.sum" /><br>
						<button class="btnPM" @click="fnMenudegrease(item)">-</button>
				</div>
				
				</div>
				
				<!-- offcanvas 결제창(결제하기 버튼 클릭시)-->
				<div>
					
					<!-- 결제하기 버튼-->
					<button class="btn btn-primary" type="button" id="btn_order"
						data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop"
						aria-controls="staticBackdrop" @click ="fncal">결제하기
					</button>
					
					<!-- offcanvas 기본설정 같은거인듯??-->
					<div class="offcanvas offcanvas-start" data-bs-backdrop="static"
						tabindex="-1" id="staticBackdrop"
						aria-labelledby="staticBackdropLabel" style="width: 700px">
						
						<!-- 결제창 Header-->
						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="staticBackdropLabel">결제창</h5>
							<button type="button" class="btn-close"
								data-bs-dismiss="offcanvas" aria-label="Close">
							</button>
						</div>
						
						<!-- 결제창 Body-->
						<div class="offcanvas-body">
							<div class="div2">
								
								<!-- 선택하신 메뉴-->
								<div style="font-size: xx-large; font-weight: bolder; margin-bottom: 10px; margin-left: 30px; margin-top: 10px;">
									선택하신 메뉴
								</div>
									
									
								<!-- (테이블)메뉴 가격 수량-->
								<table class="board_list">
									<!-- 없어도 큰 무리없어보여서 일단 주석
									<colgroup>
										<col width="10%" />
										<col width="15%" />
										<col width="20%" />
									</colgroup>
									 -->
									<thead>
										<tr>
											<th scope="col">|메뉴명|</th>
											<th scope="col">|가격|</th>
											<th scope="col">|수량|</th>
										</tr>
									</thead>
									
									<tbody>
										<tr v-for="(item, index) in list" style="margin-bottom: 5px; font-size: large; font-weight: bold; margin-left: 20px;">
											<td v-if="item.sum !=0">|{{item.menuname}}|</td>
											<td v-if="item.sum !=0">|{{item.price}}|</td>
											<td v-if="item.sum !=0">|{{item.sum}}|</td>
										</tr>
									</tbody>
								</table>
								<div style="margin-top: 5px; font-size: large; font-weight: bold; margin-left: 100px;">
									총결제 금액 : {{num}} 원
								</div>
								<table
									style="float: left; border: 1px solid black; border-collapse: collapse; margin-top: 100px; border-radius: 5px; text-align: center;">
									<td
										style="border: 1px solid #444444; font-size: x-large; font-weight: bolder; margin-top: 5px;">
										<div style="margin-top: 5px;">
											<label style="display: inline-flex;"><pre>아  이  디 </pre></label>
											<input type="text" :placeholder='userId' readonly></input>
										</div>
										<div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>이      름 </pre></label>
											<input type="text" :placeholder='name' readonly></input>
										</div>
										<div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>전화번호 </pre></label>
											<input style="margin-left: 25px;" type="text" :placeholder='phoneNum' readonly></input>
										</div>
										<div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>본인 계좌번호 </pre></label>
											<input style="margin-right: 35px;" type="text" :placeholder='acc' readonly></input>
										</div>
										<!-- <div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>사장님 계좌번호 </pre></label>
											<input style="margin-right: 55px;" type="text" :placeholder='res.resacc' readonly></input>
										</div> -->
										<div style="margin-top: 20px; margin-bottom: 5px">
											<label style="display: inline-flex;"><pre>결제방법 </pre></label>
											<form action="#" style="display: inline; margin-left: 75px;">
												<!-- 나란히 만들기 위해서 display: inline -->
												<select
													style="width: 400px; height: 40px; font-size: large; font-weight: bold;"
													v-model="payment">
													<option value="CASH">만나서 현금 결제</option>
													<!-- <option value="account">계좌 이체</option> -->
													<option value="card">만나서 카드 결제</option>
												</select>
											</form>
										</div>
									</td>
								</table>

								<div>
									<button @click="fnReserve" style="color: white; background-color: #8FBC94; margin-top: 10px; font-weight: bold; font-size: large; margin-bottom: 0px; width: 100%; border-radius: 10px; border: solid 2px #8FBC94;">
										예약 완료
									</button>
								</div>

							</div>
						</div>
					</div>
				</div>
				
			</div>

			<!-- 여기까지 테스트 -->
			<div v-show ="!flg">
				<div id="contents" style="width:825px">
					<div id="js-load" class="main">
						<ul class="container lists" >
							<h2>리뷰 상세보기</h2>
							<li class="card lists_item js-load" v-for="(item, index) in list1" style ="z-index:-100;">
								<h2 class="card-header p-4">제목 : {{item.title}}</h2>
								<div class="card-body1">
									<h4 style="font-size: large; margin-left: 20px;">
										분류 : {{item.categori}} 
										<span class="badge badge-pill badge-dark pull-right"
											style="font-size: large; float: right;">
											작성일 :{{item.writedate}}</span>
									</h4>
								</div>
								<div class="card-body">
									<div v-if="item.img != undefined"
										style="margin: 10px 10px 10px 10px;">
										info.img : 이미지 경로(img/이미지 이름) DB 컬럼이랑 동일한 이름으로!
										<img :src="item.img" />
										src앞에 콜론: 을 붙이면 변수로 지정가능
									</div>
									<div style="margin: 10px 10px 10px 10px;">
										{{item.content}}</div>
								</div>
								<div class="card-body" v-if=" item.answer != null "
									style="font-size: 20px;">
									<label
										style="display: inline-flex; border-radius: 5px; background-color: darkgray;">사장님:{{item.answer}}</label>
								</div>
							</li>
						</ul>
						<div id="js-btn-wrap" class="btn-wrap"
							style="margin-bottom: 100px;">
							<a href="javascript:;" class="button">더보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
				<!-- 끝=============================================================================================== -->
		
		
	</div>

	</div>
	</div>
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
	<script 
		src="https://kit.fontawesome.com/e2c13a792d.js"crossorigin="anonymous">
	</script>

</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list :[]/* 게시판에 올려지는 글들은 다른 리스트 새로만들기  */
	        ,list1:[]//리뷰리스트
	        ,selectedItemList1:[]
			,info : {}
			,flg : true
			,res : ${res} // Main type의 객체이름 res로(where=resnum 들고오는 과정) 당겨쓰는 과정 in ResmenuController
			,user : ${userVO}// user전체가 getter/setter되서 가져고 오는 형식. {{user.id}},{{user.name}} 쓸때 이렇게 쓸수있음. 여기한번 지정하고 다른데서 계속 쓸 수 있음.
							// 기존 방법과 차이 userId: "${userId}" 이렇게 적어 줬었음...
			,sum : 0
		    /* ,time : ${time} */
			,userId : "${userId}"
		    ,name : "${userName}"
		    ,kind : "${kind}"
		    ,phoneNum : "${userPhonenum}"
		    ,acc : "${userAcc}"	
		    ,num : 0
		    ,payment : ""
		    ,resname : ""
		    ,grade : ""
		    
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
						console.log(self.info);
						console.log(self.idx);
						console.log(self.list);
						
					}
				});
			}
		
		,fnGetReview : function() {
			var self = this;
			var nparmap = {resnum: self.res.resnum };
			$.ajax({
				url : "/searchReview.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list1 = data.list1;
					/* self.info = data.resimg; */
					var sum = 0;
					console.log("list1 ====", self.list1);
					if(data.list1.length > 0){
						self.grade = data.list1[0].avg;	
					}
					
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
		, fnview : function(item){
		  var self = this;
		  self.pageChange("/review.board.detail.do",{reviewnum:item.reviewnum})
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
		, fncal : function(){
			var self = this;
			self.num = 0;
				for(var i =0; i<self.list.length; i++){
					
					console.log(self.list[i]);
		    		self.num += ((self.list[i].price)*(self.list[i].sum));
		    		
				}
				
		}
		, fnView : function(){
			var self = this;
			self.pageChange("/main.payment.do", {list : self.list,resname:self.res.resname}); /// 주문갯수를 포함하는 리스트를 넘김
		}
		,fnReserve : function() {
			var self = this;
			console.log(self.list);
			if(self.payment ==""){
				alert("결제 방식을 입력해주세요");
			}
			else{
				if(confirm("정말로 결제하시겠습니까?")){
					for(var i = 0; i<self.list.length; i++){
						if(self.list[i].sum !=0){
							var nparmap = {
									resnum: self.list[i].resnum
				                    ,menuname:self.list[i].menuname
				                    ,userId:self.userId
				                    ,orderer:self.name
				                    ,pickuptime:self.list[i].pickuptime
				                    ,payment:self.payment
				                    ,price : self.list[i].price
				                    ,review:"N"
				                    ,salecomple: "N"
				                    ,menunum: self.list[i].sum
				                    ,sum : self.list[i].sum
				                    ,resname : self.resname
				                    ,reskind : self.res.reskind
				                    };
							$.ajax({
								url : "/Res/get.dox",
					            dataType : "json",
					            type : "POST",
					            data : nparmap,
					            success : function(data) 
					            {
					            	if (data.result == "success") {
					            		alert("예약성공");
					            		self.flg = true;
					            		self.pageChange("/reservemy.do", {});
					            		}
					            	else {
							            alert("예약 실패!");
							            }
					            	}
							})
							}	
						}
					}
				}
			}
		
		},
		created : function() {
			var self = this;
			this.fnGetImg();
			self.fnGetReview();
			self.resname = self.res.resname;
			console.log(self.resname);
			console.log(self.res.resnum);
			
			
		}
	});
</script>