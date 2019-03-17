<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 訂單明細</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/orderlist/all.css">
<link rel="stylesheet" href="css/orderlist/orderlistdetail.css">

<script type="text/javascript">
	var index=0;
	var chkIndex=0;
</script>
<style>
#all {
	margin: 0px;
	background-size: 3096px auto;
	background-repeat: no-repeat;
	background-image: url("images/orderlist/bgImage03.jpg");
	filter: alpha(opacity = 50);
}
</style>

</head>



<body id="all">
<main role="main" class="mt-2"> <!-- 	以下為自己寫的部分 -->
<jsp:include page="navbar.jsp" />
	<form
		action="<c:url value="backtoorderlistdetail.controller?orderHouseNumber=${OrderLisResult.orderHouseNumber}&" />"
		class="form-signin text-center mt-5" method="post"
		onsubmit="return sentStart();">

		<div>
			

			<article id="artical01">
				<div class="detail">
					<table class="table table-hover borderless">
						<thead>
							<th id="title"><IMG id="mapicon"
								SRC="images/orderlist/mapicon.png" /> <strong id="text02">您的旅程</strong>
							</th>
						</thead>
						<tbody>

							<tr>
								<th scope="row">訂單編號:</th>
								<td>${OrderLisResult.orderHouseNumber}</td>
							</tr>

							<tr>
								<th scope="row">房間名稱:</th>
								<td>${HouseInforResult.houseName}</td>
							</tr>
							<tr>
								<th scope="row">房間類型 :</th>
								<td>${HouseInforResult.houseType}</td>
							</tr>
							<tr>
								<th scope="row">訂單日期 :</th>
								<td>${OrderLisResult.orderDate}</td>
							</tr>
							<tr>
								<th scope="row">入住日期 :</th>
								<td>${OrderLisResult.checkInDate}</td>
							</tr>
							<tr>
								<th scope="row">退房日期 :</th>
								<td>${OrderLisResult.checkOutDate}</td>
							</tr>

							<tr>
								<th scope="row">人數 :</th>
								<td>${OrderLisResult.numberOfPeople}</td>
							</tr>
							<tr>
								<th scope="row">紅利 :</th>
								<td>${OrderLisResult.bonus}</td>
							</tr>
							<tr>
								<th scope="row">總金額 :</th>
								<td>${OrderLisResult.checkoutAmount}</td>
							</tr>
							<tr>
								<th scope="row">星星總數 :</th>
								<td>${OrderLisResult.starCount}</td>

							</tr>
							<tr>
								<th scope="row">評論:</th>
								<td>${OrderLisResult.comment}</td>

							</tr>

						</tbody>
					</table>
				</div>
				<!-- detail -->

			</article>
			<aside>

				<section>
					
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
					<div id="map"></div>
					<script>
      var map;
      function initMap() {
    	  var Station_latlng = { lat:${HouseInforResult.mapLatitude}, lng:${HouseInforResult.mapLongitude} }; // 台北車站的經緯度
          var map = new google.maps.Map(document.getElementById('map'), {
              zoom: 14, //放大的倍率
              center: Station_latlng //初始化的地圖中心位置
          });
        
        var marker = new google.maps.Marker({
            position: Station_latlng, //marker的放置位置
            map: map //這邊的map指的是第四行的map變數
        });
        
        
      }
    </script>
					<script
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_4Shnu4et046_KkAG82zJYNLw8TPjbW8&callback=initMap"
						async defer>
    </script>
				</section>
				<section id="section2">
					<script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var stars = document.querySelectorAll("img");
                        var starsLen = stars.length;
                        // alert(starsLen);
                        for (var i = 0; i < starsLen; i++) {
                            stars[i].addEventListener("mouseover", mouseOver);
                            stars[i].addEventListener("mouseout", mouseOut);
                            stars[i].addEventListener("click", Click);
                            // stars[i].addEventListener("dblclick",Reset)
                        }
                        document.getElementById("resetbt").addEventListener("click",ResetBt);
                    });       
                
                    var trigger=false;
                    function mouseOver() {
                        // document.getElementById("idimg1").className="color";
                        //alert(starsLen);
                        if(trigger==false){
                            var stars = document.querySelectorAll("img");
                            var starsLen = stars.length;
                            for (var i = 0;i<this.id.substr(5); i++) {
                                document.getElementById("idimg"+(i+1)).className = "displaycolor";
                                // if(event.target.id == ("idimg"+(i+1))){
                                index=i+1;
                               	document.getElementById("score").innerHTML="目前顆數:<span class='num'> "+index+" </span>顆星";                   
                                // }
                                //console.log("mouseOver():"+index);
                            }
                        }
                    };       
                    function mouseOut() {
                        if(trigger==false)
                            // var stars = document.querySelectorAll("img");
                            // var starsLen = stars.length;
                            //alert(starsLen);
                            for (var i = 0; i <this.id.substr(5); i++) {
                                document.getElementById("idimg"+(i+1)).className = "nocolor";
                                document.getElementById("score").innerHTML="Mouseout目前顆數:<span class='num'> 0 </span>顆星";
                                console.log("mouseOut()INDEX:"+index);
                            }    
                        
                    };    
                    
                    function Click() {   
                    	
                        if(trigger==true){
                        	document.getElementById("score").innerHTML="";
                        }else{
                            document.getElementById("score").className="total";
                            document.getElementById("score").innerHTML=index;
                            //console.log("Click()目前顆星數:"+index) ;
                            chkIndex = index;
                        }
                         
                        trigger=true;      
                    };
            
                    function ResetBt(){
                        if(trigger==true){
                           //location.reload(); 
                        	document.getElementById("score").innerHTML="目前顆數:<span class='num'> 0 </span>顆星";
                        	document.getElementById("idimg1").className = "nocolor";
                        	document.getElementById("idimg2").className = "nocolor";
                        	document.getElementById("idimg3").className = "nocolor";
                        	document.getElementById("idimg4").className = "nocolor";
                        	document.getElementById("idimg5").className = "nocolor";
                        	chkIndex = 0;
                        	
                        }    
                        trigger=false;
                    };  
                    
                     function sentStart(){

                    	var $commentcolum = $("#comment").val();

                    	if(chkIndex!=0 && $commentcolum!=""){
                    		document.getElementById("score").value = index;
                    		
                         	document.getElementById("NextPagebtn").submit();
                        	return true;
                    	}else {
                     		return false;
                    	}
                				            				
                  	  }
                </script>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<h1>請先完成評分及評論!</h1>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>

								</div>
							</div>
						</div>
					</div>

					<h2 class="title">
						<strong>評分:</strong>
					</h2>
					<div class="allstars">
						<img id="idimg1" class="nocolor"
							src="images/orderlist/stars.png" /> <img id="idimg2"
							class="nocolor" src="images/orderlist/stars.png" /> <img
							id="idimg3" class="nocolor"
							src="images/orderlist/stars.png" /> <img id="idimg4"
							class="nocolor" src="images/orderlist/stars.png" /> <img
							id="idimg5" class="nocolor"
							src="images/orderlist/stars.png" /> <input type="hidden"
							required="required">
					</div>
					<div class="word">
						<input type="hidden" id="score" name="starCount" value="index">
						<!--目前顆數: 0 顆星-->

						<input type="hidden" id="getHouseStarAvg" name="houseID"
							value="${HouseInforResult.houseID}">
					</div>

					<div class="bt">
						<input type="button" name="dsubmit" id="resetbt" value="重新評分">
					</div>
				</section>
				<!-- id="section2" -->

				<section id="section3">
					<div id="comment-message" class="form-row">
						<textarea name="comment" placeholder="Message" id="comment"></textarea>
					</div>
				</section>

			</aside>
			
			

			<input type="submit" name="dsubmit" id="NextPagebtn"
				value="ForwardScroe" onclick="sentStart()"
				class="btn btn-primary mb1 black bg-darken-3" data-toggle="modal"
				data-target="#exampleModal">

			
		</div>
		<!-- all -->

	</form>
	<!-- 	以上為自己寫的部分 -->
</main>

<script type="text/javascript"> 
		
			
			if("${OrderLisResult.commentStatus}"=="true"){
 				$('#NextPagebtn').prop('disabled', true);
 				$('#NextPagebtn').val('Finshed');
			}else{

				$('#NextPagebtn').removeAttr('disabled');
			}
</script>

</body>

<jsp:include page="footer.jsp" />

</html>
<!-- 這行要加 -->



