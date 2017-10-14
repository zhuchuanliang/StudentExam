<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>${title}</p>
	</div>
	<div class="data_content">
		<form action="question!save" method="post" onsubmit="return checkForm()">
			<table width="90%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>考试题目</albel></label>
					<td><input type="text" id="subject" value="${question.subject }" class="form-control" name="question.subject"></td>
				</tr>
				<tr>
					<td><label>题目类型</label></td>
					<td>
						<select id="type" name="question.type" class="form-control">
							<option value="">请选择题目类型...</option>
							<option value="1" ${question.type==1?'selected':''}>单选题</option>
							<option value="2" ${question.type==2?'selected':''}>多选题</option>
						</select>
					</td>			
				</tr>
				<tr>
					<td><label>所属试卷:</label></td>
					<td>
						<select id="paperName" name="question.paper.id" class="form-control">
							<option value="">请选择试卷...</option>
							<c:forEach var="paper" items="${paperList}">
								<option value="${paper.id}" ${paper.id==question.paper.id?'selected':'' }>${paper.paperName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>加入时间:</label></td>
					<td><input type="text" id="joinTime" class="Wdate" onclick="WdatePicker()" name="question.joinTime" value="<fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd"/>" ></td>
				</tr>
				<tr>
					<td><label>选项一:</label></td>
					<td><input type="text" id="optionA" name="question.optionA" class="form-control" value="${question.optionA}"></td>
				</tr>
				<tr>
					<td><label>选项二:</label></td>
					<td><input type="text" id="optionB" name="question.optionB" class="form-control" value="${question.optionB }" ></td>
				</tr>
				<tr>
					<td><label>选项三:</label></td>
					<td><input type="text" id="optionC" name="question.optionC" class="form-control" value="${question.optionC }"></td>
				</tr>
				<tr>
					<td><label>选项四:</label></td>
					<td><input type="text" id="optionD" name="question.optionD" class="form-control" value="${question.optionD }" ></td>
				</tr>
				<tr>
					<td><label>题目答案:</label></td>
					<td><input type="text" id="answer"  name="question.answer" class="form-control" value="${question.answer}"></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="questionId" name="question.id" value="${question.id}"><button class="btn btn-primary" type="submit">保存</button>
					</td>
					<td>
						<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>