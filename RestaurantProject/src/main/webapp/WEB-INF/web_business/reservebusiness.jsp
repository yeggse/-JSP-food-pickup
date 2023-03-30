<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <link rel="stylesheet" href="css/detail/reserveDetail.css">
    <script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	 <title>예약 내역 확인하기</title>
</head>

<style>
</style>

<body>
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app" style="margin-bottom: 100px;">
		<div class="container">
			<h2 style="margin-left: 30px;">오늘 {{id}} 님께서 받으신 예약🎈</h2>
			<div style="text-align: center;">
			</div>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="10%"/> 
					<col width="10%"/> 
					<col width="*"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">성함</th>
						<th scope="col">주문번호</th>
						<th scope="col">상호명</th>
						<th scope="col">메뉴</th>
						<th scope="col">개수</th>
						<th scope="col">개당 가격</th>
						<th scope="col">주문일자</th>
						<th scope="col">픽업시간</th>
						<th scope="col">결제금액</th>
						<th scope="col">예약상태</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td >{{item.orderer}}</td>                       
	                   <td >{{item.no}}</td> 
	                   <td >{{item.resname}}</td> 
	                   <td >{{item.menuname}} </td> 
	                   <td >{{item.menunum}} </td>
	                   <td >{{item.price}} </td> 
	                   <td >{{item.orderdate}}</td>
	                   <td >{{item.pickuptime}}</td>
	                   <td >{{item.price * item.menunum}} </td>
	                   <td  >
	                 	  <button v-if="item.salecomple =='N'" id='btnSoldout' @click='btnOnOff(item)'> 판매 완료 {{item.salecomple}} </button>
	                   </td>
	               	
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->			
			<template>
			<paginate
				style="margin-bottom:200px;"
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
</body>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
    	list : [] 
        , selectedItemList : []
		, selectPage: 1	// 기본 세팅이 1번 페이지로 맞추어져 있음.
		, pageCount: 1
        , id: "${userId}"
        , ordernum : ""
        , menuname : ""
        , orderdate : ""
        , pickuptime : ""
        , price : ""
        , salecomple : ""
        , resnum : "${resnum}"
       	, salecomple : ""
        
    }   
    , methods: {
    	// 기본 출력
      fnGetList : function(){
              var self = this;
              var startNum = ((self.selectPage-1) * 10);
      		  var lastNum = self.selectPage * 10;
              var nparmap = {startNum : startNum, lastNum : lastNum, resnum : self.resnum, salecomple:self.salecomple};
              $.ajax({
                  url: "/businessNowRes.dox",
                  dataType:"json",	
                  type : "POST", 
                  data : nparmap,
                  success : function(data) {                                       
  	                self.list = data.list;
  	            	self.pageCount = Math.ceil(data.cnt / 10);
  	                console.log(self.list);  
  	            	console.log(startNum+"startNum"); 
  	            	console.log(lastNum+"lastNum"); 
                  }
              }); 
            console.log(self.resnum);
          } 
		// 페이지 전환 메소드
		, changePage : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);	// 한페이지에 10개씩 출력되도록 하기 위해 필요함
			var lastNum = 10;
	        var nparmap = {startNum : startNum, lastNum : lastNum, resnum: self.resnum, salecomple:self.salecomple};
	        $.ajax({
	            url:"/businessNowRes.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(data);
	            }
	        }); 
		}
    
    	, btnOnOff : function(item){
    		var self = this;
	      	var nparmap = {salecomple : self.salecomple, no : item.no}; 
	        $.ajax({
	            url:"/saleFin.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	            	var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
	       	        //form.append( "file1", $("#file1")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미
	       	     	//form.append( "idx",  data.idx);	// 여기에 있는 boardIdx는 어디로 가나?????
	       	        
	            	alert("판매 완료되었습니다.");
	           		location.href="/reservebusiness.do";
	            }
	        }); 
    	}
    
      
      }   
      , created: function () {
    	var self = this;
  		this.fnGetList();       
  	  } 
    
   
});
</script>