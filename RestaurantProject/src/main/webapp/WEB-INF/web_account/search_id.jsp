<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
  <jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<style>
.input1{
  width:17.3rem;
  height: 3.2rem;
  margin: 1.2rem 0.3rem 0.3rem 1.2rem ;
  border: solid #ccc;
  border-width: 0 0 0.18rem;
  padding-right: 90px;
}
.input2{
  width:7.5rem;
  height: 3.2rem;
  margin: 1.2rem 0.3rem 0.3rem 0.3rem ;
  border: solid #ccc;
  border-width: 0 0 0.18rem;
}
.title{
  font-size: 30px;
  text-align: center;
}
.btn1{
  font-size: 16px;
  width: 100px;
  height: 35px;
  text-align: center;
  color: white;
  background: green;
  border:none;
}
.btn2{
  font-size: 16px;
  width: 100px;
  height: 35px;
  text-align: center;
  color: white;
  background: gray;
  border:none;
}
.btn3{
  margin: 15px 0px 5px 50px;
  font-size: 16px;
  width: 300px;
  height: 35px;
  text-align: center;
  color: white;
  background: green;
  border:none;
}
.btn2:hover{
	color:black;
}
.btn3:hover{
	color:black;
}
.div2{
  width: 500px;
  height: 700px;
  padding: 40px;
  margin: auto;
  margin-top:100px;
  
}
.div1{
  position: relative;
  border: 1px solid black;
  box-sizing: border-box;
  width: 500px;
  height: 400px;
  border: 2px solid gray;
  padding: 40px;
  margin: auto;
  font-family: Fantasy;
}
.text1{
  margin: auto;
  font-family: Fantasy;
   text-align: center;
   font-size: 20px;
}
.text2{
  margin: 5px;
  padding: 3px;
  font-family: Fantasy;
   font-size: 12px;
   text-align: center;
}
.text3{
  margin-right: 25px;
}
.text4{
  margin-right: 10px;
}

.text5{
    text-align: center;
	margin-top:15px;
}
.text5:hover{
	font-weight:bold;
}
.foot{
  font-size: 10px;
  text-align: center;
  margin: 20px;
  padding: 5px;
}
</style>

<body>
  <div class="div2" id="app" >
	<div class="title">
  		<h3>아이디 찾기</h3>
	</div>
    <div>
        <button class="btn1"ID>아이디</button>
        <button class="btn2"PW  onClick="location.href='http://localhost:8080/searchpw.do'">비밀번호</button>
    </div>
	<div class="div1">
  		<div class="text1">아이디가 생각나지 않으세요?</div>
        <div class="text2">아이디 생성시, 등록하신 정보를 입력해 주세요.</div>
        <div class="text2">회원 정보에 등록한 정보와 일치해야, 아이디를 찾을 수 있습니다.</div>
        <div>
            <span class="text3">이름</span>
    		<input class="input1" type="text" maxlength='7' placeholder="이름" v-model="name" v-on:keyup.enter="fnSearchid">
  		</div>
  		<div>
            <span class="text4">주민번호</span>
    		<input class="input2" type="text" placeholder="6자리" maxlength='6' v-model="frontregisnum" v-on:keyup.enter="fnSearchid"> ㅡ
    		<input class="input2" type="password" placeholde="" maxlength='7' v-model="afterregisnum" v-on:keyup.enter="fnSearchid">
  		</div>
  		<div>
     		<button class="btn3" @click="fnSearchid">아이디 찾기</button>
  		</div>
	</div>
    <div class="text5"><a href="http://localhost:8080/login.do">로그인</a></div>
	<div class="foot">
		<a href="http://127.0.0.1:8080/main.do" class="asign">
  		<span class="span">이용약관</span>
  		<span class="span">개인정보 처리방침</span>
  		<span class="span">운영정책</span>
  		<span class="span">고객센터</span>
  		<span class="span">공지사항</span>
  		</a>
  		<div style="display: inline-block">
				<img src="img/main/newlogo.png" width="30px" height="30px"
					style="float: left; display: flex; margin-right: 5px;">
				<h4 style="float: right; display: flex;">Copyright © Safed Corp.	All rights reserved.</h4>
		</div>             
	</div>   
    </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id:""
    	,name: ""
    	,frontregisnum:""
    	,afterregisnum:""

    }
    , methods: {
    	fnSearchid : function(){
            var self = this;
            var nparmap = {id: self.id,
            				name: self.name, 
            				frontregisnum: self.frontregisnum, 
            				afterregisnum: self.afterregisnum}; 
          					
            
           
            $.ajax({
                url:"/searchid.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
               
                success : function(data) {
                	self.list = data.list;
                	console.log(nparmap);
                	console.log(data.list);
                	if(data.result == "success"){
                		alert(data.list[0].name + "님의 아이디는: " + data.list[0].id);
                		self.id = data.list[0].id;
                		window.open("http://127.0.0.1:8080/login.do");  
                        
                	} else {
                		alert("일치하는 정보가 없습니다.");
                	}
                }
            }); 
        }
    }
    , created: function () {
        
	}
});
    
</script>