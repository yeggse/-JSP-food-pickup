<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
crossorigin="anonymous" />

<!-- 구글 폰트 사용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">

<style>
body{
	font-family: Verdana, sans-serif;
}
.mySlides{
	display: none;
}
img{
	vertical-align: middle;
}
/* Slideshow container */
.slideshow-container {
	max-width: 62.5rem;
	position: relative;
	margin: auto;
	margin-top:5rem;
}
/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 1rem;
	padding: 0.5rem 0.75rem;
	position: absolute;
	bottom: 0.5rem;
	width: 100%;
	text-align: center;
}


/* The dots/bullets/indicators */
.dot {
}
.active {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.6s;
	animation-name: fade;
	animation-duration: 3.2s;
}

@-webkit-keyframes fade {
	from {opacity: .4} 
	to {opacity: 1}
}

@keyframes fade {
	from {opacity: 100} 
	to {opacity: 100}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 29rem) {
	.text {font-size: 0.75rem}
}
#imgbtn1 {
	width: 22rem;
	height: 15.8rem;
	border: 0.1rem solid #a0a0a0 ;
	margin-right: 2.5rem;
	padding: 0px;
	
	float:left;
}
#imgbtn2 {
	width: 22rem;
	height: 15.8rem;
	border: 0.1rem solid #a0a0a0 ;
	margin-right: 2.5rem;
	padding: 0px;
	background: url("img/main/Mkor.PNG") no-repeat;
	background-size: cover;
	float:left;
	
}
#imgbtn3 {
	width: 22rem;
	height: 15.8rem;
	border: 0.1rem solid #a0a0a0 ;
	margin-right: 2.5rem;
	padding: 0rem;
	background: url("img/main/Mjap.PNG") no-repeat;
	background-size: cover;
		float:left;
	
}
#imgbtn4 {
	width: 22rem;
	height: 15.8rem;
	border: 0.1rem solid #a0a0a0 ;
	margin-right: 2.5rem;
	padding: 0rem;
	background: url("img/main/Mchi.PNG") no-repeat;
	background-size: cover;
		float:left;
	
}
#imgbtn5 {
	width: 22rem;
	height: 15.8rem;
	border: 0.1rem solid #a0a0a0 ;
	margin-right: 2.5rem;
	padding: 0px;
	background: url("img/main/Masia.PNG") no-repeat;
	background-size: cover;
		float:left;
	
}
#imgbtn6 {
	width: 22rem;
	height: 15.8rem;
	border: 0.1rem solid #a0a0a0 ;
	margin-right: 2.5rem;
	padding: 0rem;
	background: url("img/main/Mwe.PNG") no-repeat;
	background-size: cover;
		float:left;
	
}
#imgbtn2:hover{
border: 0.2rem solid #343a40;
}
#imgbtn3:hover{
border: 0.2rem solid #343a40;
}
#imgbtn4:hover{
border: 0.2rem solid #343a40;
}
#imgbtn5:hover{
border: 0.2rem solid #343a40;
}
#imgbtn6:hover{
border: 0.2rem solid #343a40;
}
.img{
  background: url(https://www.adobe.com/kr/creativecloud/photography/hub/guides/media_159fdae2ae33a36aa49f0f2b79fcd72a312252c8f.jpeg?width=2000&format=webply&optimize=medium) no-repeat center;
  background-size: cover;
  height: 500px;
  position: relative;
}

.select{
	width:10rem;
	height:3rem;
	margin: 1.5rem 10rem 0rem 21rem;
	float: left;
}
.select:hover{
border: 0.15rem solid black;
}

.h2{
  	text-align: center;
  	position: absolute;
  	top: 0%;
  	left: 70%;
  	color: white;
}

.div4{
	width:80rem;
	height:40rem;
	margin:auto;
	margin-top:5rem;
  	display: grid;
  	grid-template-columns: auto auto auto;
  	padding: 1rem;
 	column-gap: 0rem;
 	row-gap: 3rem;	
}
.main{
width:120rem;
height:90rem;
position:absolute;
z-index: -100;
}
	

.wrap1 {
	width:2rem;
	height:2rem;
	margin: 1rem 0rem 0rem 95rem;
	position:absolute;
	}
.chatbox1 {
	animation: motion 0.3s linear 0s infinite alternate;
}

.wrap2 {
	width:2rem;
	height:2rem;
	margin: 1rem 0rem 0rem 93rem;
	position:absolute;
	}
.chatbox2 {
	animation: motion 0.3s linear 0.3s infinite alternate;
}
.wrap3 {
	width:2rem;
	height:2rem;
	margin: 1rem 0rem 0rem 91rem;
	position:absolute;
	}
.chatbox3 {
	animation: motion 0.3s linear 0s infinite alternate;
}
@keyframes motion {
	0% {margin-top: 0rem;}
	100% {margin-top: 0.625rem;}
}
</style>

</head>
<jsp:include page="/layout/header.jsp"></jsp:include>
<body>
<div id="app" class="main">

<!-- 슬라이드 -->
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="https://www.adobe.com/kr/creativecloud/photography/hub/guides/media_159fdae2ae33a36aa49f0f2b79fcd72a312252c8f.jpeg?width=2000&format=webply&optimize=medium" style="width:100%; height:30rem">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <img src="http://www.kyongbuk.co.kr/news/photo/202203/2096330_527792_3845.jpg" style="width:100%; height:30rem">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <img src="https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004023/img/basic/a0004023_main.jpg?20191226165401" style="width:100%; height:30rem">
  <div class="text"></div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>





<!-- 지역설정 -->
<form method="post" id="frm" name="frm" >
	<select id="si" name="si" v-model="si" class="select" >
	<option value="">지역선택</option>
	<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
	</select>
</form>
	<div  class="wrap1">
		<img src="img/main/세잎클로버.png" class="chatbox1">
	</div>
	<div class="wrap2">
		<img src="img/main/세잎클로버.png" class="chatbox2">
	</div>
	<div class="wrap3">
		<img src="img/main/세잎클로버.png" class="chatbox3">
	</div>

<!-- 음식카테고리 -->
<div class="div4">

<button id="imgbtn2" @click="fnSiChange"></button>
<button id="imgbtn3" @click="fnSiChange1"></button>
<button id="imgbtn4" @click="fnSiChange2"></button>
<button id="imgbtn5" @click="fnSiChange3"></button>
<button id="imgbtn6" @click="fnSiChange4"></button>
</div>

</div>


<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html> 

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	region: ""
    	,list: []
		, siList : ${siList}
		, si : ""
		, reskind: ""
		
    }   
    , methods: {
    	
    	fnSiChange : function(){
    		var self = this;
    		self.reskind="한식";
    		var nparmap = {reskind: self.reskind};
    		$.ajax({
				url : "/main.reskind.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					
					if('${userId}' == ""){
						alert("로그인 후 이용해주세요");
						}
    	            else if($("#si").val() == ""){//선택된 지역의 값이 빈값이면 화면이 넘어가지 않음
    			        alert("주소를 먼저 선택해 주세요!");//검색버튼 있을때 필요함.
    		            }
    	            else{
    	    	        console.log(self.reskind);
				        alert("성공");
				        document.frm.action = "/main.storelist.do"; //시를 선택하고 이 값으로 페이지를 이동한다는 뜻 (4)
						document.frm.submit(); // 이동하면서 선택한 지역을 저장한다는 의미.(5)
				        }
					
					}
    		})
    		
    	}
	    ,fnSiChange1 : function(){
    		var self = this;
    		self.reskind="일식";
    		var nparmap = {reskind: self.reskind};
    		$.ajax({
				url : "/main.reskind.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					if('${userId}' == ""){
						alert("로그인 후 이용해주세요");
						}
    	            else if($("#si").val() == ""){//선택된 지역의 값이 빈값이면 화면이 넘어가지 않음
    			        alert("주소를 먼저 선택해 주세요!");//검색버튼 있을때 필요함.
    		            }
    	            else{
    	    	        console.log(self.reskind);
				        alert("성공");
				        document.frm.action = "/main.storelist.do"; //시를 선택하고 이 값으로 페이지를 이동한다는 뜻 (4)
						document.frm.submit(); // 이동하면서 선택한 지역을 저장한다는 의미.(5)1
				        }
				
					}
    		})
    		
    	}
	    ,fnSiChange2 : function(){
    		var self = this;
    		self.reskind="중식";
    		var nparmap = {reskind: self.reskind};
    		$.ajax({
				url : "/main.reskind.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					if('${userId}' == ""){
						alert("로그인 후 이용해주세요");
						}
    	            else if($("#si").val() == ""){//선택된 지역의 값이 빈값이면 화면이 넘어가지 않음
    			        alert("주소를 먼저 선택해 주세요!");//검색버튼 있을때 필요함.
    		            }
    	            else{
    	    	        console.log(self.reskind);
				        alert("성공");
				        document.frm.action = "/main.storelist.do"; //시를 선택하고 이 값으로 페이지를 이동한다는 뜻 (4)
						document.frm.submit(); // 이동하면서 선택한 지역을 저장한다는 의미.(5)
				        }
					
					}
    		})
    		
    	}
	    ,fnSiChange3 : function(){
    		var self = this;
    		self.reskind="아시아";
    		var nparmap = {reskind: self.reskind};
    		$.ajax({
				url : "/main.reskind.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					if('${userId}' == ""){
						alert("로그인 후 이용해주세요");
						}
    	            else if($("#si").val() == ""){//선택된 지역의 값이 빈값이면 화면이 넘어가지 않음
    			        alert("주소를 먼저 선택해 주세요!");//검색버튼 있을때 필요함.
    		            }
    	            else{
    	    	        console.log(self.reskind);
				        alert("성공");
				        document.frm.action = "/main.storelist.do"; //시를 선택하고 이 값으로 페이지를 이동한다는 뜻 (4)
						document.frm.submit(); // 이동하면서 선택한 지역을 저장한다는 의미.(5)
				        }
					
					}
    		})
    		
    	}
	    ,fnSiChange4 : function(){
    		var self = this;
    		self.reskind="양식";
    		var nparmap = {reskind: self.reskind};
    		$.ajax({
				url : "/main.reskind.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					if('${userId}' == ""){
						alert("로그인 후 이용해주세요");
						}
    	            else if($("#si").val() == ""){//선택된 지역의 값이 빈값이면 화면이 넘어가지 않음
    			        alert("주소를 먼저 선택해 주세요!");//검색버튼 있을때 필요함.
    		            }
    	            else{
    	    	        console.log(self.reskind);
				        alert("성공");
				        document.frm.action = "/main.storelist.do"; //시를 선택하고 이 값으로 페이지를 이동한다는 뜻 (4)
						document.frm.submit(); // 이동하면서 선택한 지역을 저장한다는 의미.(5)
				        }
					
					}
    		})
    		
    	}
    }
    , created: function () {
		//this.fnGetList();       
	}
});
</script>


