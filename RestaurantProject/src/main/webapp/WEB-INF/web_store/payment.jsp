<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>[세잎] 결제창</title>
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
/* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
.div1 {
	margin-top: 170px; /* 바깥쪽여백 */
	margin-left: 900px;
	font-size: xxx-large;
	font-weight: bolder;
	width: 500px;
	height: 50px;
}

input {
	width: 400px;
	margin-top: 0px;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 10px;
	border: solid 4px #8FBC94;
	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	text-align: center;
	font-weight: bold;
	font-size: large;
}

select {
	/* 1콤보리스트 : https://www.freecodecamp.org/korean/news/html-select-taegeu-deurobdaun-menyu-ddoneun-kombo-riseuteureul-mandeuneun-bangbeob/ */
	margin-bottom: 10px;
	margin-top: 10px;
	background: lightgray;
}

.div2 {
	margin-right: 850px;
	width: 600px;
	margin-top: 100px;
	height: 450px;
	background-color: #E0F0F0;
	border-radius: 5px;
	float: right;
	padding: 10px;
}

.div3 {
	margin-top: 10px;
	margin-right: 850px;
	width: 600px;
	height: 125px;
	background-color: #E0F0F0;
	border-radius: 5px;
	float: right;
	padding: 10px;
}

.div4 {
	margin-top: 10px;
	width: 580px;
	height: 100px;
	background-color: #E0F0F0;
	border-radius: 5px;
	float: left;
	margin-left: 350px;
	padding: 10px;
}
</style>

<body style="margin: 0px">
	<div id="app" style="width: 2483.02px; anlign: center;">
		<div class="div1">결제창</div>

		<table
			style="float: left; margin-left: 350px; width: 600px; border: 1px solid black; border-collapse: collapse; margin-top: 100px; border-radius: 5px; text-align: center;">
			<td
				style="border: 1px solid #444444; font-size: x-large; font-weight: bolder; margin-top: 5px;">
				<div style="margin-top: 5px;">
					<label style="display: inline-flex;"><pre>아  이  디 </pre></label> <input
						type="text" :placeholder='userId' readonly></input>
				</div>
				<div style="margin-top: 20px;">
					<label style="display: inline-flex;"><pre>이      름 </pre></label> <input
						type="text" :placeholder='name' readonly></input>
				</div>
				<div style="margin-top: 20px;">
					<label style="display: inline-flex;"><pre>전화번호 </pre></label> <input
						type="text" :placeholder='phoneNum' readonly></input>
				</div>
				<div style="margin-top: 20px;">
					<label style="display: inline-flex;"><pre>계좌번호 </pre></label> <input
						type="text" :placeholder='acc' readonly></input>
				</div>
				<div style="margin-top: 20px; margin-bottom: 5px">
					<label style="display: inline-flex;"><pre>결제방법 </pre></label>
					<form action="#" style="display: inline;">
						<!-- 나란히 만들기 위해서 display: inline -->
						<select
							style="width: 400px; height: 40px; font-size: large; font-weight: bold;"
							v-model="payment">
							<option value="CASH">만나서 현금 결제</option>
							<option value="account">계좌 이체</option>
							<option value="card">만나서 카드 결제</option>
						</select>
					</form>
				</div>
			</td>
		</table>

		<div class="div2">
			<div
				style="font-size: xx-large; font-weight: bolder; margin-bottom: 10px; margin-left: 30px; margin-top: 10px;">
				선택하신 메뉴</div>
			<table class="board_list">
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">가격</th>
						<th scope="col">개수</th>
					</tr>
				</thead>
				<tbody>

					<tr v-for="(item, index) in list"
						style="margin-bottom: 5px; font-size: large; font-weight: bold; margin-left: 20px;">

						<td v-if="item.sum !=0">{{item.menuname}}</td>
						<td v-if="item.sum !=0">{{item.price}}</td>
						<td v-if="item.sum !=0">{{item.sum}}</td>

					</tr>
				</tbody>
			</table>
			<!-- for문!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		</div>
		<div class="div3">
			<a href="Mypage.do"
				style="font-size: large; font-weight: bold; margin-left: 200px; color: orange;">
				메뉴를 추가하시겠습니까?</a>
			<div
				style="margin-top: 5px; font-size: large; font-weight: bold; margin-left: 100px;">
				결제 금액 : {{num}} 원</div>
			<div>
				<button @click="fnReserve"
					style="color: white; background-color: #8FBC94; margin-top: 10px; font-weight: bold; font-size: large; margin-bottom: 0px; width: 100%; border-radius: 10px; border: solid 2px #8FBC94;">
					예약 완료</button>
			</div>
			<div>
				<button onclick="history.back()"
					style="color: white; background-color: lightgray; margin-top: 5px; font-weight: bold; font-size: large; margin-bottom: 0px; width: 100%; border-radius: 10px; border: solid 2px lightgray;">
					취소</button>
			</div>
		</div>
		<div class="div4">
			<!-- 체크 안되어있으면, 결제 안됨. -->
			<input type="CHECKBOX" id="ch"
				style="width: 15px; height: 10px; border: 1px;" /> <label for="ch">이용약관,
				개인정보 수집 및 이용, 개인정보 제3자 제공 , 전자금융거래 이용약관, 만 14세 이상 이용자 내용 확인하였으며 결제에
				동의합니다.</label>
		</div>
	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "${userId}"
    	,name : "${userName}"
       	,kind : "${kind}"
       	,phoneNum : "${userPhonenum}"
        ,acc : "${userAcc}"
        ,list: ${map.list}
        ,resname: "${map.resname}"
        ,num : 0
        ,payment : ""
    }   
    , methods: {
    	//예약 완료
       fnFinish : function(){
    		var self = this;
    		self.pageChange("/Mypage.do",{});
       }
		// 화면전환 메소드
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
		,fnReserve : function() {
			var self = this;
			if(self.payment ==""){
				alert("결제 방식을 입력해주세요");
			}
			else{
			for(var i = 0; i<self.list.length; i++){
				if(self.list[i].sum !=0){
			var nparmap = {
				resnum: self.list[i].resnum
				,menuname:self.list[i].menuname
				,ordernum:0
				,orderer:self.userId
				,pickuptime:self.list[i].pickuptime
				,payment:self.payment
				,price : self.list[i].price
				,review:"N"
				,salecomple: "N"
				,menunum: self.list[i].sum
				,sum : self.list[i].sum
				,resname : self.resname
				
			};
			console.log(nparmap);
		
			if(confirm("정말 결제하시겠습니까?")){
				$.ajax({
					url : "/Res/get.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
						if (data.result == "success") {
							alert("예약성공");
							self.flg = true;
							self.pageChange("/reservemy.do", {});
						} else {
							alert("예약 실패!");
						}

					}
				})
			}	
			}
			}
		}
		}
		
    }
  
    
    		 
    , created: function () {
    	var self = this;
    	console.log(self.list);
    	for(var i =0; i<self.list.length; i++){
    		self.num += ((self.list[i].price)*(self.list[i].sum)); 
    	}
    	
    	console.log(self.resname);
	}
});
</script>