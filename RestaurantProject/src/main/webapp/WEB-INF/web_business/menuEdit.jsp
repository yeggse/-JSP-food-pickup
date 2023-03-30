<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  	<link rel="stylesheet" href="css/detail/MenuDetail.css">
  <title>메뉴 수정</title>
  <jsp:include page="/layout/header.jsp"></jsp:include>
</head>

<style>
	
		.contain {max-width:1024px; margin:30px auto; margin-top: 120px;}
  	    input {
            width: 50%;
            height: 13%	;
            margin-top: 0px;
	        padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
         } 
	      #btn{
		       background-color: #8FBC94;
		       width: 120px;
		       height: 50px;
		       border-radius: 10px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       font-weight: bolder;
		       color: white;
		       padding: 0px;
	       }
		h1{font-size: 1em;}
		h2{font-size: 2em;}

</style>

<body>
<div>
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app" style="height: 900px;">
		<div class="contain">
				<h2>메뉴 수정하기✒✒</h2>
			<table class="board_detail" style="margin-top: 20px;">
				<colgroup>
					<col width="10%"/>
					<col width="20%"/>
					<col width="10%"/>
					<col width="20%"/>
				</colgroup>
				<tr style="border-bottom:2px solid #ccc;">
					<td style="text-align : center; width: 15%;" ><h1>음식명 {{resnum}}</h1></td>
					<td><input type="text" id="title" name="menuname" v-model="menuname" style="font-size: 1.3em; font-weight: 600;"></td>
					<td style="text-align : center; width: 15%;" ><h1>가격</h1></td>
					<td><input type="text" id="title" name="price" v-model="price" style="font-size: 1.3em; font-weight: 600;"></td>
				</tr>
				<tr style="border-bottom:2px solid #ccc;">
					<td style="text-align : center; width: 15%;" ><h1>재고 {{userId}}</h1></td>
					<td><input type="text" id="title" name="supply" v-model="supply" style="font-size: 1.3em; font-weight: 600;"></td>
					<td style="text-align : center; width: 15%;" ><h1>픽업 시간</h1></td>
					<td>
						<form action="#" style="float: left; display: contents;">
							<select style="width: 410px; height: 50px; font-size: 
								large; font-weight: bold; text-align: center;" v-model="pickuptime">
								<option value="1시">1시</option>
								<option value="2시">2시</option>
								<option value="3시">3시</option>
								<option value="4시">4시</option>
								<option value="5시">5시</option>
								<option value="6시">6시</option>
								<option value="7시">7시</option>
								<option value="8시">8시</option>
								<option value="9시">9시</option>
								<option value="10시">10시</option>
								<option value="11시">11시</option>
								<option value="12시">12시</option>							
								<option value="13시">13시</option>
								<option value="14시">14시</option>
								<option value="15시">15시</option>
								<option value="16시">16시</option>
								<option value="17시">17시</option>
								<option value="18시">18시</option>			
								<option value="19시">19시</option>
								<option value="20시">20시</option>
								<option value="21시">21시</option>
								<option value="22시">22시</option>
								<option value="23시">23시</option>						
								<option value="24시">24시</option>	
							</select>
						</form> 					
					</td>
				</tr>				
				<tr>
					<td colspan="4">
						<textarea id="contents" name="introduce" v-model="introduce" style="font-weight: 400;"></textarea>
					</td>
				</tr>
			</table>
			<button id="btn" @click="fnList" class="btn" style="float: right;">목록으로</button>
			<button id="btn" @click="fnSave" class="btn" style="float: right;">저장</button>
		</div>
	
	
	
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
    	  list : [] 
  		  , info : {}
 		  , idx : "${map.idx}"	// boardList 에서 받아온 값!!! for 이미지
   		  , userId : "${userId}"	//세션으로 id가져오기
   		  , resnum : "${resnum}"
   		  , reskind : "${reskind}"
 		  , selectedItemList : []
 	 	  , img : ""
 	 	  , price : ""
 	 	  , menuname : ""
 	 	  , introduce : ""
 	 	  , supply :""
 	 	  , pickuptime : ""
 	 	  
 
    } 
    , methods: {
    	// 상세 메뉴 기본 출력
    	fnGetMenu : function(){
            var self = this;
            console.log("메뉴 인덱스 == " + self.idx);
            var nparmap = {idx : self.idx};
            $.ajax({
                url:"/menu.detail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {       
                    self.price = data.board.price;
                    self.menuname = data.board.menuname;               	
                    self.introduce = data.board.introduce;
                    self.supply = data.board.supply;
                    self.pickuptime = data.board.pickuptime;
                }
            }); 
        }
		// 저장 버튼
		, fnSave : function(){
    		var self = this;
    		console.log(self.img);
	      	var nparmap = {userId : self.userId, price : self.price, menuname : self.menuname, introduce : self.introduce, 
	      					reskind : self.reskind, resnum : self.resnum, idx : self.idx,
	      					supply : self.supply, pickuptime : self.pickuptime}; 
	        $.ajax({
	            url:"/editMenu.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	           	 	alert("메뉴가 수정되었습니다.");
	           		location.href="/menumanagement.do";
	            }
	        }); 	   
		}
		// 목록으로 가기 버튼
		, fnList : function(){
			location.href="/menumanagement.do";
		} 
		

    
    }   
    , created: function () {
    	var self = this;
    	self.fnGetMenu();
	}
});


</script>
