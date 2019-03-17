<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 出租房源</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 此網頁的css -->
<link href="css/uploadhouse/uploadHouse.css" rel="stylesheet">
<!-- fontAwesome -->

<link rel="stylesheet" 
				 href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				 integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
				 crossorigin="anonymous">
<!-- <link rel="stylesheet" href="css/uploadhouse/all.css"> -->
<!-- 樣板及套件的css -->
<link rel="stylesheet" href="css/uploadhouse/stepBar.css">
<link rel="stylesheet" href="css/uploadhouse/fileinput.min.css">
<link rel="stylesheet" href="css/uploadhouse/theme.css">
<link rel="stylesheet" href="css/uploadhouse/datepicker.css" />

</head>

<body onload="renew(document.getElementById('country').selectedIndex)">
	<header>
		<jsp:include page="navbar.jsp" /> 
	</header>
	
	<main class="mt-3"> <!-- 除了這邊，另一部份與頁面頂端(不被navbar蓋住)距離的設定，是
	在stepBar.css裡面的.bs-wizard {margin-top: 30px;} (第一行)，兩邊加總才是顯示的距離 -->
	<div class="container">
		<form class="form-horizontal" role="form" method="POST" name="myForm"
			action="houseinformation.controller">
			<input type="hidden" name="memberID" value="${sessionScope.user}">
			<div id="basicData">
				<!--	流程Bar Step1		-->
				<jsp:include page="stepBarProcess1.jsp" /> 

				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6 text-center">
						<h2>輸入您的房屋資訊</h2>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="houseName">房間名稱</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fa fa-user"></i>
								</div>
								<input type="text" name="houseName" class="form-control "
									id="houseName" placeholder="請輸入房間名稱" autofocus>
							</div>
						</div>
					</div>
					<!-- 				<div class="col-md-3"> -->
					<!-- 					<div class="form-control-feedback"> -->
					<!-- 						<span class="text-danger align-middle"> Put name validation error messages here -->
					<!-- 						</span> -->
					<!-- 					</div> -->
					<!-- 				</div> -->
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="houseType">住宿類型</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fa fa-home"></i>
								</div>
								<select name="houseType" class="form-control" id="houseType">
									<option selected="selected" disabled="disabled">請選擇房屋類型</option>
									<option value="公寓">公寓</option>
									<option value="獨棟房屋">獨棟房屋</option>
									<option value="大廈">大廈</option>
									<option value="別墅">別墅</option>
								</select>
							</div>
						</div>
					</div>
					<!-- 				<div class="col-md-3"> -->
					<!-- 					<div class="form-control-feedback"> -->
					<!-- 						<span class="text-danger align-middle"> Put e-mail validation error messages here -->
					<!-- 						</span> -->
					<!-- 					</div> -->
					<!-- 				</div> -->
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="houseSpace">住宿空間</label>
					</div>
					<div class="col-md-6">
						<div class="form-group has-danger">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-door-closed"></i>
								</div>
								<select name="houseSpace" id="houseSpace" class="form-control">
									<option selected="selected" disabled="disabled">請選擇住宿空間</option>
									<option value="false">與房東共同居住</option>
									<option value="true">房屋僅供房客居住</option>
								</select>
							</div>
						</div>
					</div>
					<!-- 				<div class="col-md-3"> -->
					<!-- 					<div class="form-control-feedback"> -->
					<!-- 						                        <span class="text-danger align-middle"> -->
					<!-- 						                            <i class="fa fa-close"> Example Error Message</i> -->
					<!-- 						                        </span> -->
					<!-- 					</div> -->
					<!-- 				</div> -->
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for=maxPeopleAvailable>可住人數</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fa fa-users"></i>
								</div>
								<select name="maxPeopleAvailable" id="maxPeopleAvailable"
									class="form-control">
									<option selected="selected" disabled="disabled">請選擇人數</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="country">國家</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-globe-americas"></i>
								</div>
								<select name="country" id="country" class="form-control"  onChange="renew(this.selectedIndex);">
									<option value="">請選擇國家</option>
									<option value="台灣" <c:if test="${condition.country =='台灣'}">selected</c:if>>台灣</option>						
							 		<option value="日本" <c:if test="${condition.country =='日本'}">selected</c:if>>日本</option>									
									<option value="韓國" <c:if test="${condition.country =='韓國'}">selected</c:if>>韓國</option>					
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="city">城市</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-globe-americas"></i>
								</div>
								<select name="city" id="city" class="form-control">
