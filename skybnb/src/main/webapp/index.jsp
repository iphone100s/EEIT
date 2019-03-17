<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE  html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PAGE settings -->
<link rel="icon" href="images/cloudy.png">
<title>Skybnb</title>
<!-- 網頁整體樣式CSS-->
<link rel="stylesheet" href="css/index/aquamarine.css">
<link rel="stylesheet" href="css/index/fontawesome.css" type="text/css">
<link rel="stylesheet" href="css/index/jquery-ui.css">

<style>
* {
	font-family: 微軟正黑體;
	font-size: 100%;
}

nav {
	font-size: 120%;
}

.form-control {
	overflow: scroll;
}

.middlebanner {
	border-top: solid 1px #AAAAAA;
	border-bottom: solid 1px #AAAAAA;
}
</style>
</head>


<body class="text-center">
	<!-- Navbar -->
	<c:choose>
		<c:when test="${not empty sessionScope.name}">
			<jsp:include page="homePageLoginNavbar.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="homePageNavbar.jsp" />
		</c:otherwise>
	</c:choose>

	<div class="d-flex align-items-center section-aquamarine py-5 cover"
		style="background-image: url(&quot;images/index/cover.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-white mt-5">
					<h1 class="display-2 d-none d-md-block">Skybnb</h1>
					<p class="">SEP 09-28, TW</p>

					<form action="<c:url value="SearchController"/>"
						method="get">

						<div class="input-group input-group-lg">
							<div class="input-group-prepend">								
							</div>

							<label for="tags"></label> <input type="text" id="tags"
								name="city" class="form-control" aria-label="Large"
								aria-describedby="inputGroup-sizing-sm" placeholder="目的地．房源">
							<button type="submit" class="btn btn-primary btn-md" value="套用" name="houseinfo" >搜尋</button>

						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	<!-- 嚴選房源 -->
	<div class="py-5 bg-light" id="speakers">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12" >
					<p   style="font-weight: bold;font-family: 微軟正黑體;font-size: 40px;">世界各地的房源</p>
					<p style="font-family: 微軟正黑體;font-size: 18px;">瀏覽我們精心挑選的房源，絕對帶給你遠超預期的舒適享受</p>
				</div>
			</div>

			<div class="row">
				<div class="col-6 col-lg-4 animate-in-left">
					<a href="#"> <img src="images/index/w3.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Central Park View with Private Bath</p>
						</a>
						<span class="text-muted">$2764 TWD 一晚</span>
							<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				<div class="col-6 col-lg-4">
					<a href="#"> <img src="images/index/w2.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Amazing view - Moderne apartmaent</p>
						</a>
						<span class="text-muted">$3831 TWD 一晚</span>
							<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				<div class="col-6 col-lg-4 animate-in-right">
					<a href="#"> <img src="images/index/w1.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Stylish house close to river thames</p>
						</a>
						<sapn class="text-muted">$2701 TWD 一晚</span>
							<br>
						<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				<div class="col-6 col-lg-4 animate-in-left">
					<a href="#"> <img src="images/index/w6.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">
							<b>Romantic Cabana with view&nbsp;</b>
								</a>
						</p>
						<span class="text-muted">$1256 TWD 一晚</span>
							<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
				
				</div>
				<div class="col-6 col-lg-4">
					<a href="#"> <img src="images/index/w5.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">
							Private apt in central Tokyo <br>
						</p>
						</a>
						<span class="text-muted">$3517 TWD 一晚</span>
						<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				<div class="col-6 mask col-lg-4 animate-in-right">
					<a href="#"> <img src="images/index/w4.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">
							<b>Malibu Dream Airstream</b>
						</p>
						</a>
						<span class="text-muted">$20413 TWD 一晚</span>
						<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
			</div>
		</div>
	</div>

	<!-- 	中間banner -->
	<div class="middlebanner" style="height: 400px; background: #f0f0f0">

		<span> <img src="images/index/rent.jpg"
			style="height: 300px; margin-top: 50px; float: left; margin-left: 190px">
		</span> <br> <br> <br> <br> <br> <span
			style="font-size: 30px; margin-left: 30px; float: left; font-weight: bold;">
			快來看看出租住家可以為您賺來多少收入
			<p style="font-size: 20px;">出租家裡多餘的空間，賺取額外收入。</p> <span> </span>

		</span>
		<div>
			<br> <br> <br> <br>
			<br> <span style="margin-left: 200px;"> <a href=""
				class="btn btn-primary">成為房東</a>
			</span>
		</div>
	</div>

	<!-- 熱門房源 -->

	<div class="py-5 bg-light" id="speakers">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<p style="font-weight: bold ;font-family: 微軟正黑體;font-size: 40px;">熱門房源</p>

					
				</div>
			</div>
			<div class="row">
				<div class="col-6 col-lg-4 animate-in-left">
					<a href="#"> <img src="images/index/w7.png"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Asakusa Private Guest Room</p>
						</a>
						<span class="text-muted">$1293 TWD 一晚</span>
								<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				<div class="col-6 col-lg-4 ">
					<a href="#"> <img src="images/index/w8.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Stylish house close to river thames</p>
						</a>
						<span class="text-muted">$2598 TWD 一晚</span>
								<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				<div class="col-6 col-lg-4 animate-in-right">
					<a href="#"> <img src="images/index/w9.jpg"
						class="center-block img-fluid my-3" width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">
							Live the LA Lifestyle in Loft near Metro <br>
						</p>
						</a>
						<span class="text-muted">$1550 TWD 一晚</span>
								<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
					
				</div>
				
				
				
					<div class="col-6 col-lg-4 animate-in-left">
					<a href="#"> <img src="images/index/w10.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Paddle Board Sunset Glow Tour</p>
							</a>
						<span class="text-muted">$4000 TWD 一晚</span>
								<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
						
						
						
						
				
				</div>
				<div class="col-6 col-lg-4 ">
					<a href="#"> <img src="images/index/w11.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">Stylish house close to river thames</p>
							</a>
						<span class="text-muted">$1385 TWD 一晚</span>
								<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
				
				</div>

				<div class="col-6 col-lg-4 animate-in-right">
					<a href="#"> <img src="images/index/w12.jpg"
						class="center-block img-fluid my-3 " width="300">
						<p class="mb-0" style="font-size: 25px;font-weight: bold;">
							Private apt in central Tokyo <br>
							
						</p>
							</a>
						<span class="text-muted">$2456 TWD 一晚</span>
								<br>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
							<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
								<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
									<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
										<span><img alt="" src="images/index/star.png" style="height:15px;"></span>
				
				</div>
				

			</div>
		</div>
	</div>

	<!-- Parallax section -->
	<div class="py-5 section-parallax"
		style="background-image: url(&quot;images/index/venue.jpg&quot;);">
		<div class="container my-5 bg-light p-4">
			<div class="row mx-auto">
				<div class="col-md-12">
					<h1 class="mb-3">關於 Skybnb</h1>
					<p class="">Skybnb是一個讓大眾出租住宿民宿的網站，提供短期出租房屋或房間的服務。讓旅行者可以通過網站或手機、發掘和預訂世界各地的各種獨特房源，為近年來共享經濟發展的代表之一。網站成立於2008年8月，公司總部位於美國加利福尼亞州舊金山，為一家私有公司，由「Skybnb,
						Inc.」負責管理營運。目前，Skybnb在191個國家、65,000個城市中共有超過3,000,000筆房源。</p>
					<a
						href="searchResult.jsp"
						class="btn btn-primary">立即訂房</a>


				</div>
			</div>
		</div>
	</div>



	

