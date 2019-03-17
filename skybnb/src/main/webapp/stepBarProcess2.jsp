<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>StepBar2</title>
</head>
<body>
	<div id="stepBar1" class="row bs-wizard" style="border-bottom: 0;">
					<div class="col-md-2 bs-wizard-step complete">
						<div class="text-center bs-wizard-stepnum">步驟 1</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">填寫房屋基本資料</div>
					</div>
					<div class="col-md-2 bs-wizard-step active">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 2</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center text-body">上傳房屋照片</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- complete -->
						<div class="text-center bs-wizard-stepnum">步驟 3</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">設定非出租日期</div>
					</div>

					<div class="col-md-2 bs-wizard-step disabled">
						<!-- active -->
						<div class="text-center bs-wizard-stepnum">步驟 4</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
						<div class="bs-wizard-info text-center">房屋出租成功</div>
					</div>
				</div>
</body>
</html>