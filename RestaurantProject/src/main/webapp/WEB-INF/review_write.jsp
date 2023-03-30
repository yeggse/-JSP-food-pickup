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
/*별점*/
#myform legend{
  font-size:1rem;
  text-align: center;
  margin:auto;
}

#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 2rem; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0rem 0rem 0rem #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0rem 0rem 0rem gray; 
}
#myform label:hover ~ label{
    text-shadow: 0rem 0rem 0rem gray; /* 호버 연속적으로 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0rem 0rem 0rem #db4455; /* 마우스 클릭 체크 */
}

.main{
	margin:auto;
	margin-top:5rem;
  width:75rem;
  height:46rem;
  border: 1px solid;
}


#label{
  margin:1rem 0rem 1rem 5rem;
}

#chooseFile:hover{
  background:#dcdcdc;
}

.btn1{
  width:32rem;
  height:2.3rem;
  margin:auto;
  margin-left:0.5rem;
  border:none;
}
.btn1:hover{
  background:green;
}

#myform{
  margin:auto;
  margin-top:6rem;
  width:70rem;
  height:7rem;
}
#myform fieldset{
	width:17rem;
	height:8.5rem;
	margin:auto;
	margin-left:26.5rem;
	margin-top:0rem;
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
}
.div000{
width:20rem;
}
.div00{
width:15rem;
height:4rem;
margin:auto;
margin-bottom:-5rem;
 text-decoration: none;
	color: #62F903;
	text-shadow: 0px 0 black, 0 0px black, 0px 0 black, 0 0px black;
}

.div0{
width:66rem;
height:22rem;
margin:auto;
margin-top: 1rem;
}
.p1{
	width:10rem;
	height:2rem;
	margin:auto;
}

.input1{
  width:65rem;
  height:19rem;
	margin:auto;
	margin-left: 0.5rem;
  vertical-align : top;
  text-align:left ;
  border:1px solid;
}
.input2{
  width:65rem;
  height:2.5rem;
	margin:auto;
	margin-left: 0.5rem;
  vertical-align : top;
  text-align:left ;
  border:1px solid;
}

.div1{
width:14rem;
height:2rem;
margin:auto;
margin-left:28rem;
margin-bottom:1rem;
}

.div2{
width:65rem;
height:2rem;
margin:auto;
border:1px dotted;
}
.div2:hover{
background:#dcdcdc;
}

.div3{
width:66rem;
height:3rem;
margin:auto;
}
#chooseFile{
  width: 65rem;
  height:2rem;
  margin: 0rem 0rem 0rem 0.5rem;
  border:1px dotted black;
   border:1px solid;
}


input::file-selector-button {
display:none;
}

</style>




