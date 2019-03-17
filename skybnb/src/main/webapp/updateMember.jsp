<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="images/cloudy.png">
	<title>Skybnb 編輯基本資料</title>

	
<link rel="stylesheet"  href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">	
<link href="css/login.css" rel="stylesheet">	     
<link href="css/register.css" rel="stylesheet">
	     
<link href="css/updatemember/alertify.core.css" rel="stylesheet">  
<link href="css/updatemember/alertify.default.css" rel="stylesheet">  
<script src="js/updatemember/alertify.min.js"></script>
	     
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
  <form action="<c:url value="/updateRegister1.controller" />" method="POST" class="needs-validation"  onsubmit= "return formCheck() ">
   <div class="row">	
   
   
<div class="order-md-5 " style="margin-top: 210px;margin-left: 100px;">  
      
	       <div class="" id="result" style="height:280px;border-radius:50%;" >
	       		<img alt="" src="${memberforview.profilePicture}" style="height:280px;border-radius:50%;" id="picture">
	       </div>
	       
		   <div class=" mr-5">
		   	
         <label class="btn btn-info " style="margin-top:100px;margin-left: 40px;">              		 			 		
	          <input id="pic" type="file" style="display:none;" accept = "image/*" onchange = "selectFile()" />
	          <i class="fas fa-camera"></i>上傳圖片
         </label>
         
    		   <input type="hidden" id="realUpload" name="profilePicture" value="${memberforview.profilePicture}">
         	
         	</div>
          
          
			          <script type="text/javascript">          
          				$('#pic')
						.on('change',function selectFile() {
						var reader = new FileReader();
						reader.readAsDataURL(this.files[0]);
						reader.onload = function() {
							$('#realUpload').attr("value",reader.result);
							$("#picture").attr("src",reader.result);
							
// 					        var result = document.getElementById("result");
// 					        result.innerHTML = '<img src ="'+reader.result+'"/>';

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

<div class="col-md-8 order-md-1">
<!--     方法一:修改前端增加隱藏memberID的欄位  此為新增一個隱藏欄位給memberID回填     -->
    <input type="hidden" name="memberID" value="${memberforview.memberID}">



		<h2 class="text-center">編輯基本資料</h2>
      	  <hr class="featurette-divider">      
      	        
			<div class="form-group form-inline">
<!-- 			<label for="inputEmail" class="">帳號(信箱)</label> -->
				<i class="far fa-envelope fa-2x col-md-2 "></i>
				<input id="inputEmail" name="account" type="email" class="form-control w-75"  value="${memberforview.account}"  required>
				<div class="help-block with-errors"></div>
			</div>          
          
          
			<div class="form-group form-inline">
<!-- 				<label for="inputName">姓名</label> -->
				<i class="fas fa-user fa-2x col-md-2 "></i>	
				<input id="inputName" name="name" type="text" class="form-control w-75" value="${memberforview.name}" required>
				<div class="help-block with-errors"></div>
			</div>          
          

            <div class="row">
	             <div class="col-md-6 mb-3 form-inline">
<!-- 	              	<label for="inputPassword">重新輸入密碼</label> -->
	             <i class="fas fa-lock fa-2x col-md-2"></i>
			     <input id="inputPasswordtest" name="password" class="form-control w-75" value="${memberforview.password}" type="password" placeholder="" data-minlength="1"  required>
			     <div class="help-block with-errors"></div>
	        </div>
	              
	              
	        <div class="col-md-6 mb-3 form-group form-inline">  
<!-- 	              	<label for="inputPassword">確認密碼</label> -->
	              <i class="fas fa-lock fa-2x col-md-2"></i>
			 	  <input id="inputConfirmPassword" name="ConfirmPassword" class="form-control w-75" value="${memberforview.password}" type="password" placeholder="" data-minlength="1" required>
				  <div class="help-block with-errors"></div>
	              </div>
            </div>

					
				
			<div class="form-group mb-3 form-inline" >
<!-- 					<label for="birthday">生日</label> -->
				   <i class="fas fa-birthday-cake fa-2x col-md-2"></i> 
				   <input type="date" id="birthday" class="form-control w-75" name="birthday" value="${memberforview.birthday}" required>
			</div>	


		    <div class="form-group mb-3 form-inline">
<!-- 		     <label for="inputphone">電話</label> -->
				   <i class="fas fa-mobile-alt fa-2x col-md-2"></i>
		      	   <input type="text" id="inputphone" class="form-control  w-75" value="${memberforview.phone}" name="phone" required >
		    </div>


		     <div class="form-group mb-3 form-inline">
<!-- 		     <label for="inputaddress">地址</label> -->
		     	   <i class="fas fa-home fa-2x col-md-2"></i>
		      	   <input type="text" id="inputaddress" class="form-control w-75" value="${memberforview.address}" name="address" required >
		     </div>


            <div class="row">
		              <div class="col-md-6 mb-3 form-inline">
		                <i class="fas fa-globe-asia fa-2x col-md-2"></i>
				        <select class="custom-select  w-75" id="country" name="nationality" value="${memberforview.nationality}" required>
					        <option value="" >國籍</option>
					        <option  <c:if test="${memberforview.nationality == '台灣'}">selected</c:if> >台灣</option>
					        <option  <c:if test="${memberforview.nationality == '韓國'}">selected</c:if> >韓國</option>
					        <option  <c:if test="${memberforview.nationality == '日本'}">selected</c:if> >日本</option>
				        </select>
		               </div>
	              
		              <div class="col-md-6 mb-3 form-inline">
			                 <i class="fas fa-globe-asia fa-2x col-md-2"></i>
					         <select class="custom-select w-75" id="language" name="language" value="${memberInfo.language}" required >
						         <option value="">語言</option>
						         <option  <c:if test="${memberforview.language == '中文'}">selected</c:if> >中文</option>
						         <option  <c:if test="${memberforview.language == '英文'}">selected</c:if> >英文</option>
						         <option  <c:if test="${memberforview.language == '韓文'}">selected</c:if> >韓文</option>
						         <option  <c:if test="${memberforview.language == '日文'}">selected</c:if> >日文</option>			       
				             </select>
		              </div>
            </div>
            
         <button class="btn btn-lg btn-block bg-info text-white" type="submit">更改基本資料</button>
</div>
      </div>
     </form>
    </div>
   </div>

<jsp:include page="footer.jsp"/>
</body>
</html>