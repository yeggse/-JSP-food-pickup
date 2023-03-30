<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>테스트</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

*{
	font-family: 'Noto Sans KR', sans-serif;
}
body{
	background-color: #f9f9f9;

}
.main{
	margin: auto;
	margin-top: 0.33rem;
	margin-bottom: 17.5rem;
	padding: 1.25rem;
	width: 25rem;
	height: 80rem;
	border-radius: 0.33rem;
	text-align: center;
	background-color: #f9f9f9;
	
}

.div1{
	width: 30rem;
	height: 1.5rem;
	text-align: initial;
	font-size: 1rem;
	border-radius: 0rem;
	margin:auto;
	margin-bottom: 3.5rem;
	background-color: #f9f9f9;
	

	display: inline-box;
}

.input1 {
	width: 25rem;
	height: 2.5rem;
	padding: 0.75rem;
	box-sizing: border-box;
	border: 1px solid #dcdcdc;
	margin-top:: 0.1rem 0rem 0rem 0rem;
	text-align: left;
}
.input2 {
	width: 20rem;
	height: 2.5rem;
	padding: 0.75rem;
	box-sizing: border-box;
	border: 1px solid #dcdcdc;
	margin: 0.1rem 0rem 0rem 0rem;
	text-align: left;
}
.input3 {
	width: 9.6rem;
	height: 2.5rem;
	padding: 0.75rem;
	box-sizing: border-box;
	border: 1px solid #dcdcdc;
	margin: 0.1rem 0rem 0rem 0rem;
	text-align: left;
}

.input4 {
	width: 12.4rem;
	height: 2.5rem;
	padding: 0.66rem;
	box-sizing: border-box;
	border: 1px solid #dcdcdc;
	margin: 0.1rem 0rem 0rem 0rem;
	text-align: left;
}

.btn1 {
	background-color: #1BBC9B;
	color: white;
	border: none;
	width: 4.8rem; 
	height: 2.5rem;
}
.btn2 {
	background-color: #1BBC9B;
	color: white;
	border: none;
	width: 25rem; 
	height: 3rem;
}
.btn1:hover {
	color:black;
}
.btn2:hover {
	color:black;
}

#href1 {
	text-decoration: none;
	color: #9B9B9B;
	font-size: 1rem;
	margin: 0rem 3.5rem 0rem 1rem;
}
#href2 {
	text-decoration: none;
	color: #62F903;
	font-size: 1.2rem;
	margin: 0rem 1rem 0rem 2.5rem;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}
#href1:hover {
	color:black;
}
#href2:hover {
	color:#62a903;
}

#basicSign{
	margin:auto;
	margin-top: 6.5rem; 
	
	width:30rem;
	height: 3rem; 
	background-color: #f9f9f9;	
	font-weight: bolder; 
	font-size: 2rem; 
	text-align: center;
}

#okPwd{
	color : blue;
	font-size: 0.76rem; 
	text-align: left; 
	margin: 0rem 0rem 0rem 0rem;
}
#noPwd{
	color : red;
	font-size: 0.76rem; 
	text-align: left; 
	margin: 0rem 0rem 0rem 0rem;
}

</style>
</head>



