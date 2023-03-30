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
                    <a href="#" class="nav__logo">설정</a>
                </div>
                <div class="nav__list">
                    <a href="main.do" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">주문하기</span>
                    </a>
                    

                    <div href="#" class="nav__link collapse1">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">가게 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="reservebusiness.do" class="collapse__sublink">●주문 내역</a>
                            
                            <a href="menumanagement.do" class="collapse__sublink">●메뉴 관리</a>
                            
                            <a href="paymentbusiness.do" class="collapse__sublink">●매출 관리</a>
                        </ul>
                    </div>

                    <a href="review.do" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">리뷰 관리</span>
                    </a>

                   <!--  <div href="#" class="nav__link collapse">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">식당 찾기</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width:120px;">
                            <a href="#" class="collapse__sublink">●양식</a>
                            <a href="#" class="collapse__sublink">●중식</a>
                            <a href="#" class="collapse__sublink">●일식</a>
                            <a href="#" class="collapse__sublink">●아시아</a>
                            <a href="#" class="collapse__sublink">●한식</a>
                            <a href="#" class="collapse__sublink">●잡식</a>
                        </ul>
                    </div> -->

                    <a href="datachange2.do" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내 정보 수정</span>
                    </a>
                </div>
                <a href="login.do" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a>
            </div>
        </nav>
    </div>
 <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="js/main.js"></script>

   
</body>
</html>




