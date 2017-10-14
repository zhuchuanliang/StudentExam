<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript">

var startTime = new Date();//这里的new Date()换成你后台传递的时间
var EndTime=startTime.getTime()+20*60*1000;//这个设置倒计时的时间，按毫秒算，也即60*1000就是一分钟
function GetRTime(){
var NowTime = new Date();
var nMS =EndTime - NowTime.getTime();
var nH=Math.floor(nMS/(1000*60*60)) % 24;
var nM=Math.floor(nMS/(1000*60)) % 60;
var nS=Math.floor(nMS/1000) % 60;
 document.getElementById("RemainH").innerHTML=nH;
 document.getElementById("RemainM").innerHTML=nM;
 document.getElementById("RemainS").innerHTML=nS;
if(nMS>5*59*1000&&nMS<=5*60*1000)
{
alert("还有最后五分钟！");
}
if(nH==0&&nM==0&&nS==0){
document.getElementById("myForm").submit();	
}
setTimeout("GetRTime()",1000);
}
window.onload=GetRTime;

</script>

</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考试时间：<strong>20分钟</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		剩余时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong id="RemainD"></strong><strong id="RemainH">XX</strong>时<strong id="RemainM">XX</strong>分<strong id="RemainS">XX</strong>秒</p>
		<hr/>
		<p class="examTitle">${paper.paperName}&nbsp;&nbsp;考试卷</p>
		<p class="examScoreInfo">(&nbsp;满分120&nbsp;&nbsp;单选题60分&nbsp;&nbsp;多选题60分&nbsp;)</p>
	</div>
	<div class="data_exam-content">
		<form action="exam!addScore" method="post" id="myForm">
			<input type="hidden" name="exam.student.id" value="${currentUser.id }">
			<input type="hidden" name="exam.paper.id" value="${paper.id }">
			<strong><big>一，单选题</big></strong>(每题20分，打错不得分)<br><br>
			<c:forEach var="s" items="${squestionList }" varStatus="status"> 
				<strong>[&nbsp;${status.count }&nbsp;]&nbsp;${s.subject }</strong><br>
				<label class="radio">
					<input type="radio" name="id-r-${s.id}" value="A">
					${s.optionA }
				</label>
				<label class="radio">
					<input type="radio" name="id-r-${s.id}" value="B">
					${s.optionB }
				</label>
				<label class="radio">
					<input type="radio" name="id-r-${s.id}" value="C">
					${s.optionC }
				</label>
				<label class="radio">
					<input type="radio" name="id-r-${s.id }" value="D">
					${s.optionD }
				</label>
				<br>
			</c:forEach>
			
			<br>
			
			<strong><big>一，多选题</big></strong>(每题30分，打错不得分)<br><br>
			<c:forEach var="m" items="${mquestionList }" varStatus="status"> 
				<strong>[&nbsp;${status.count }&nbsp;]&nbsp;${m.subject }</strong><br>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="A">
					${m.optionA }
				</label>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="B">
					${m.optionB }
				</label>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="C">
					${m.optionC }
				</label>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="D">
					${m.optionD }
				</label>
				<br>
			</c:forEach>
			<button class="btn btn-primary" type="submit">交卷</button>
		</form>
	</div>
	
</div>
</body>
</html>