<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>[세잎] 업체군 리스트</title>

</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
.img{
  width:3rem;
  height:3rem;
  position:absolute;
  top:11.08rem;
  left:46.5rem;
  border:0.06rem solid;
  border-radius:0.33rem;
}
/* 지역선택라인 */
.div2{
width: 120rem; 
  height:15rem;
  margin:auto;
  margin-top:5rem;
  background-image:url(https://img.freepik.com/premium-photo/long-horizontal-banner-with-three-simple-donuts-on-blue-background-colorful-donuts-with-copy-space-i_158001-1380.jpg);
}
#gu{
width:20rem;
height:3rem;
text-align:center;
margin:auto;
margin-top:6rem;
}
#gu:hover{
border:0.15rem solid ;
}

.div0 {/* 검색라인 */
	width:120rem;
	height:4rem;
	margin:auto;
 	 border-bottom:0.15rem solid #dcdcdc;
}
#span1{
margin-left: 60rem;
}
/* 추천순 */
#btnList1 {
	color: white;
	font-weight: bold;
	width: 5rem;
	height: 3rem;
	margin-right:5rem;
	background-color: #8FBC94;
	font-size: large;
  border:1px solid;
}
/* 재고순 */
#btnList2 {
	color: white;
	font-weight: bold;
	width: 5rem;
	height: 3rem;
	background-color: #8FBC94;
	font-size: large;
  border:1px solid;
}
input {
	width: 25rem;
	height: 3.2rem;
	margin-left:19rem;
	margin-top:0.2rem;
	box-sizing: border-box;
	border: solid 0.14rem #dcdcdc;
}

#btnList1:hover{
background: #dcdcdc;
}
#btnList2:hover{
background: #dcdcdc;
}
#btn { /* 검색버튼 */
	background-color: #8FBC94;
	font-weight: bold;
	width: 5rem;
	height: 3.1rem;
	border: none;
	font-size: large;
	color: white;
}
#btn:hover{
background: #dcdcdc;
}


/*  음식점출력라인*/
.div3{
margin:auto;
width: 120rem; 
height:100%;
}

/*td 메인프레임  */
.div4{
background-color: white; 
display: flex; 
text-align: center; 
margin:auto;
margin-bottom:1rem;
margin-top:1rem;
width: 60rem; 
height: 7rem;
  border:0.15rem solid #dcdcdc;
}
.div4:hover{
border: 0.15rem solid;
}

#img1{
width:12rem;
height:6.7rem;
vertical-align:middle;
margin:auto;
margin-left: 2rem;
}

/*td 가게명 설명  */
.div5{
width:45rem;
font-size: large; 
font-weight: bold; 
text-align:left;
color: black; 
}

.div6{
margin:auto;
margin-top:0.3rem;
}
</style>

<body>

	<!-- 메인 프레임 -->
	<div id="app" style="width: 2483.02pxl" align="center">
	
		<!-- 지역선택 라인 -->
		<div class="div2">
			<img src="https://cdn-icons-gif.flaticon.com/6844/6844326.gif" class="img">
			<select id="gu" name="gu" v-model="gu" @click="fnGet">
				<option value="" >고객님의 지역을 선택해주세요</option>
				<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
			</select>
		</div>
		
		<!-- 검색라인 -->
	 	<div class="div0">
	 		<button @click="fnResarray" id="btnList1">추천순</button>
			
   			 	<input class="input1" type="text" placeholder="가게명을 검색해주세요." v-model="resname1" />
    	 		<button id="btn" @click="fnSearch" >검색</button>
  		</div>
  		
		<!-- [기본 ] 음식점 출력!! -->
			<!-- DB연결 후, 아래 링크 확인하고, 연동하기 -->
			<!-- https://velog.io/@dldldl1022/Spring%EA%B3%BC-vue%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EC%9E%A5%EC%86%8C-%EB%AA%A9%EB%A1%9D-%EC%B6%9C%EB%A0%A5%ED%95%98%EA%B8%B0 -->
			<div class="div3">
				<table>
				<!--  당분간은 주석해두기. 딱히 필요없어 보여서
					<colgroup>
						<col width="50%" />
					</colgroup>
				-->
					<tbody>
						<tr v-for="(item, index) in list">
							<!-- 왼쪽라인 td -->
							<td> 
										<!-- 링크 확인!!!!!!!!!!!! -->
										<div class="div4" @click="fnView(item)">
											<img id="img1" src="img/main/point.PNG" > 
											<div class="div5">
												<div class="div6">
													상호명 _ {{item.resname}} 
												</div>
												<div class="div6">
													평점 _ ⭐{{item.grade}}점 
												<div class="div6">
													주소 _ {{item.resadd}}
												</div>
												</div>
											</div>
										</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>

</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	list:[],
    	searchList : [],
    	resname: "",
    	grade: "",
    	resadd: "",
    	resname1 : "",
    	tempGrade : "",
    	si : "${si}",
    	guList : ${guList},
    	reskind : "${reskind}",
    	gu : "",
    	flg: ""
    	
    }   
    , methods: {
    	// 기본 화면 출력 이벤트 (식당 출력)
       	fnGet : function(){
            var self = this;
            if(self.gu == ""){
            	self.flg = "1=1";
            	
            }
            else if(self.gu != ""){
            	self.flg = "";
            }
           
            var nparmap = {si : self.si, reskind:self.reskind, gu : self.gu, flg:self.flg}; 
            $.ajax({
                url:"/main.storelist/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {/* 데이터가 제대로 넘어오면, success실행됨 */   
                	self.list = data.list;
   	            	if(self.list.length > 0){
   	            		self.tempGrade = self.list[0].grade;
   	            	}
   	            	console.log(self.list)
                }
           });
    	},
    	
 	// 가게명 검색 이벤트 (식당 출력)
   	fnSearch : function(){
        var self = this;
        if(self.gu == ""){
        	self.flg = "1=1";
        	
        }
        else if(self.gu != ""){
        	self.flg = "";
        }
       
        var nparmap = {si : self.si , resname1:self.resname1 , reskind:self.reskind ,gu: self.gu, flg: self.flg}; //다음 페이지로 넘어갈때 필요한 변수만 적어주기. 
        $.ajax({
            url:"/main.storelist/slist.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {       
            	self.list = data.list;
            		
	            	  
            	
            }
       });
	}
    	,fnGuList : function(){
    		var self = this;
            var nparmap = {si : self.si};
            $.ajax({
                url:"/gu/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.guList = data.guList;
	                
	                self.gu = "";
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
 	, fnView : function(item){
		var self = this;
		self.pageChange("/join3.do", {resnum : item.resnum, idx : item.idx}); //테스트 resnum(pk)로 찾아야 이름으로 중복된 식당충돌을 줄일 수 있음.
		/*self.pageChange("/Mypage.do", {resnum : item.resnum, idx : item.idx});*///원래꺼 resnum(pk)로 찾아야 이름으로 중복된 식당충돌을 줄일 수 있음.
	}
 	, fnResarray: function(item){
		var self = this;
		self.pageChange("/main.resarray.do", {resnum : item.resnum, idx : item.idx}); //테스트 resnum(pk)로 찾아야 이름으로 중복된 식당충돌을 줄일 수 있음.
		/*self.pageChange("/Mypage.do", {resnum : item.resnum, idx : item.idx});*///원래꺼 resnum(pk)로 찾아야 이름으로 중복된 식당충돌을 줄일 수 있음.
	}
    }
    , created: function () {
		var self = this;
    	this.fnGet();
		self.fnGuList();
		 
	}
});
</script>