<!-- 									<option selected="selected" disabled="disabled">請選擇城市</option> -->
									<option value="">請選擇城市</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="address">地址</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-map-marker-alt"></i>
								</div>
								<input type="text" name="address" class="form-control"
									id="address" value="" placeholder="請輸入房屋地址">
								<input type="hidden" value="" name="mapLatitude" id="lat">
								<input type="hidden" value="" name="mapLongitude" id="long">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="facility">提供設備</label>
						<input id="facilityFromDB" type="hidden" value="${selectForOne.facility}">
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-tv"></i>
								</div>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="tv" value="電視"><span class="mt-2">電視 </span><input type="checkbox"
									name="facility" class="mt-3 form-control" id="ref" value="冰箱"><span class="mt-2">冰箱</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="microwave" value="微波爐"><span class="mt-2">微波爐</span><input type="checkbox"
									name="facility" class="mt-3 form-control" id="wifi" value="wifi"><span class="mt-2">Wi-Fi</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="washingMachine" value="洗衣機"><span class="mt-2">洗衣機</span> <input
									type="checkbox" name="facility" class="mt-3 form-control"
									id="hairDryer" value="吹風機"><span class="mt-2">吹風機</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="washingTools" value="盥洗用具"><span class="mt-2">盥洗用具</span>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="facility"></label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class=""></i>
								</div>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="Heater" value="暖氣"><span class="mt-2">暖氣</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="kichen" value="廚房"><span class="mt-2">廚房</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="dressingTable" value="化妝台"><span class="mt-2">化妝台</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="airConditioner" value="冷氣機"><span class="mt-2">冷氣機</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="swimmingPool" value="游泳池"><span class="mt-2">游泳池</span>
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="coffeeMachine" value="咖啡機"><span class="mt-2">咖啡機</span>	
								<input type="checkbox" name="facility" class="mt-3 form-control"
									id="Dryer" value="烘衣機"><span class="mt-2">烘衣機</span>
								

							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="houseIntroduction">房間介紹</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-clipboard"></i>
								</div>
								<textarea cols="50" rows="5" name="houseIntroduction"
									class="form-control" id="houseIntroduction"
									placeholder="請輸入房間簡介"></textarea>
							</div>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 field-label-responsive">
						<label for="houseRules">房間規範</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-book"></i>
								</div>
								<textarea cols="50" rows="5" name="houseRules"
									class="form-control" id="houseRules" placeholder="請輸入房間規範"></textarea>
							</div>

						</div>
					</div>
				</div>
				<div class="row">
					<div class='col-md-3 field-label-responsive'>
						<label for="startRentTime">開始出租日期</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="far fa-calendar"></i>
								</div>
								<input type="text" id="startPicker"
									class="datepicker-here form-control" autocomplete="off">
								<input type="hidden" id="startRentTime" name="startRentTime">
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class='col-md-3 field-label-responsive'>
						<label for="endRentTime">出租結束日期</label>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="far fa-calendar"></i>
								</div>
								<input type="text" id="endPicker"
									class="datepicker-here form-control" autocomplete="off">
								<input type="hidden" id="endRentTime" name="endRentTime">
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class='col-md-3 field-label-responsive'>
						<label for="price">出租價格</label>
					</div>

					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-dollar-sign"></i>
								</div>
								<input type="text" id="price" name="price" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class='col-md-3 field-label-responsive'>
						<label for="freeCancel">取消預定</label>
					</div>

					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fas fa-ban"></i>
								</div>
								<select id="freeCancel" name="freeCancel" class="form-control">
									<option value="1">可免費取消</option>
									<option value="0">無免費取消</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-md-5"></div>
					<div class="col-md-6">
						<button type="button" class="btn btn-success ml-5" name="nextPage"
							onclick="nextPage1();">下一頁</button>
					</div>

				</div>
			</div>
			<div id="imageForm" style="display: none">
				<!--	流程Bar Step2		-->
				<jsp:include page="stepBarProcess2.jsp" />

				<div id="imgaeFormTitle" class="col-md-9 text-center">
					<h2>上傳您的房屋照片</h2>
					<hr>
				</div>

				<div class="col">
					<div id="imageUploadBox">
						<div class="col-md-11">
							<div class="input-group-addon" style="width: 2.6rem">
								<i class="far fa-image"></i>
							</div>

							<div class="file-loading form-group">
								<input id="housePicture" type="file" multiple class="form-group"
									data-overwrite-initial="false">
							</div>
							
							<input type="hidden" id="realUpload1" name="housePicture1">
							<input type="hidden" id="realUpload2" name="housePicture2">
							<input type="hidden" id="realUpload3" name="housePicture3">
							<input type="hidden" id="realUpload4" name="housePicture4">
						</div>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-md-5"></div>
					<div class="col-md-6">
						<button type="button" class="btn btn-success mr-5"
							name="previousPage" onclick="previousPage1();">上一頁</button>
						<button type="button" class="btn btn-success mr-5" name="nextPage"
							onclick="nextPage2();">下一頁</button>
					</div>

				</div>
			</div>

			<div id="rentDate" style="display: none">
				<!--	流程Bar Step2		-->
				<jsp:include page="stepBarProcess3.jsp" />
				
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<h2>設定非出租日期</h2>
						<hr>
						<span>您可以在此處設定您不希望出租的日期，這些日期您可以用來整理房屋，或是作為其他個人用途。</span>
					</div>
				</div>

				<div id="dateBox" class="mt-4">

					<div class="row mr-8">
						<div class="float-left mt-3">
							<h6>
								<strong class="text-danger">注意:</strong>
							</h6>
							<span><strong class="text-danger">*顧客不可於您選擇不出租的日期退房。</strong></span><br />
							<span><strong class="text-danger">*不出租的日期之間所空出的日期數，若</strong></span><br />
							<span><strong class="text-danger">&nbsp;&nbsp;小於您所設定的最小住宿天數，將使它</strong></span><br />
							<span><strong class="text-danger">&nbsp;&nbsp;們沒有機會出租。</strong></span><br />
						</div>
						<div class="col-md-4 mr-3">
							<input id="disabledDates" name="disabledDates" type="hidden"
								class="datepicker-here">
						</div>
						<br />
					</div>
				</div>

				<div class="row mt-5">
					<div class="col-md-5 mt-5"></div>
					<div class="col-md-6 mr-5">
						<button type="button" class="btn btn-success mt-4 mr-5"
							name="previousPage" onclick="previousPage2();">上一頁</button>
						<button type="submit" class="btn btn-success mt-4 mr-5"
							name="action" value="upload">
							<i class="fa fa-home"></i> 上架房屋
						</button>

					</div>
				</div>
			</div>
		</form>
	</div>
	</main>

	<jsp:include page="footer.jsp" />
	<!-- 套件的javascript檔 -->
	<script type="text/javascript" src="js/uploadhouse/sortable.js"></script>
	<script type="text/javascript" src="js/uploadhouse/fileinput.min.js"></script>
	<script type="text/javascript" src="js/uploadhouse/i18n/zh-TW.js"></script>
	<script type="text/javascript" src="js/uploadhouse/theme.explore.fa.js"></script>
	<script type="text/javascript" src="js/uploadhouse/theme.fa.js"></script>
	<script type="text/javascript" src="js/uploadhouse/datepicker.js"></script>
	<script type="text/javascript" src="js/uploadhouse/i18n/datepicker.zh.js"></script>
	<script>