<body>
<jsp:include page="/layout/mypagebody.jsp"></jsp:include>

  <!--메인 프레임-->
  <div id="app" class="main">
    
    <!-- 제목 -->
    <div class="div00"><h1>리뷰작성하기</h1></div>

	 <!--별점-->
    <form name="myform" id="myform" method="post" action="./save">
              <fieldset id="filedset">
                <legend><h4>?상품은 만족하셨나요</h4></legend>
                <input @click="fnGrade" type="radio" name="rating" value="5" id="rate1" v-model = "grade"><label for="rate1">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="4" id="rate2" v-model = "grade"><label for="rate2">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="3" id="rate3" v-model = "grade"><label for="rate3">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="2" id="rate4" v-model = "grade"><label for="rate4">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="1" id="rate5" v-model = "grade"><label for="rate5">⭐</label>
              </fieldset>
            </form>
   
	 <!--리뷰작성-->
 	<div class="div0">
 	
    	<div>
    		  <input class="input2" Type="text" placeholder="제목을 입력해주세요" name="content" v-model="title"></imput>  
   		</div>
   	 	<div>
    		  <input class="input1" Type="text" placeholder="리뷰를 입력해주세요" name="content" v-model="content"></imput>  
   		</div>
 	</div>

    <!--사진 첨부하기-->
            <form method="post" enctype="multipart/form-data">
              <div class="div1">
                    <label id="label">
                        📷 사진 첨부하기 
                    </label>
                </div>
                
                <div class="div2">
	                <input type="file" id="file3" name="file3">
                </div>
            </form>
  
    <!--취소/등록 버튼-->
          <div class="div3">
               <button class="btn1" @click="fncancel">취소</button>
               <button class="btn1" @click="fnSave" id="radioButton">등록</button>
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
			,writedate:""
			,menuname:""
			,price:""
			,ordernum:""
			,content:""
			,title: ""
			,img:""
			,nickname : "${nickname}"
			,reviewnum:"${map.reviewnum}"
			,grade:""
			,reskind:"${map.reskind}"
			,resnum:"${map.resnum}"
			,resname : "${map.resname}"
			,no: "${map.no}"
			
    }

    , methods: {
    	/* fnTest : function(){
            var self = this;
            var nparmap = {resnum: self.resnum, 
            		startdate: self.startdate, 
            	 	menuname: self.menuname, 
            	 	price: self.price, 
            	 	ordernum:self.ordernum,
            	 	reviewnum: self.reviewnum}; 
            
                console.log(nparmap);
           
            $.ajax({
                url:"/reviewwrite.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                
                success : function(data) {
                	self.list = data.list;
                	
                	console.log(nparmap);
                	console.log(data.list);
                }
            }); 
        } */
    	 fnGrade : function(){
    	    	$(document).ready(function(){
    	    		$('#radioButton').click(function(){
    	    			//getter
    	    			self.grade = $('input[name="rating"]:checked').val();
    	    			alert(self.grade);
    	    		});	
    	    	});
    	    }
     ,fnSave : function(){
		var self = this;
      	var nparmap = {nickname:self.nickname,content : self.content, img : self.img, grade: self.grade, reskind:self.reskind, resnum: self.resnum, title: self.title,resname:self.resname,no:self.no }; 
        $.ajax({
            url:"/addReview.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {  
	            var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
       	        form.append( "file3", $("#file3")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미 //이미지 선택한 파일이 form으로 들어감	보트컨트롤러의 fileList파이
       	     	form.append( "reviewnum",  data.reviewnum);	// 여기에 있는 boardIdx는 어디로 가나?????		// boardIdx에 게시글의 경로를 일치시켜주기
       	  		// 이미지 파일을 활성화하는 아작스 통신 더 불러오기
       	         $.ajax({
       	             url : "/upload2"	// board controller - upload파트와 연결
       	           , type : "POST"
       	           , processData : false
       	           , contentType : false
       	           , data : form
       	           , success:function(response) { }
       	           ,error: function (jqXHR) 
       	           {}
       	       }); 
            	alert("리뷰 작성해 주셔서 감사합니다!");
           		location.href="/paymentmy.do";
            }
        }); 
     }
	
    // 사진 업로드 
		, upload : function(){
		var form = new FormData();
	        form.append( "file3", $("#file3")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload2"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { }
	           ,error: function (jqXHR) {}
	       });
    	}
		, fncancel : function(){
	    	var self = this;
	    	self.pageChange("/paymentmy.do", {nickname:self.nickname,content : self.content, img : self.img, grade: self.grade, reskind:self.reskind, resnum: self.resnum, title: self.title,resname:self.resname,no:self.no});
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
		, change :function(item){
	    	var self = this;
	    	var nparmap = {no : item.no};
	        $.ajax({
	            url:"/reviewFin.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	            	var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
	       	        //form.append( "file1", $("#file1")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미
	       	     	//form.append( "idx",  data.idx);	// 여기에 있는 boardIdx는 어디로 가나?????
	       	        
	            	alert("게시글이 저장되었습니다.");
	           		location.href="/reservebusiness.do";
	           		
	            }
	        }); 
	        self.pageChange("/reviewwrite.do", {resnum:item.resnum, reskind:item.reskind});
	    }
    }
    , created: function () {
    	console.log(self.resname);
    	console.log(self.resnum);
	}
});
</script>