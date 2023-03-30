<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<title>login</title>
</head>

<style>
* {
	box-sizing: border-box;
}

.div0 {
	width: 30%;
	border: 10px solid #99dd81;
	margin-top: 50px;
	margin-right: 500px;
	border-radius: 15px;
	padding: 50px;
}

<!--
임시-->.tempbtn {
	width: 500px;
	height: 500px;
	border: 10px solid green;
}

.label1 {
	width: 180px;
	height: 100px;
	font-size: 3em;
	text-align: center;
	padding: 10px;
	margin-right: 400px;
	margin-top: 1px;
	font-weight: bold;
	margin-bottom: -50px;
}

.div2 {
	width: 500px;
	height: 280px;
	padding: 40px;
	margin-top: 0px;
	font-family: Fantasy;
	border: 2px solid #dcdcdc;
}

.span {
	margin: 0px 5px 0px 5px;
}

.loginfooter {
	width: 500px;
	font-size: 10px;
	text-align: center;
	margin-top: 100px;
	padding: 5px;
	margin-right: 500px;
}

.btn1 {
	margin: 5px 10px 10px 10px;
	width: 100px;
	text-align: center;
}

.btn2 {
	margin: 20px 0px 5px 0px;
	font-size: 18px;
	font-weight: bold;
	width: 300px;
	height: 35px;
	text-align: center;
	background-color: #99dd81;
	color: white;
	border: none;
	border-radius: 10px;
	letter-spacing: 4px;
}
.btn2:hover {
	color: black;
}

.btn_icon {
	/* background: url(/images/pc/ico_comm.png) */
	background-size: 300px auto;
}

.afind {
	text-decoration: none;
	font-size: 12px;
	margin-right: 20px;
	color:gray;
}

.asign {
	text-decoration: none;
	margin-right: 70px;
	margin-left: 35px;
	font-size: 12px;
	color:gray;
}
.asign1 {
	text-decoration: none;
	color:black;
}
.asign1:hover {
border-bottom:0.1rem solid;
}
.afind:hover {
	font-weight:bold;
}
.asign:hover {
	font-weight:bold;
}

input {
	width: 200px;
	height: 50px;
	margin: 3px;
	border: solid #ccc;
	border-width: 0 0 2px;
	padding-right: 90px;
}

#image {
	margin-top: 20px;
}

.slideshow-container {
	max-width: 500px;
	max-height: 90px;
	position: absolute;
	left: 50%;
    transform: translate(-44%, -80%);
	margin: auto;
	margin-top:5rem;
}
.slideshow-container2 {
	max-width: 31.25rem;
	max-height: 5.6rem;
	position: absolute;
	left: 60.3rem;
    transform: translate(-44%, -80%);
	margin: auto;
	margin-top:5rem;
}
.mySlides {
  display: none;
}

</style>

<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<!-- 타이틀 -->
	<div id="app" style="width: 2483.02px; padding-top: 120px;"
		align="center">
		<div class="div0">
			<label class="label1"> 로그인 </label>
			<!-- 전체 div -->
			<div class="div2">
				<div style="display: inline-block;">
					<label for="id" style="font-weight: bolder; font-size: x-large; margin-right: 50px;"> ID </label>
					<input id="id" type="text" name="loginKey" placeholder="아이디" v-model="id" v-on:keyup.enter="fnLogin">
				</div>
				<div>
					<label for="pw"	style="font-weight: bolder; font-size: x-large; margin-right: 40px; letter-spacing: -1px;">PW</label> 
					<input id="pw" type="password" name="password" placeholder="비밀번호" v-model="pwd" v-on:keyup.enter="fnLogin">
				</div>
				<div>
					<button class="login > btn2" @click="fnLogin">로그인</button>
				</div>
				<!-- 아랫 div -->
				<div style="margin-top:25px">
					<a href="http://127.0.0.1:8080/join.do" class="asign">회원가입</a> 
					<a href="http://127.0.0.1:8080/searchid.do" class="afind">아이디 찾기</a>
					<a href="http://127.0.0.1:8080/searchpw.do" class="afind">비밀번호 찾기</a>
				</div>
			</div>
		</div>
					<!-- 슬라이드 -->
				<div  class="slideshow-container2" style="z-index: 100;">
					<div class="mySlides">
					  <img src="img/design/naver.jpg" onclick="javascript:location.href='http://naver.com'" style="width:500px; height:90px">
					  <div class="text"></div>
					</div>
					
					<div class="mySlides">
					  <img src="img/design/daum.PNG" onclick="javascript:location.href='http://daum.net'" style="width:500px; height:90px">
					  <div class="text"></div>
					</div>
					
					<div class="mySlides">
					  <img src="img/design/nate.PNG" onclick="javascript:location.href='http://nate.com'" style="width:500px; height:90px">
					  <div class="text"></div>
					</div>
				</div>
				
		<!-- 로그인 footer -->
		<div class="loginfooter">
			<span class="span">이용약관</span> <span class="span">개인정보 처리방침</span> 
			<span class="span">운영정책</span> <span class="span">고객센터</span> 
			<span class="span"><a href="http://127.0.0.1:8080/main.board.do" class="asign1">공지사항</a></span>
			<div style="display: inline-block">
				<img src="img/main/newlogo.png" width="30px" height="30px" style="float: left; display: flex; margin-right: 5px;">
				<h4 style="float: right; display: flex; font-size:0.5rem;">Copyright © Safed Corp. All rights reserved.</h4>
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
			id : "",
			pwd : "",
			name : ""
		},
		methods : {
			fnLogin : function() {
				var self = this;
				var nparmap = {
					id : self.id,
					pwd : self.pwd
				};

				$.ajax({
					url : "/login.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert(data.user.name + "님 로그인 성공!!");
							self.pageChange("/main.do", {});
						} else {
							alert("로그인 실패!!");
						}
					}
				});
			},
			pageChange : function(url, param) {
				var target = "_self";
				if (param == undefined) {
					//   this.linkCall(url);
					return;
				}
				var form = document.createElement("form");
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
				for ( var name in param) {
					var item = name;
					var val = "";
					if (param[name] instanceof Object) {
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

		}
	});
	
	// 이미지 슬라이드 쇼를 위해 필요
	var slideIndex = 0; //slide index
	//HTML 로드가 끝난 후 동작
	window.onload = function() {
		showSlides(slideIndex);
		// Auto Move Slide
		var sec = 3000;
		setInterval(function() {
			slideIndex++;
			showSlides(slideIndex);
		}, sec);
	}

	function currentSlide(n) {
		slideIndex = n;
		showSlides(slideIndex);
	}

	function showSlides(n) {
		var slides = document.getElementsByClassName("mySlides");
		var size = slides.length;
		if ((n + 1) > size) {
			slideIndex = 0;
			n = 0;
		} else if (n < 0) {
			slideIndex = (size - 1);
			n = (size - 1);
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slides[n].style.display = "block";
	}
</script>