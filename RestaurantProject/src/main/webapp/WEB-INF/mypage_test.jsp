<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>Insert title here</title>
</head>
<style>
   td{
        border-top : 1px solid black;
        font-size: 20px;
        text-align: center;
        padding : 6px;
    }
</style>
<body>
	<div id="app">
	    <table border="1">
		<th>테이블</th>
		<th>만들기</th>
		<th>test</th>
		<tr><!-- 첫번째 줄 시작 -->
		    <td>첫번째 칸</td>
		    <td>두번째 칸</td>
		    <td>세번째 칸</td>
		</tr><!-- 첫번째 줄 끝 -->
		<tr><!-- 두번째 줄 시작 -->
		    <td>첫번째 칸</td>
		    <td>두번째 칸</td>
		    <td>세번째 칸</td>
		    <td>네번째 칸</td>
		</tr><!-- 두번째 줄 끝 -->
	    </table>
	</div>
</body>
</html>
<!-- <script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] // 전체 데이터 리스트
       , selectedItemList : []
       , keyword : ""
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                console.log(data.test1);
	                console.log(data.test2);
	                console.log(self.list);    
                }
            }); 
        }  
    	, fnRemove : function(){
    		 var self = this;
           	 var nparmap = {boardNum : 14};
             $.ajax({
                 url:"/remove.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {            
                	 alert("삭제되었습니다.");
                	 self.fnGetList();
                 }
             });
             
    	}
    	, fnSearch : function(){
    		var self = this;
    		var nparmap = {keyword : self.keyword};
    		 $.ajax({
    			 url:"/list.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data2){
                	 self.list = data2.list;
                	 console.log(self.list);
    		} 
    	 });
    }
    }
    		 <!--페이지가생성되면서 최초로 실행할 메소드-->
    , created: function () {
		this.fnGetList();       
	}
});
</script> -->