<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 更新房源</title>
<!-- Required meta tags -->
<style>
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 此網頁的css -->
<link href="css/changeHouse.css" rel="stylesheet">
<!-- fontAwesome -->
<link rel="stylesheet" 
				 href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				 integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
				 crossorigin="anonymous">
<!-- <link rel="stylesheet" href="fonts/css/all.css"> -->
<!-- 樣板及套件的css -->
<link rel="stylesheet" href="css/uploadhouse/stepBar.css">
<link rel="stylesheet" href="css/uploadhouse/fileinput.min.css">
<link rel="stylesheet" href="css/uploadhouse/theme.css">
<link rel="stylesheet" href="css/uploadhouse/datepicker.css" />

</head>

<body>
	<c:set var="houseInfo" value="${selectForOne }" />
	<header> <jsp:include page="navbar.jsp" /> </header>
	<main class="mt-3">
	<div class="container">
		<form class="form-horizontal" role="form" method="POST"
			action="houseinformation.controller">
			<div id="basicData">
				<div id="stepBar1" class="row bs-wizard" style="border-bottom: 0;">
					<div class="col-md-2 bs-wizard-step active">
						<div class="text-center bs-wizard-stepnum">步驟 1</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">更改房屋基本資料</div>
					</div>
					<div class="col-md-2 bs-wizard-step disabled">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 2</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">更新房屋照片</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 3</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">重新設定非出租日期</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- active -->
						<div class="text-center bs-wizard-stepnum">步驟 4</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">房屋資訊更新成功</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6 text-center">
						<h2>更改出租中的房屋</h2>
						<hr>
					</div>
				</div>
				<!-- 			houseID -->
				<input type="hidden" name="houseID" class="form-control"
					id="houseID" value="${selectForOne.houseID}">
				<!-- 			houseID -->
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
									id="houseName" placeholder="請輸入房間名稱" autofocus
									value="${selectForOne.houseName}">
							</div>
						</div>
					</div>
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
								<select id="houseType" name="houseType"
									class="house form-control">
									<option id="data" selected="selected"
										value="${selectForOne.houseType}">${selectForOne.houseType}</option>
									<option value="公寓">公寓</option>
									<option value="獨棟房屋">獨棟房屋</option>
									<option value="大廈">大廈</option>
									<option value="別墅">別墅</option>
								</select>
							</div>
						</div>
					</div>

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
								<select name="houseSpace" id="houseSpace"
									class="house form-control">
									<option selected="selected" value="${selectForOne.houseSpace}">${selectForOne.houseSpace}</option>
									<option value="false">與房東共同居住</option>
									<option value="true">房屋僅供房客居住</option>
								</select>

							</div>
						</div>
					</div>
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
									class="house form-control">
									<option selected="selected"
										value="${selectForOne.maxPeopleAvailable}">${selectForOne.maxPeopleAvailable}</option>
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
								<select name="country" id="country" class="house form-control">
									<option selected="selected" value="${selectForOne.country}">${selectForOne.country}</option>
									<option value="台灣">台灣</option>
									<option value="日本">日本</option>
									<option value="韓國">韓國</option>
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
									id="address" placeholder="請輸入房屋地址"
									value="${selectForOne.address}">
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
									placeholder="請輸入房間簡介">${selectForOne.houseIntroduction}</textarea>
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
									class="form-control" id="houseRules" placeholder="請輸入房間規範">${selectForOne.houseRules}</textarea>
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
									class="datepicker-here form-control"
									value="${selectForOne.startRentTime}" autocomplete="off">
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
									class="datepicker-here form-control" 
									value="${selectForOne.endRentTime}" autocomplete="off">
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
								<input type="text" id="price" name="price" class="form-control"
									value="${selectForOne.price}">
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
								<select id="freeCancel" name="freeCancel" class="form-control"
									value="${selectForOne.freeCancel}">
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
				<div id="stepBar1" class="row bs-wizard" style="border-bottom: 0;">
					<div class="col-md-2 bs-wizard-step complete">
						<div class="text-center bs-wizard-stepnum">步驟 1</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">更改房屋基本資料</div>
					</div>
					<div class="col-md-2 bs-wizard-step active">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 2</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">更新房屋照片</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 3</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">重新設定非出租日期</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- active -->
						<div class="text-center bs-wizard-stepnum">步驟 4</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">房屋資訊更新成功</div>
					</div>
				</div>

				<div id="imgaeFormTitle" class="col-md-9">
					<h2>上傳您的房屋照片</h2>
					<hr>
				</div>



				<div class="">

					<div class="col">
						<div id="imageUploadBox">
							<div class="col-md-11">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="far fa-image"></i>
								</div>

								<div class="file-loading form-group">
									<input id="housePicture" type="file" multiple
										class="form-group" data-overwrite-initial="false">
								</div>
								<input type="hidden" id="realUpload1" name="housePicture1"
									value="${selectForOne.housePicture1}"> <input
									type="hidden" id="realUpload2" name="housePicture2"
									value="${selectForOne.housePicture2}"> <input
									type="hidden" id="realUpload3" name="housePicture3"
									value="${selectForOne.housePicture3}"> <input
									type="hidden" id="realUpload4" name="housePicture4"
									value="${selectForOne.housePicture4}">
							</div>
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
				<div id="stepBar1" class="row bs-wizard" style="border-bottom: 0;">
					<div class="col-md-2 bs-wizard-step complete">
						<div class="text-center bs-wizard-stepnum">步驟 1</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">更改房屋基本資料</div>
					</div>
					<div class="col-md-2 bs-wizard-step complete">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 2</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">更新房屋照片</div>
					</div>

					<div class="col-md-2 bs-wizard-step active">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 3</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">重新設定非出租日期</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- active -->
						<div class="text-center bs-wizard-stepnum">步驟 4</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">房屋資訊更新成功</div>
					</div>
				</div>
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
					<div class="col-md-5" mt-5></div>
					<div class="col-md-6" mr-5>
						<button type="button" class="btn btn-success mt-4 mr-5"
							name="previousPage" onclick="previousPage2();">上一頁</button>
						<button type="submit" class="btn btn-success mt-4 mr-5"
							name="action" value="update">
							<i class="fa fa-home"></i> 更新房屋
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	</main>
	<footer> <jsp:include page="footer.jsp" /> </footer>
	<script type="text/javascript" src="js/uploadhouse/sortable.js"></script>
	<script type="text/javascript" src="js/uploadhouse/fileinput.min.js"></script>
	<script type="text/javascript" src="js/uploadhouse/i18n/zh-TW.js"></script>
	<script type="text/javascript"
	src="js/uploadhouse/theme.explore.fa.js"></script>
	<script type="text/javascript" src="js/uploadhouse/theme.fa.js"></script>
	<script type="text/javascript" src="js/uploadhouse/datepicker.js"></script>
	<script type="text/javascript"
	src="js/uploadhouse/i18n/datepicker.zh.js"></script>
	<script type="text/javascript" src="js/delDuplicate.js"></script>
	
	<script type="text/javascript">
	
		//替換0,1為文字
		$('#houseSpace option:contains("false")').text('與房東共同居住');
		$('#houseSpace option:contains("true")').text('房屋僅供房客居住');

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
				if ($thisVal == null || $thisVal.length == 0) {
					validResult = false;
					$('html,body').animate({
						scrollTop : 0
					}, 'fast'); // 返回到最頂上 
				}
			});
			if (validResult) {
				$('#basicData').hide();
				$('#imageForm').show();
				$('html,body').animate({
					scrollTop : 0
				}, 'fast'); 
			}
		}
		
		//切換表單畫面(image->basic)
		function previousPage1() {
			$('#imageForm').hide();
			$('#basicData').show();
		}

		//切換表單畫面(image->disabled date)
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
					}, 'fast'); // 返回到最頂上 
				}
			});
			if (validResult) {
				$('#imageForm').hide();
				$('#rentDate').show();
				$('html,body').animate({
					scrollTop : 0
				}, 'fast'); // 返回到最頂上 
			}
		}
	
		
		//切換表單畫面(disabled date->image)
		function previousPage2() {
			$('#imageForm').show();
			$('#rentDate').hide();
		}

		//圖片上傳
		$("#housePicture").fileinput(
				{
					language : "zh-TW",
					theme : 'fa',
					showCancel : false,
					showUpload : false,
					//uploadUrl : '#',
					allowedFileExtensions : [
							'jpg', 'png', 'gif' ],
					overwriteInitial : false,
					maxFileSize : 1000,
					maxFileCount : 0,
					//allowedFileTypes: ['image', 'video', 'flash'],
					slugCallback : function(
							filename) {
						return filename.replace(
								'(', '_').replace(
								']', '_');
					},
					fileActionSettings : {
						showUpload : false,
					},
					initialPreview : [
					// "<img src='${selectForOne.housePicture1}' class='file-preview-image kv-preview-data' style='width: auto;height: auto; max-width: 100%;max-height: 100%;'>",
					// "<img src='${selectForOne.housePicture2}' class='file-preview-image kv-preview-data' style='width: auto;height: auto; max-width: 100%;max-height: 100%;'>",
					// "<img src='${selectForOne.housePicture3}' class='file-preview-image kv-preview-data' style='width: auto;height: auto; max-width: 100%;max-height: 100%;'>",
					// "<img src='${selectForOne.housePicture4}' class='file-preview-image kv-preview-data' style='width: auto;height: auto; max-width: 100%;max-height: 100%;'>"
					],
				});
				$('#housePicture').on('change',function() {
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
				
				
				
			//設定非出租日期
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

</body>

</html>