department = new Array();
department[0] = [ "請選擇城市"];
department[1] = [ "基隆市Keelung", "台北市Taipei", "新北市NewTaipei", "桃園市Taoyuan",
		" 苗栗縣Miaoli", "台中市Taichung", " 彰化縣Changhua", "新竹市Hsinchu",
		"台南市Tainan", "高雄市Kaohsiung", "屏東縣Pingtung", "宜蘭縣Yilan",
		" 花蓮縣Hualien", "臺東市Taitung", "南投縣Nantou", " 雲林縣Yunlin",
		"嘉義市Chiayi", "金門縣Kinmen", "澎湖縣Penghu", "連江縣Lienchiang",
		"連江縣Lienchiang", "南海諸島" ]; //台灣

department[2] = [ "東京都Tokyo", "北海道Hokkaido", "青森縣Aomori-ken",
		"京都府Kyoto-hu", "岩手縣Iwate- ken", "大阪府Osaka -hu", "宮城縣Miyagi-ken",
		"滋賀縣Shiga-ken", "三重縣Mie-ken", "愛知縣Aichi-ken", "靜岡縣Shizuoka-ken",
		"鹿兒島縣	Kagoshima-ken", "岐阜縣Gifu-ken", "宮崎縣Miyazaki-ken",
		"長野縣Nagano-ken", "大分縣Oita-ken", " 山梨縣Yamanashi-ken",
		"熊本縣Kumamoto-ken", "福井縣Fukui- ken", "長崎縣Nagasaki-ken",
		"石川縣Ishikawa-ken", "佐賀縣Saga-ken", "富山縣Toyama-ken",
		"福岡縣Fukuoka-ken", " 新潟縣Niigata-ken", "高知縣Kochi-ken",
		"神奈川縣Kanagawa- ken", "愛媛縣Ehime-ken", "沖繩縣Okinawa-ken",
		"香川縣Kagawa-ken", "千葉縣Chiba-ken", "德島縣Tokushima-ken",
		"埼玉縣Saitama-ken", "山口縣Yamaguchi-ken", "群馬縣Gunma -ken",
		"廣島縣Hiroshima-ken", "栃木縣Tochigi-ken ", "岡山縣Okayama-ken",
		"茨城縣Ibaraki-ken", "島根縣Shimane-ken", "福島縣Fukushima-ken",
		"鳥取縣Tottori-ken", "兵庫縣Hyogo- ken", "秋田縣Akita-ken", "奈良縣Nara-ken",
		"和歌山縣Wakayama-ken" ];// 日本