<script src="js/index/navbar-ontop.js"></script>
<script src="js/index/animate-in.js"></script>

<!--   不可刪 -->
<script src="js/index/jquery-1.12.4.js"></script>
<script src="js/index/jquery-ui.js"></script>


<script>
	$(function() {
		var availableTags = [ "北海道Hokkaido ", "青森縣Aomori-ken", "岩手縣Iwate- ken",
				"宮城縣Miyagi- ken", "秋田縣Akita-ken", "山形縣Yamagata- ken",
				"福島縣Fukushima-ken", "茨城縣Ibaraki -ken", "栃木縣Tochigi-ken",
				"群馬縣Gunma -ken", "埼玉縣Saitama-ken", "千葉縣Chiba-ken ", "東京都Tokyo",
				"神奈川縣 Kanagawa- ken ", "新潟縣Niigata-ken", "富山縣Toyama-ken",
				"石川縣Ishikawa-ken", "福井縣Fukui- ken", "山梨縣Yamanashi-ken",
				"長野縣Nagano-ken", "岐阜縣Gifu-ken", "靜岡縣Shizuoka-ken",
				"愛知縣Aichi-ken", "三重縣Mie-ken", "滋賀縣Shiga-ken", "京都府Kyoto-hu",
				"大阪府Osaka -hu", "兵庫縣Hyogo- ken ", "奈良縣Nara-ken ",
				"和歌山縣 Wakayama-ken ", "鳥取縣Tottori-ken", "島根縣Shimane-ken",
				"岡山縣Okayama-ken", "廣島縣Hiroshima-ken", "山口縣Yamaguchi-ken ",
				"德島縣Tokushima-ken ", "香川縣Kagawa-ken", "愛媛縣Ehime-ken",
				"高知縣Kochi-ken ", "福岡縣Fukuoka-ken", "佐賀縣Saga-ken",
				"長崎縣Nagasaki-ken ", "熊本縣Kumamoto-ken", "大分縣Oita-ken",
				"宮崎縣Miyazaki-ken", "鹿兒島縣Kagoshima-ken", "沖繩縣Okinawa-ken",
				"基隆市Keelung", "台北市Taipei", "新北市NewTaipei", "桃園市Taoyuan",
				"新竹市Hsinchu", "苗栗縣Miaoli", "台中市Taichung", "彰化縣Changhua",
				"南投縣Nantou", "雲林縣Yunlin", "嘉義市Chiayi", "台南市Tainan",
				"高雄市Kaohsiung", "屏東縣Pingtung", "宜蘭縣Yilan", "花蓮縣Hualien",
				"臺東市Taitung", "金門縣Kinmen", "澎湖縣Penghu", "連江縣Lienchiang",
				"南海諸島", "首爾特別市Seoul", "全羅北道Jeollabuk-do", "釜山廣域市Busan",
				"全羅南道Jeollanam-do", "大邱廣域市Daegu", "慶尙北道Gyeongsangbuk-do",
				"仁川廣域市Incheon", "慶尙南道Gyeongsangnam-do", "光州廣域市Gwangju",
				"濟州特別自治道Jeju Special Self-Governing Province", "大田廣域市Daejeon",
				"世宗特別自治市Sejong Special Self-Governing City", "蔚山廣域市Ulsan",
				"京畿道Gyeonggi-do", "忠淸北道Chungcheongbuk-do",
				" 忠淸南道Chungcheongnam-do",

		];
		$("#tags").autocomplete({
			source : availableTags
		});
	});
</script>
</body>
</html>