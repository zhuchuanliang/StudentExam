<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p><label>查看试题</label></p>
	</div>
	<div class="data_content">
		<table width="90%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
			<tr>
				<td><label>考试题目</albel></label>
				<td><textarea cols="4" rows="5" id="subject" class="form-control"  readonly="readonly">${question.subject}</textarea></td>
			</tr>
			<tr>
				<td><label>题目类型</label></td>
				<td>
					<c:choose>
						<c:when test="${question.type==1}">
							<input type="" id="type" class="form-control" value="单选题" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input type="text" id="type" class="form-control" value="多选题" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</td>			
			</tr>
			<tr>
				<td><label>所属试卷:</label></td>
				<td><input type="text" id="paperName" class="form-control" value="${question.paper.paperName }" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>加入时间:</label></td>
				<td><input type="text" id="joinTime" class="form-control" value="<fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd"/>" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>选项一:</label></td>
				<td><input type="text" id="optionA" class="form-control" value="${question.optionA}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>选项二:</label></td>
				<td><input type="text" id="optionB" class="form-control" value="${question.optionB}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>选项三:</label></td>
				<td><input type="text" id="optionC" class="form-control" value="${question.optionC}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>选项四:</label></td>
				<td><input type="text" id="optionD" class="form-control" value="${question.optionD}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>题目答案:</label></td>
				<td><input type="text" id="paperName" class="form-control" value="${question.answer}" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>