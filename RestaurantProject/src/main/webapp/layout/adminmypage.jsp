<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery.js"></script>
	<script src="js/vue.js"></script>
	
    <!-- CSS -->
    <link rel="stylesheet" href="css/styles.css" type="text/css">

    <title>SideBar sub menus</title>
</head>
<body id="body-pd">

    <div class="l-navbar" id="navbar" style = "margin-top:129px" >
        <nav class="nav1">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">관리하기</a>
                </div>
                <div class="nav__list">
                    <a href="main.do" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">홈페이지</span>
                    </a>
                    

                    <div href="#" class="nav__link collapse1">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">회원 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="normalMem.do" class="collapse__sublink">●일반 회원</a>
                            <div>
                            <a href="BuMemList.do" class="collapse__sublink">●사업자 회원</a>
                            </div>
                        </ul>
                    </div>

                    <a href="main.board.do" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">공지사항</span>
                    </a>

                    <div href="#" class="nav__link collapse1">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">리뷰 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width:120px;">
                            <a href="#" class="collapse__sublink" onclick="pageChange1('/reviewadmin.do',{reskind: '전체',flg :'1=1'})">●전체</a>
                            <a href="#" class="collapse__sublink" onclick="pageChange1('/reviewadmin.do',{reskind: '양식'})">●양식</a>
                            <a href="#" class="collapse__sublink" onclick="pageChange1('/reviewadmin.do',{reskind: '중식'})">●중식</a>
                            <a href="#" class="collapse__sublink" onclick="pageChange1('/reviewadmin.do',{reskind: '일식'})">●일식</a>
                            <a href="#" class="collapse__sublink" onclick="pageChange1('/reviewadmin.do',{reskind: '아시아'})">●아시아</a>
                            <a href="#" class="collapse__sublink" onclick="pageChange1('/reviewadmin.do',{reskind: '한식'})">●한식</a>
                        </ul>
                    </div>

                </div>
                <a href="login.do" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">로그아웃</span>
                </a>
            </div>
        </nav>
    </div>
 <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="js/main.js"></script>
    <script>
    function pageChange1 (url, param) {
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
    </script>
   
</body>
</html>




