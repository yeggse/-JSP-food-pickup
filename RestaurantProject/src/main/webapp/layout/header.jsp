<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<title>[세잎] 업체군 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
	<link rel="stylesheet" href="css/header.css" type="text/css">
	
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
    
    <div id="app2" class = "header">
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 ">
       <a  href="main.do"><img style="margin-left:40px; margin-top:-1rem;"src="img/main/newlogo.png" width="100px" height="80px"></a> 

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="main.do" class="nav-link px-2 link-secondary">Home</a></li>
        <li v-if="'${kind}' == ''"><a href="login.do" class="nav-link px-2 link-secondary">My page</a></li>
        <li v-else-if="'${kind}' == 'A'"><a href="reservemy.do" class="nav-link px-2 link-secondary">My page</a></li>
        <li v-else-if="'${kind}' == 'B'"><a href="menumanagement.do" class="nav-link px-2 link-secondary">My page</a></li>
        <li v-else-if="'${kind}' == 'C'"><a href="normalMem.do" class="nav-link px-2 link-secondary">My page</a></li>
        <li><a href="main.board.do" class="nav-link px-2 link-secondary">Notice</a></li> 
        <li><a href="main.do" data-bs-toggle="modal" data-bs-target="#exampleModal" class="nav-link px-2 link-secondary">About</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button v-if="'${userId}' === ''" type="button" @click = "fnLogin" class="btn btn-outline-primary me-2">Login</button>
        <button v-else type="button" @click = "fnLogin" class="btn btn-outline-primary me-2">Log-out</button>
        <button v-if="'' == '${userId}'" type="button" @click = "fnSignUp" class="btn btn-primary">Sign-up</button>
      </div>
    </header>
	</div>
</head>

<body style="margin: 0px;" >

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">이용 방법</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img src = "img/main/Mfood.png">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
</script>
	<script src="https://kit.fontawesome.com/e2c13a792d.js"
		crossorigin="anonymous"></script>

</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app2',
    data: {
    	
    }   
    , methods: {
    	pageChange : function(url, param) {
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
		, fnLogin : function(){
			var self = this;
			self.pageChange("/login.do", {}); 
		}
		, fnSignUp : function(){
			var self = this;
			self.pageChange("/join.do", {}); 
		}
    }
    , created: function () {
	}
});
</script>