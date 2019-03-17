<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			
			<link rel="icon" href="images/cloudy.png">
			<title>Skybnb 註冊</title>
			
			    <meta charset="utf-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			    <meta name="description" content="">
			    <meta name="author" content="">
				
				 <link rel="stylesheet" 
				 href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				 integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
				 crossorigin="anonymous">
			
			     <link href="css/login.css" rel="stylesheet">
			     <link href="form-validation.css" rel="stylesheet">
			     <link href="css/register.css" rel="stylesheet">
			     
			     <link href="css/alertify.core.css" rel="stylesheet">  
				 <link href="css/alertify.default.css" rel="stylesheet">  
                 <script src="js/alertify.min.js"></script>  
			     
		</head>

		             <script type="text/javascript">
					       function formCheck(){
					       var inputPasswordtest = document.getElementById("inputPasswordtest").value;
					       var inputConfirmPassword = document.getElementById("inputConfirmPassword").value;
					       if(inputPasswordtest!=inputConfirmPassword){
					       alertify.alert('密碼輸入不正確喔!'); 
					       return false;
					       }
					       return true;
					    }
    				 </script>
		             <style>
							#result>img{
							border-radius:50%;
							height:100%
							}
		             </style>
<body class="bg-light">
  
		<header> 
			<jsp:include page="navbar.jsp"/>
		</header>
		
<div class="container">
 <div class="py-5 text-center ">  
   <form action="<c:url value="/Register.controller" />" method="post" class="needs-validation"  onsubmit= "return formCheck() ">
     <div class="row">	
        <div class="order-md-5 " style="margin-top: 210px;margin-left: 100px;">		              
		 	<div class="" id="result" style="height:280px;border-radius:50%;" ></div>
			 	<div class=" mr-5">	
				 	<label class="btn btn-info " style="margin-top:100px;margin-left: 40px;">
						<input id="pic" type="file" style="display:none;" accept = "image/*" onchange = "selectFile()" />
						<i class="fas fa-camera"></i> 上傳圖片
					</label>
					    <input type="hidden" id="realUpload" name="profilePicture" >
			    </div>
			          <script type="text/javascript">
				          	$('#pic')
							.on('change',function selectFile() {
										var reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function() {
											$('#realUpload').attr("value",reader.result);
									        var result = document.getElementById("result");
									        result.innerHTML = '<img src ="'+reader.result+'"/>';
										};
										reader.onerror = function(
												error) {
											console.log(
													'Error: ',
													error);
										};
									});
			          </script>       
		</div>
                      
<!--         下面是左框架 -->
        <div class="col-md-8 order-md-1">
	    	<h2 class="text-center">註冊</h2>
      			<hr class="featurette-divider">            
					<div class="form-group form-inline ">
					    <i class="far fa-envelope fa-2x col-md-2 "></i>
						<input id="inputEmail" name="account" type="email" class="form-control  w-75"  placeholder="電郵地址(帳號)" value="" required>
						<div class="help-block with-errors"></div>
					</div>          
      
					<div class="form-group form-inline">
						<i class="fas fa-user fa-2x col-md-2 "></i>		
						<input id="inputName" name="name" type="text" class="form-control w-75" placeholder="姓名" required>
						<div class="help-block with-errors"></div>
					</div>          
          
          
		            <div class="row ">
			              <div class="col-md-6 mb-3 form-inline">
			                <i class="fas fa-lock fa-2x col-md-2"></i>
							<input id="inputPasswordtest" name="password" class="form-control w-75" type="password" placeholder="設定密碼" data-minlength="1"  required>
							<div class="help-block with-errors"></div>
			              </div>
			              
			              <div class="col-md-6 mb-3 form-group form-inline">  
			                <i class="fas fa-lock fa-2x col-md-2"></i>
					 		<input id="inputConfirmPassword" class="form-control w-75" type="password" placeholder="確認密碼" data-minlength="1"  required>
							<div class="help-block with-errors"></div>
			              </div>
		            </div>
		            
						<div class="form-group mb-3 form-inline" >
							<i class="fas fa-birthday-cake fa-2x col-md-2"></i>
							<input type="date" id="bookdate" class="form-control w-75" name="birthday" placeholder="2010-01-01"  required>
						</div>	


					     <div class="form-group mb-3 form-inline">
					     	<i class="fas fa-mobile-alt fa-2x col-md-2"></i>
					      	<input type="text" id="inputphone" class="form-control w-75" placeholder="連絡電話" name="phone" required >
					     </div>



					     <div class="form-group mb-3 form-inline">
					     	<i class="fas fa-home fa-2x col-md-2"></i>
					      	<input type="text" id="inputaddress" class="form-control w-75" placeholder="地址" name="address" required >
					     </div>


			            <div class="row ">
					              <div class="col-md-6 mb-3 form-inline">
					              <i class="fas fa-globe-asia fa-2x col-md-2"></i>
							        <select class="custom-select  w-75" id="country" name="nationality" required>
								        <option value="">國籍</option>
								        <option>台灣</option>
								        <option>韓國</option>
								        <option>日本</option>
							        </select>
					              </div>
			              
			              
					              <div class="col-md-6 mb-3 form-inline">
					              <i class="fas fa-globe-asia fa-2x col-md-2"></i>
							          <select class="custom-select  w-75" id="language" name="language" required >
								         <option value="">語言</option>
								         <option>中文</option>
								         <option>英文</option>
								         <option>韓文</option>
								         <option>日文</option>
							         </select>
					              </div>
			            </div>    
         		<button class="btn btn-lg btn-block bg-info text-white" type="submit">註冊</button>
              </div>
           </div>
          </form>
        </div>
      </div>
		<jsp:include page="footer.jsp"/>	 
</body>
</html>