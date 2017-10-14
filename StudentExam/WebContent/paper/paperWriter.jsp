<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkForm(){
		var subject=$("#subject").val();
		var type=$("#type").val();
		var paperName=$("#paperName").val();
		var joinTime=$("#joinTime").val();
		var optionA=$("#optionA").val();
		var optionB=$("#optionB").val();
		var optionC=$("#optionC").val();
		var optionD=$("#optionD").val();
		var answer=$("#answer").val();
		if(subject==null || subject==""){
			$("#error").html("考试题目不能为空！");
			return false;
		}
		if(type==null || type==""){
			$("#error").html("请选择题目类型！");
			return false;
		}
		if(paperName==null || paperName==""){
			$("#error").html("请选择试卷！");
			return false;
		}
		if(joinTime==null || joinTime==""){
			$("#error").html("加入时间不能为空！");
			return false;
		}
		if(optionA==null || optionA==""){
			$("#error").html("选项一不能为空！");
			return false;
		}
		if(optionB==null || optionB==""){
			$("#error").html("选项二不能为空！");
			return false;
		}
		if(optionC==null || optionC==""){
			$("#error").html("选项三不能为空！");
			return false;
		}
		if(optionD==null || optionD==""){
			$("#error").html("选项四不能为空！");
			return false;
		}
		if(answer==null || answer==""){
			$("#error").html("答案不能为空！");
			return false;
		}
		return true;
	}
<script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>${title}</p>
	</div>
	<div class="data_content">
		<form action="paper!savePaper" method="post" onsubmit="return checkForm()">
			<table width="40%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>试卷名称:</label></td>
					<td><input type="text" id="paperName" name="paper.paperName" value="${paper.paperName}"></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="joinDate" name="paper.joinDate" value="${paper.joinDate }">
						<input type="hidden" id="id" name="paperId" value="${paper.id }">
						<button class="btn btn-primary" type="submit">保存</button>
					</td>
					<td>
						<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					    &nbsp;&nbsp;<font id="error" color="red">${error }</font>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>