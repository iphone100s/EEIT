<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 確認旅程詳情並選擇付款方式</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="css/form-validation.css" rel="stylesheet">
</head>

<body>
	<header> 
			<jsp:include page="navbar.jsp"/>
	</header>

	<main role="main" class="mt-3"> 
    <div class="container">
      <div class="py-5 text-left">
        <h4>確認旅程詳情並選擇付款方式</h4>
      </div>
      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
        	<div class="col-md-12 order-md-2 mb-4">
        		<img class="float-right ml-1" src="" width="135" height="80" alt="" id="picture">        
				<h6 id="houseName"></h6>
				<h6 id="country"  style="color:#880000;"></h6>
				</div> 				
		    <hr class="mb-4">
		    	<div class="col-md-12 order-md-2 mb-4">
		    		<img src="images/chen/people.png" width="25" height="25" alt="">
		    		<p class="float-right">${param.numberOfPeople} 位</p> <!-- 帶入人數 -->
		    	</div>
		    	<div class="col-md-12 order-md-2 mb-4">
		     		<img src="images/chen/calendar.png" width="25" height="25" alt="">
		     		<!-- 帶入日期 -->
		     		<p class="float-right">${param.checkInDate}<span class="ml-3 mr-3">  >  </span>${param.checkOutDate} </p>
		     		
		     	</div>
		     <hr class="mb-4">
		    	<div class="col-md-12 order-md-2 mb-4" id="total">
		    				     		
		     	</div>
		    	<div class="col-md-12 order-md-2 mb-4">
		    		服務費    <img tabindex="0" alt="" src="images/chen/question.png" width="18" height="18" data-trigger="focus" data-toggle="popover" data-content="新上架房源目前免服務費">
		     		<span class="float-right">$0</span>		     		
		     	</div>
		     	<div class="col-md-12 order-md-2 mb-4">
		    		清潔費    <img tabindex="0" alt="" src="images/chen/question.png" width="18" height="18" data-trigger="focus" data-toggle="popover" data-content="新上架房源目前免清潔費">
		     		<span class="float-right">$0</span>		     		
		     	</div>
		     <hr class="mb-4">
		     	<div class="col-md-12 order-md-2 mb-4">
		    		總價(TWD)
		     		<span class="float-right" id="amount"></span>		     		
		     	</div>
		     	<div class="col-md-12 order-md-2 mb-4">
		     		<small class="text-muted">報價中包含適用匯率。</small>
		     	</div>
        </div>
       
        <div class="col-md-8 order-md-1">
        	
            	<div class="row">
            		<div class="col-md-12 mb-3">
                		<h4 class="mb-3">確認旅程詳情</h4>
                	</div>
                	<div class="col-md-12 mb-3">
                		<h5 class="mb-3 text-secondary">房間設備</h5>
                			<table class="table table-borderless">
                				<tr id="facility1">
                				</tr>
                				<tr id="facility2">
                				</tr>
                				<tr id="facility3">
                				</tr>
                			</table>
                	</div>
                	<div class="col-md-12 mb-3">
                		<h5 class="mb-3 mt-5 text-secondary">房間介紹</h5>
                			<p id="houseIntroduction"></p>
                		<h5 class="mb-3 mt-5 text-secondary">房間規範</h5>
                			<p id="houseRules"></p>
                	</div>
              	</div>
           		
           		
           		<div class="row">
            		<div class="col-md-12 mb-3">
                		<h4 class="mb-3">選擇付款方式</h4>
                	</div>
                	
                	<div class="col-md-6 mb-3 text-center">
                		<h5 class="mb-3">歐付保</h5>
                		<form action="<c:url value="OPayController" />" method="post">
                			<input type="hidden" name="houseID" value="${param.houseID}">
                			<input type="hidden" name="checkoutAmount" value="" id="inputtotal">
                			<button class="btn btn-link btn-block"><img src="images/chen/OPayLogo.png" width="100" height="39"></button>
                		</form>
                	</div>
                	
                	<div class="col-md-6 mb-3 text-center">
                		<h5 class="mb-3">linePay</h5>

                		<button class="btn btn-link btn-block" type="button" id="linepay"><img src="images/chen/LinePayLogo.png"></button>

                	</div>  	
              	</div>
        </div>
      </div>  
      </div>
	</main>
<jsp:include page="footer.jsp"/>
<script>
$(document).ready(function() {
	var totalamount ="";
	var number = "${requestScope.number}";
	var Name = "";
	$("#linepay").click(function(event) {
		$.ajax("LinePayController",{
			method:"POST",
			data:{amount:totalamount, productName:Name ,orderId:number}
		}).done(function(json){
			window.location.href = json;
		}).fail(function(jsonX){
			alert("fail");
		})	
	})
	
	
	$(function () {
		  $('[data-toggle="popover"]').popover();
		  $('.popover-dismiss').popover({
			  trigger: 'focus'
			})
		})
	
    var houseID = "${param.houseID}";
	$.ajax("${pageContext.request.contextPath}/house/"+houseID, {
			method: "GET",
	 	    dataType: "json"
	}).done(function(json){
		Name = json.houseName;
		$("#picture").attr("src", json.housePicture1);
		$("#houseName").html(json.houseName);
		$("#country").html(json.country);
		$("#country").append("  "+json.city);
		$("#price").html("$ " + json.price + " TWD <small>一晚</small>");
		var temp1=  json.houseIntroduction.replace(/\n/g,"<br/>");
	    $("#houseIntroduction").html(temp1);
		var temp2=  json.houseRules.replace(/\n/g,"<br/>");
	    $("#houseRules").html(temp2);
		
		var facility = json.facility;
	    var m = facility.split(",");
	    for(var y = 0 ; y < 5 && y < m.length-1 ; y++){
	    	$("#facility1").append("<td value=\""+m[y]+"\">- "+m[y]+"</td>");
	    }
	    for(var y = 5 ; y < 10 && y < m.length-1 ; y++){
	    	$("#facility2").append("<td value=\""+m[y]+"\">- "+m[y]+"</td>");
	    }
	    for(var y = 10 ; y < m.length ; y++){
	    	$("#facility3").append("<td value=\""+m[y]+"\">- "+m[y]+"</td>");
	    }
	    
	    var checkInDate = "${param.checkInDate}";
	    var checkOutDate = "${param.checkOutDate}";
	    var aDate, oDate1, oDate2, iDays
	    aDate = checkInDate.split("-")
	    oDate1 = new Date(aDate[1] + '/' + aDate[2] + '/' + aDate[0]) 
	    aDate = checkOutDate.split("-")
	    oDate2 = new Date(aDate[1] + '/' + aDate[2] + '/' + aDate[0])
	    iDays = parseInt(Math.abs(oDate1 - oDate2)/1000/60/60/24); 
	    
		totalamount = iDays*json.price;
	    
	    $("#total").html("$ " +json.price+ " x " +iDays+ " 晚" +"<span class=\"float-right\">$ "+totalamount +"</span>");
	    $("#amount").html("$ " +totalamount);
	    $("#inputtotal").val(totalamount);
	}).fail(function(jsonX){
		alert("fail");
		console.log(jsonX.status);
	})
	
})
</script>
</body>

</html>