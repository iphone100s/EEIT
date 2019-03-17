<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">
<!-- 樣板及套件的css -->
<link rel="stylesheet"
	href="css/previewhouse/hotel-datepicker.css" />
<!-- 樣板及套件的js --><!-- 因為有用document.ready事件，放下面插件會壞掉 -->
<script type="text/javascript" src="js/previewhouse/fecha.js"></script>
<script type="text/javascript"
	src="js/previewhouse/hotel-datepicker.js"></script>
<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 預覽房源</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<header> 
		<jsp:include page="navbar.jsp"/>
	</header>
	<main role="main" class="mt-3"> 
    <div class="container">
    <div class="row">
     <div class="py-5 text-left col-md-8" >
       <h1 id="houseName"></h1>
		<h3 id="country" style="color:#880000;"></h3>
      </div>
      
      <div class="py-5 text-center col-md-4">
      	<br/><br/><br/><br/>
      	<form action="customerReport.jsp" onsubmit="return logincontrol();">
      		<form action="customerReport.jsp" onsubmit="return logincontrol();">
      		<input id="HouseMember" name="HouseMember" type="hidden" value="" >
      		<input id="MemberReport" name="MemberReport" type="hidden" value="${sessionScope.user}" >      
 			<img class="mr-2" src="images/chen/bad.png" width="33" height="33">
      		<input type="submit" value="客訴回報" class="btn btn-outline-danger" disabled>
      	</form>	
      	</form>	
      </div>
     </div>

      <div class="row">
      	<div class="col-md-4 order-md-2 mb-4">
<%--         <c:url value="OrderHouseController" /> --%>
        	<form action="<c:url value="OrderHouseController" />" class="form-signin text-center" method="post" onsubmit="return logincontrol();">
				<h3 class="h3 mb-3 font-weight-normal" id="price"></h3>
			
			<hr class="">
			<input type="hidden" name="memberID" value="${sessionScope.user}">
			<input type="hidden" name="houseID" value="${param.houseID}">
			<input type="hidden" name="checkoutAmount" value="" id="money">
			<label class="formword mt-3">入住日期</label> 
			<input type="text" class="formword form-control"
					id="hotelPicker" name="hotelPicker"  placeholder="入住 - 退房" autocomplete="off"><br />
			<input type="hidden" id="checkInDate"  name="checkInDate">
			<input type="hidden" id="checkOutDate" name="checkOutDate">
			<input type="hidden" id="orderedDates" name="orderedDates">
<!-- 			從DB抓已經被訂走的日期 -->
			<input type="hidden" id="orderedDatesFromDB" value="${param.orderedDates}">
