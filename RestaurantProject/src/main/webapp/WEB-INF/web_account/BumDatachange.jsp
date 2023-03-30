<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<style>
body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

.div3 {
	margin: auto;
	width: 800px;
	height: 800px;
	background-color: white;
	border-radius: 5px;
	text-align: center;
	padding: 20px;
}

.div2 {
	margin-left: 50px;
	margin-bottom: 10px;
	width: 800px;
	height: 50px;
	background-color: white;
	border-radius: 5px;
	text-align: initial;
}
.input4 {
	width: 12.4rem;
	height: 2.5rem;
	padding: 0.75rem;
	box-sizing: border-box;
	border: 1px solid #dcdcdc;
	margin: 0.1rem 0rem 0rem 0rem;
	text-align: left;
	font-size: 0.67rem;
}
</style>

<body>
	<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app" class="div3" style="margin-top: 100px">
		<div id="app" class="div2" style="background-color: white; height: 50px; font-size: 25px;">
			회원정보 수정</div>

		<div class="div2">아이디 : {{id}}</div>

		<div class="div2">
			패스워드 <input type="password" id="text1" v-model="pwd" @change="fnPwcheck" style="margin-left: 45px"></input>
		</div>
        <div v-if = "pwdtextCheck" style ="color : blue">{{pwdtext}}</div>
		<div v-else style ="color : red">{{pwdtext}}</div>
		<div class="div2">
			패스워드 확인 <input type="password" id="text1" v-model="pwd2" style="margin-left: 12px" maxlength='16' @change="fnPwSame"></input>
		</div>
		<!-- 비밀번호 일치확인 기능 -->
		<div v-if = "pwSame" id="okPwd">{{pwdtext3}}</div>
		<div v-else id="noPwd">{{pwdtext3}}</div>
		<div class="div2">이름 : {{name}}</div>
		<div class="div2">생년월일 : {{age}}</div>
		<div class="div2">
			주소 <input type="text" id="text1" v-model="address" style="margin-left: 75px" :placeholder='address'></input>
		</div>
		<div class="div2">
			닉네임 <input type="text" id="text1" v-model="nickname" style="margin-left: 60px" :placeholder='nickname'></input>
			<button @click="fnnickCheck">중복확인</button>
		</div>
		<div class="div2">
			연락처 <input type="text" id="text1" v-model="phonenum" style="margin-left: 60px" :placeholder='phonenum'  onkeypress='return checkNumber(event)' maxlength='11'></input>
		</div>
		<div class="div2">
			계좌번호 <input type="text" id="text1" v-model="account" style="margin-left: 45px" :placeholder='account'  onkeypress='return checkNumber(event)' maxlength='13'></input>
		</div>
		<div class="div2">
			사업자명 <input type="text" id="text1" v-model="restaurant" style="margin-left: 45px" :placeholder='restaurant'></input>
		</div>
		<div class="div2">
			사업자번호 <input type="text" id="text1" v-model="resnum" style="margin-left: 30px" :placeholder='resnum'  onkeypress='return checkNumber(event)' maxlength='35'></input>
			<button @click="fnresnumCheck">중복확인</button>
		</div>
		<div class="div2">
			업종
			<select style="width: 150px; height: 30px; margin-left: 75px; font-size: large; font-weight: bold;" v-model ="kind">
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="양식">양식</option>
							<option value="일식">일식</option>
							<option value="아시아">아시아</option>
							
							
			</select>
		</div>
		<div class="div2">
		지역
			        <select id="si" name="si" v-model="region" @change="fnGuList"  style="width: 150px; height: 30px; margin-left: 75px; font-size: large; font-weight: bold;">
						<option v-for="item in siList" v-bind:value="item.si" >{{item.si}}</option>
					</select>
					<select id="gu" name="gu" v-model="region1" style="width: 150px; height: 30px; font-size: large; font-weight: bold;">
						<option v-for="item in guList" v-bind:value="item.gu" >{{item.gu}}</option>
					</select>
		</div>
		<div class="div2">
			상세주소 <input type="text" id="text1" v-model="resad" :placeholder='user.resad' style="margin-left: 45px"></input>
		</div>
        <div class="div2">
			점포번호 <input type="text" id="text1" v-model="resphonenum"
				style="margin-left: 45px" :placeholder='resphonenum'  onkeypress='return checkNumber(event)' maxlength='10'></input>
		</div>

		<button @click="fnfix"
			style="width: 200px; height: 35px; margin-top: 50px; margin-bottom:100px">수정하기</button>

	</div>
	<script>
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
		}
	
	
	</script>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			id : "${userId}",
			pwd2 : "",
			pwd : "",
			name : "${userName}",
			age : "${userFrontregisnum}",
			age1 : "${userafterregisnum}",
			address : "${useraddress}",
			nickname : "${usernickname}",
			phonenum : "${userphonenum}",
			account : "${useraccount}",
			restaurant : "${resname}",
			resnum : "${resnum}",
			kind : "",
			region : "",
			region1 : "",
			resad : "",
			resphonenum : "${resphone}",
			nickcheck : false,
			pwdtext:"",
			pwdtext2:"",
			pwdtext3:"",
			pwdtextCheck:false,
			user : ${userVO},
			resad : "",
			siList : ${siList},
			guList : ${guList},
			pwSame: false

		},
		methods : {
			fnnickCheck : function() {
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
						if(self.nickname == "${usernickname}"){
							alert("변경할 닉네임을 입력해주세요.");
						}
						else if (data.num > 0) {
							alert("중복된 닉네임 입니다.");
						}
						
						else {
							alert("사용하실수 있는 닉네임입니다.");
							self.nickcheck = true;
						} 
					}
				})
			}
		    ,fnGuList : function(){
	    		var self = this;
	            var nparmap = {si : self.region};
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
	
			
			,fnresnumCheck : function() {
				var self = this;
				var nparmap = {
					resnum : self.resnum
				};
				console.log(nparmap);
				$.ajax({
					url : "/join/resnumcheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						//self.list = data.list;
						if(self.resnum == "${resnum}"){
							alert("변경할 사업자 번호를 입력해주세요.");
						}
						
						else if (data.num > 0) {
							alert("이미 등록된 사업자번호입니다.");
						} else {
							alert("사용하실수 있는 사업자번호 입니다.");
							self.resnumcheck = true;
						}
					}
				})

			},//사업자번호 중복확인
			
			fnPwcheck : function() {
				var self = this;
				var nparmap = {
					pwd : self.pwd,
					pwd2 : self.pwd2
				};
				var pattern1 = /[0-9]/;
				var pattern2 = /[a-zA-Z]/;
				var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가&제거 가능
				 
				if (!pattern1.test(self.pwd)
						|| !pattern2.test(self.pwd)
						|| !pattern3.test(self.pwd)
						|| self.pwd.length<8||self.pwd.length>16) {
					self.pwdtext = "❗ 영문, 숫자, 특수기호를 모두 사용하여, 8자리 이상 16자리이하로 구성하세요. \n❗❗ 사용가능한 특수 문자 : ~!@\#$%<>^&* ";
					self.pwdtext2 =	"❗❗ 사용가능한 특수 문자 : ~!@\#$%<>^&* ";
					self.pwd = "";
					self.pwdtextCheck = false;
				} else {
					self.pwdtext = "올바른 비밀번호 형태입니다.";
					
					self.pwdtextCheck = true;
				}
			
			}
			//패스워드 형식 체크1
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
			
			,fnfix : function() {

				var self = this;
				var nparmap = {

					id : self.id,
					pwd : self.pwd,
					pwd2 : self.pwd2,
					address : self.address,
					nickname : self.nickname,
					phonenum : self.phonenum,
					account : self.account,
					restaurant : self.restaurant,
					resnum : self.resnum,
					kind : self.kind,
					region : self.region,
					region1 : self.region1,
					resad : self.resad,
					resphonenum : self.resphonenum

				};

				if (self.pwd != self.pwd2) {
					alert("비밀번호가 일치하지 않습니다.");
				} else if (self.pwd == "" || self.pwd2 == ""
						|| self.address == "" || self.account == ""
						|| self.nickname == "" || self.phonenum == ""
						|| self.restaurant == "" || self.resnum == ""
						|| self.kind == "" || self.region == ""
						|| self.resad == "" || self.resphonenum == "") {
					alert("빈칸을 확인해주세요");
				} else if (!self.nickcheck && self.nickname != self.user.nickname) {
					alert("닉네임 중복확인을 해주세요");
				} else if (!self.resnumcheck && self.resnum != self.user.resnum) {
					alert("사업자번호 중복확인을 해주세요");
				}else {
					if(confirm("정말로 지금 정보로 수정하시겠습니까?")){
					console.log(nparmap);
					$.ajax({
						url : "/datachange.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {

							alert("정보 수정 성공! 다시 로그인해주세요");
							self.pageChange("/login.do", {});

						}
					})
				}
				}
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
</script>