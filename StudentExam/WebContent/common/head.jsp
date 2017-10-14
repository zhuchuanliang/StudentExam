<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<div style="background:url('${pageContext.request.contextPath}/image/banner.jpg');height:90px;width:1000px;float:right;">
	 <font style="float:right;padding:65px 20px 20px 10px;">欢迎:<strong>${currentUser.name}</strong></font>
	</div>
</div>
</body>
</html>