<!-- 			從DB抓房東不出租的日期 -->
			<input type="hidden" id="disabledDatesFromDB" value="${param.disabledDates}">
			
			<script>
					//處理格式(被訂走的日期)
						var ordArray = $('#orderedDatesFromDB').val().split(',');
						for(var i = 0; i < ordArray.length; i++)
						{
						ordArray[i] = ordArray[i].replace('/', '-');
						ordArray[i] = ordArray[i].replace('/', '-');
						}	
					
					//處理格式(房東不出租的日期)
						var disArray = $('#disabledDatesFromDB').val().split(',');
						for(var i = 0; i < disArray.length; i++)
						{
						disArray[i] = disArray[i].replace('/', '-');
						disArray[i] = disArray[i].replace('/', '-');
						}	
						
					//合併兩個陣列
						cantSelect = ordArray.concat(disArray);
						
					
					//Hotel-DateRangePicker設定
						var input = document.getElementById('hotelPicker');
						var start = "${param.startRentTime}";
						var end = "${param.endRentTime}";
						var datepicker = new HotelDatepicker(input, {
							startDate : start,
							endDate : end,
							format : 'YYYY/MM/DD',
							disabledDates: cantSelect,
							onSelectRange: function() {
							   var orderRange = this.getValue();
							   console.log("Range = "+orderRange) //test
							   var orderRangeArray = orderRange.split("-");
							   var checkin = orderRangeArray[0];
							   var checkout = orderRangeArray[1];
							   var checkindate = $.trim(checkin);
							   var checkoutdate = $.trim(checkout);
							   $('#checkInDate').val(checkindate);
							   $('#checkOutDate').val(checkoutdate);
							   var Interval = getDates(new Date(checkindate), new Date(checkoutdate));//方法在下面     
							   console.log(Interval); //test
							   var newOrderedDates = ordArray.concat(Interval); //這邊取下來的ordArray是還沒轉換成"-"的，我懶得寫成funciton了
								for(var i = 0; i < newOrderedDates.length; i++)
								{
								newOrderedDates[i] = newOrderedDates[i].replace('/', '-');
								newOrderedDates[i] = newOrderedDates[i].replace('/', '-');
								}
							   $('#orderedDates').val(newOrderedDates);
							}
						});	
						
						//生成checkIn與checkOut之間的天數(含頭尾)
						var getDates = function(startDate, endDate) {
							  var dates = [],
							      currentDate = startDate,
							      addDays = function(days) {
							        var date = new Date(this.valueOf());
							        date.setDate(date.getDate() + days);
							        return date;
							      };
							  while (currentDate <= endDate) {
								currentDate = moment(currentDate).format('YYYY/MM/DD');
							    dates.push(currentDate);
							    currentDate = addDays.call(currentDate, 1);
							  }
							  return dates;
							};			
					</script>		
			<label class="formword mt-3">房客</label>
			<div class="form-group">
				<select id="people" name="numberOfPeople" class="form-control form-control-lg" required>
				</select>
			</div>
			<br /> <input type="submit" value="預訂" class="btn btn-primary" disabled>
		</form>
        </div>
        
        <div class="col-md-8 order-md-1">   
        	<h4 class="mb-3 text-secondary">房間設備</h4>        
            	<div class="row">
            		<div class="col-md-4 mb-3 order-md-2">
                		<img id="picture" class="ml-1" src="" width="220" height="140" alt="">
  						<hr/>
                		  
                	</div>
                	<div class="col-md-8 mb-3 order-md-1">
                			<table class="table table-borderless">
                				<tr id="facility1">
                				</tr>
                				<tr id="facility2">
                				</tr>
                				<tr id="facility3">
                				</tr>
                			</table>
                			<h4 class="mb-3 mt-5 text-secondary">房間介紹</h4> 
                			<p id="houseIntroduction"></p>
                			<h4 class="mb-3 mt-5 text-secondary">房間規範</h4> 
                			<p id="houseRules"></p>            			
                	</div>    
              	</div>
           
        </div>
      </div>
      </div>
	</main>

<jsp:include page="footer.jsp"/>
<!-- 此網頁的js -->

<script type="text/javascript">	
// function logincontrol(){
// 	var sessionname = "${sessionScope.username}";
// 	if(sessionname == ""){
// 		$(function() {
// 		    $('#exampleModalCenter').modal('show')
// 		});
// 		return false;
// 	}else{
// 		return true;
// 	}
// }	

$(document).ready(function() {
    var houseID = "${param.houseID}" ;
	$.ajax("${pageContext.request.contextPath}/house/"+houseID, {
			method: "GET",
	 	    dataType: "json"
	}).done(function(json){
		$("#HouseMember").val(json.memberID);
		$("#picture").attr("src", json.housePicture1);
		$("#houseName").html(json.houseName);
		$("#country").html(json.country);
		$("#country").append("  "+json.city);
		$("#price").html("$ " + json.price + " TWD <small>一晚</small>");
		$("#money").val(json.price);
		var temp1=  json.houseIntroduction.replace(/\n/g,"<br/>");
	    $("#houseIntroduction").html(temp1);
		var temp2=  json.houseRules.replace(/\n/g,"<br/>");
	    $("#houseRules").html(temp2);
	    
	    for(var x = 1 ; x <= json.maxPeopleAvailable ; x++){
	    	var text = $("#people").html();
	    	$("#people").html(text + "<option value=\""+x+"\">"+x+"</option>");
	    }
	    
	    var facility = json.facility;
	    var m = facility.split(",");
	    for(var y = 0 ; y < m.length-1 && y < 5 ; y++){
	    	$("#facility1").append("<td value=\""+m[y]+"\">- "+m[y]+"</td>");
	    }
	    for(var y = 5 ; y < m.length && y < 10 ; y++){
	    	$("#facility2").append("<td value=\""+m[y]+"\">- "+m[y]+"</td>");
	    }
	    for(var y = 10 ; y < m.length ; y++){
	    	$("#facility3").append("<td value=\""+m[y]+"\">- "+m[y]+"</td>");
	    }
	    
	}).fail(function(jsonX){
		alert("fail");
		console.log(jsonX.status);
	})

})
</script>


</body>

</html>