<body>

	<div id="basicSign"> 
		일반 회원가입 
		<a id="href2" href="join2.do" > 사업자회원가입 </a> 
	</div>
	
	<!-- 메인프레임 -->
	<div id="app" class="main">
		
		<!-- 아이디 -->	
		<div class="div1">
			아이디
			<div>
				<input type="text"  class="input2" v-model="id" @change="idcheck1"></input>
				<button @click="fnCheck" class="btn1">중복확인</button>
			</div>
		</div>
		
		<!-- 비밀번호 -->	
		<div class="div1">
			비밀번호 
			<div>
				<input type="password" class="input1" v-model="pwd" @change="fnPwcheck" ></input>
			</div>
		</div>
		
		<!-- 비밀번호 기능 -->
		<div v-if = "pwdtextCheck" id="okPwd">{{pwdtext}}</div>
		<div v-else id="noPwd">{{pwdtext}}</div>
		
		<!-- 비밀번호 확인 -->
		<div class="div1">
			비밀번호 확인 
			<div>
				<input type="password" class="input1" v-model="pwd2" maxlength='16' @change="fnPwSame"></input>
			</div>
		</div>
		

	<!-- 비밀번호 일치확인 기능 -->
		<div v-if = "pwSame" id="okPwd">{{pwdtext3}}</div>
		<div v-else id="noPwd">{{pwdtext3}}</div>


		<!-- 이름 -->
		<div class="div1">
			이름 
			<div>
				<input type="text" class="input1" v-model="name" ></input>
			</div>
		</div>
		
		<!-- 주민번호 -->
		<div class="div1">
			주민번호 
			<div>
				<input type="text" class="input3" v-model="age" onkeypress='return checkNumber(event)' maxlength='6'></input>
				- <input type="password" class="input3" v-model="age1" onkeypress='return checkNumber(event)' maxlength='7'></input>
				<button @click="fnPeople" class="btn1">실명인증</button>
			</div>
		</div>
		
		<!-- 주소 -->
		<div class="div1">
			주소
	       	<div>
		       	<select id="si" name="si" v-model="address" class="input4" @change="fnGuList">
					<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
				</select>
				<select id="gu" name="gu" v-model="address1" class="input4">
					<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
				</select>
	       	</div>
		</div>
		
		<!-- 닉네임 -->
		<div class="div1">
			닉네임 
			<div>
				<input type="text" class="input2"  v-model="nickname" maxlength='10' @change="nickcheck1" ></input>
				<button @click="fnnickCheck" class="btn1">중복확인</button>
			</div>
		</div>
		
		<!-- 연락처 -->
		<div class="div1">
			연락처 
			<div>
				<input type="text" class="input1" v-model="num" placeholder="-빼고 핸드폰번호 11자리를 입력해주세요" onkeypress='return checkNumber(event)' maxlength='11'></input>
			</div>
		</div>
		
		<!-- 계좌번호 -->
		<div class="div1">
			계좌번호 
			<div>
				<input type="text" class="input1" v-model="account" placeholder="-빼고 계좌번호 13자리를 입력해주세요" onkeypress='return checkNumber(event)' maxlength='13'></input>
			</div>
		</div>
		
		<!-- 회원가입 버튼 -->
		<div class="div1">
			<button @click="fnjoin" class="btn2">회원가입</button>
		</div>

		
		<!-- 로그인 페이지 href -->
		<div class="div1">
			<a href="login.do" id="href1">로그인 페이지로 이동</a>
		</div>
		
	</div>
	<script>
	function checkNumber(event) {
		  if(event.key === '.' 
		     || event.key === '-'
		     || event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
		}
	
	
	</script>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>

<script type="text/javascript">
	var app = new Vue(
			{
				el : '#app',
				data : {
					id : "",
					pwd : "",
					pwd2 : "",
					name : "",
					age : "",
					age1 : "",
					address : "",
					address1 : "",
					account : "",
					nickname : "",
					num : "",
					idcheck : false,
					agecheck : false,
					nickcheck : false,
					flg : false,
					pwSame : false,
					pwdtext: "",
					pwdtext2: "",
					pwdtext3: "",
					pwdtextCheck:false
					,people : false
					,siList : ${siList}
					,guList : ${guList}
				},
				methods : {
					//아이디 중복확인
					fnCheck : function() {
						var self = this;
						var pattern1 = /[0-9]/;
						var pattern2 = /[a-zA-Z]/;
						var nparmap = {id : self.id};
						console.log(nparmap);
						$.ajax({
							url : "/join/check.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								//self.list = data.list;
								if(!pattern1.test(self.id)||!pattern2.test(self.id)||self.id.length<3||self.id.length>13){
									alert("영문, 숫자만을 활용한 3~13자리 ID를 입력해 주세요");
									self.id = ""
								} else{
									if (data.num > 0) {
										alert("중복된 ID가 존재합니다");
									} else {
										alert("사용하실수 있는 아이디입니다.");
										self.idcheck = true;
									}
								}
							}
						})

					}
					,fnGuList : function(){
			    		var self = this;
			            var nparmap = {si : self.address};
			            $.ajax({
			                url:"/gu/list.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) {                                       
				                self.guList = data.guList;
				                console.log(data.guList);
				                self.gu = "";
			                }
			            }); 
			        }
					//닉네임 중복확인
					,fnnickCheck : function() {
						var self = this;
						var nparmap = {
							nickname : self.nickname
						};
						console.log(nparmap);
						$.ajax({
							url : "/join/nickcheck.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								//self.list = data.list;
								if (data.num > 0) {
									alert("중복되었습니다");
								} else {
									alert("사용하실수 있는 닉네임입니다.");
									self.nickcheck = true;
								}
							}
						})

					}
					// 회원가입
					, idcheck1 : function(){
						var self = this;
						self.idcheck = false;
						console.log("테스트");
					}
					, nickcheck1 : function(){
						var self = this;
						self.nickcheck = false;
						
					}
					, fnjoin : function() {
						var self = this;
						var nparmap = {
							id : self.id,
							pwd : self.pwd,
							kind : "A",
							phonenum : self.num,
							acc : self.account,
							name : self.name,
							address : self.address,
							address1 : self.address1,
							frontregisnum : self.age,
							afterregisnum : self.age1,
							nickname : self.nickname,
							resname : "",
							resnum : 0,
							reskind : "",
							region : "",
							region1 : "",
							resad : "",
							resphone : "",
							
						};
						console.log(nparmap);
						if (self.id == "" || self.pwd == ""	|| self.pwd2 == "" || self.name == ""
								|| self.age == "" || self.age1 == "" || self.address == "" || self.account == ""
								|| self.nickname == "" || self.num == "") {
							alert("빈칸을 확인해주세요");
						} else if (!self.pwSame) {
							alert("비밀번호 일치여부를 확인해 주세요.");
						} else if(!self.idcheck){
							alert("아이디 중복확인을 해주세요");
						} else if(!self.nickcheck){
							alert("닉네임 중복확인을 해주세요");
						} else if(!self.people){
							alert("실명인증을 해 주세요");
						} else {
							$.ajax({
								url : "/join/get.dox",
								dataType : "json",
								type : "POST",
								data : nparmap,
								success : function(data) {
									self.list = data.list;
									if (data.result == "success") {
										alert("회원가입 성공!");
										self.flg = true;
										self.pageChange("/login.do", {});
									} else {
										alert("회원가입 실패!");
									}
								}
							});
						}

					},
					//비밀번호 양식 확인
					fnPwcheck : function() {
						var self = this;
						var nparmap = {pwd : self.pwd, pwd2 : self.pwd2};
						var pattern1 = /[0-9]/;
						var pattern2 = /[a-zA-Z]/;
						var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가&제거 가능
						if (!pattern1.test(self.pwd)
							|| !pattern2.test(self.pwd)
							|| !pattern3.test(self.pwd)
							|| self.pwd.length<8||self.pwd.length>16) {
							self.pwdtext = "❗ 영문, 숫자, 특수기호를 모두 사용하여, 8자리 이상 16자리 이하로 구성하세요.";
							self.pwdtext2 =	"❗❗ 사용가능한 특수 문자 : ~!@\#$%<>^&* ";
							self.pwd = "";
							self.pwdtextCheck = false;
						} else {
							self.pwdtext = "올바른 비밀번호 형태입니다.";	
							self.pwdtextCheck = true;
						}
					}
					
					// 비밀번호 일치 확인
					, fnPwSame : function(){
						var self = this;
						var nparmap = {pwd : self.pwd, pwd2 : self.pwd2};
						if (self.pwd != self.pwd2) {
							self.pwdtext3 = "❗ 비밀번호가 일치하지 않습니다.";
							self.pwSame = false;
						} else{
							self.pwdtext3 = "비밀번호가 일치합니다";	
							self.pwSame = true;
						}
					}
					// 실명인증
					, fnPeople : function(){
						var self = this;
						var nparmap = {age : self.age, age1 : self.age1};
						if(self.age.length == 6 && self.age1.length == 7){
							alert("실명인증이 확인되었습니다.");
							self.people = true;
						} 
						else{
							alert("정말로 전부 입력하셨나요?");
						}
						
					}
					, pageChange : function(url, param) {
				        var target = "_self";
				        if(param == undefined){
				        //   this.linkCall(url);
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
					console.log(self.siList);

				}
			});
</script>