department[3] = [ "首爾特別市Seoul", "全羅北道Jeollabuk-do", "釜山廣域市Busan",
		"全羅南道Jeollanam-do", "大邱廣域市Daegu", "慶尙北道Gyeongsangbuk-do",
		"仁川廣域市Incheon", "光州廣域市Gwangju", "大田廣域市Daejeon",
		"慶尙南道Gyeongsangnam-do",
		"濟州特別自治道Jeju Special Self-Governing Province",
		"世宗特別自治市Sejong Special Self-Governing City", "蔚山廣域市	Ulsan",
		"京畿道Gyeonggi-do", "江原道Gangwon-do", "忠淸北道Chungcheongbuk-do",
		"忠淸南道Chungcheongnam-do" ];

function renew(index) {

 var city = '${condition.city}';

	for (var i = 0; i < department[index].length; i++){
		if(department[index][i] == city){
			document.myForm.city.options[i] = new Option(department[index][i], department[index][i],"", true);// 設定新選項
		}else{
		document.myForm.city.options[i] = new Option(department[index][i], department[index][i]);// 設定新選項					
		}
	
	}
	document.myForm.city.length = department[index].length; // 刪除多餘的選項

}
</script>
	
	<script type="text/javascript">	
		//起始日期設定
		$('#startPicker').datepicker({
			language : 'zh',
			dateFormat : "yyyy/mm/dd",
			minDate : new Date(),
			autoClose : true
		})
		
		//結束日期設定
		$('#endPicker').datepicker({
			language : 'zh',
			dateFormat : "yyyy/mm/dd",
			minDate : new Date(),
			autoClose : true
		})

		//切換表單畫面(basic->image)
		function nextPage1() {
			var validResult = true;
			$('#basicData input').each(function() {
				var $thisVal = $(this).val();
				// 								console.log($(this));
				if ($thisVal == null || $thisVal.length == 0) {
					validResult = false;
					$('html,body').animate({
						scrollTop : 0
					}, 'fast'); // 返回到最頂上 
					console.log(this);
				}
				if (validResult) {
					$('#basicData').hide();
					$('#imageForm').show();
					$('html,body').animate({
						scrollTop : 0
					}, 'fast'); // 返回到最頂上 
				}
			});

			
			var geocoder = new google.maps.Geocoder();
			var addr = $("#address").val();
			geocoder.geocode({
                "address": addr
            }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var lat = results[0].geometry.location.lat();
                    var lng = results[0].geometry.location.lng();
                    $("#lat").val(lat);
                    $("#long").val(lng);
                } else {
                }
            });


		}
		
		
		//切換表單畫面(image->basic)
		function previousPage1() {
			$('#imageForm').hide();
			$('#basicData').show();
		}

		//切換表單畫面(basic->image->disabled date)
		function nextPage2() {
			var validResult = true;
			$('#imageForm input').each(function() {
				var $thisVal = $(this).val();
				// 								console.log($(this));
				if ($thisVal == null || $thisVal.length == 0) {
					validResult = false;
					$('html,body').animate({
						scrollTop : 0
					}, 'fast'); // 返回到最頂上 
					
				}
				if ($thisVal.length != 0) {
					$('#imageForm').hide();
					$('#rentDate').show();
					$('html,body').animate({
						scrollTop : 0
					}, 'fast'); 
				}
			});
			if (validResult) {
				$('#imageForm').hide();
				$('#rentDate').show();
				$('html,body').animate({
					scrollTop : 0
				}, 'fast');  
			}
		}
		
		//切換表單畫面(disabled->dateimage)
		function previousPage2() {
			$('#imageForm').show();
			$('#rentDate').hide();
		}

	
		//房屋圖片上傳
		$("#housePicture").fileinput(
				{
					language : "zh-TW",
					theme : 'fa',
					showCancel : false,
					showUpload : false,
					//uploadUrl : '#',
					overwriteInitial : false,
					allowedFileExtensions : [ 'jpg',
							'png', 'gif' ],
					overwriteInitial : false,
					//maxFileSize :0,
					maxFileCount : 4,
					//autoReplace:true,
					allowedFileTypes : [ 'image' ],
					slugCallback : function(filename) {
						return filename.replace('(',
								'_').replace(']', '_');
					},
					fileActionSettings : {
						showUpload : false,
					},
				});
		// 	$('#housePicture').on('change',function() {
		// 									console.log(this.files.length);
		// 								 	var x = this.files.length
		// 									for(var i=0;i<x;i++){
		// 									var reader = new FileReader();
		// 									reader.readAsDataURL(this.files[i]);
		// 									reader.onload = function() {
		// 									$('#realUpload'+(i+1)).attr("value",reader.result);
		// 										}
		// 									};
		// 									var reader = new FileReader();
		// 									reader.readAsDataURL(this.files[0]);
		// 									reader.onload = function() {
		// 									$('#realUpload1').attr("value",reader.result);
		// 									};
		// 									reader.onerror = function(error){
		// 									console.log('Error: ',error);
		// 										};
		// 									});
		//$('#housePicture').on('fileimagesloaded', function(event) {
		$('#housePicture')
				.on(
						'change',
						function() {
							var reader1 = new FileReader();
							reader1
									.readAsDataURL(this.files[0]);
							reader1.onload = function() {
								$('#realUpload1').attr(
										"value",
										reader1.result);
							};
							var reader2 = new FileReader();
							reader2
									.readAsDataURL(this.files[1]);
							reader2.onload = function() {
								$('#realUpload2').attr(
										"value",
										reader2.result);
							};
							var reader3 = new FileReader();
							reader3
									.readAsDataURL(this.files[2]);
							reader3.onload = function() {
								$('#realUpload3').attr(
										"value",
										reader3.result);
							};
							var reader4 = new FileReader();
							reader4
									.readAsDataURL(this.files[3]);
							reader4.onload = function() {
								$('#realUpload4').attr(
										"value",
										reader4.result);
							};
						});

		/*
		 $(".file").on('fileselect', function(event, n, l) {
		 alert('File Selected. Name: ' + l + ', Num: ' + n);
		 });
		 */

		 
		//設訂不出租日期DisabledDates
			$('#disabledDates').datepicker({
				language : 'zh',
				dateFormat : "yyyy/mm/dd",
				inline : true,
				multipleDates : true,
			})

			var disabledDates = $('#disabledDates').datepicker().data(
					'datepicker');

			var endPicker = $('#endPicker').datepicker().data(
					'datepicker');
			var startRentTime = $('#startRentTime');
			$('#startPicker').datepicker({
				onSelect : function(formattedDate, date, inst) {
					endPicker.update('minDate', date);
					disabledDates.update('minDate', date);
					startRentTime.attr("value", formattedDate);
				}
			});

			var startPicker = $('#startPicker').datepicker().data(
					'datepicker');
			var endRentTime = $('#endRentTime');
			$('#endPicker').datepicker({
				onSelect : function(formattedDate, date, inst) {
					startPicker.update('maxDate', date);
					disabledDates.update('maxDate', date);
					endRentTime.attr("value", formattedDate);
				}
			});
		
</script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2ZmHaImBG5OjV01QTIcTk73kMeuD8lHo&sensor=false"> -->
<!-- </script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2ZmHaImBG5OjV01QTIcTk73kMeuD8lHo&v=3.exp&sensor=false"></script>
 
</body>

</html>