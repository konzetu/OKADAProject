<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>返信</title>
<title>掲示板</title>
</head>
<style>
.hennji {
	margin-top: 50px;
	margin-left: 350px;
	color: #333;
}

.usern {
	color: #333;
	margin-left: 368px;
	margin-top: 0px:
	margin-
}

.threadt {
	color: #333;
	margin-left: 352px;
	margin-top:5px;
}

.tt {
	width: 400px;
	height: 100px;
	margin-left:455px;
	margin-top:-21px;
}

.thd {
	margin-top: 30px;
	margin-left: 350px;
}

.table2 {
	color: #333;
}

.enniu3 {
	background-color: #847bba;
	background-image: linear-gradient(to bottom, #847bba, #7568ba);
	border: 1px solid #493e87;
	box-shadow: inset 0 1px 0 #bab6d4, inset 0 -1px 0 #655aa1, inset 0 0 0
		1px #948dba, 0 2px 4px rgb(0 0 0/ 20%);
	color: white;
	text-shadow: 0 1px 2px rgb(0 0 0/ 30%);
	padding: 6px;
	margin-bottom: 20px;
	margin-top:18px;
	margin-left: 642px;
	border-radius: 5px;
}
</style>
<body>
	<section>
		<h2 class="hennji">返信</h2>
		<form method="get" action="Ress">
		<input type="hidden" value="${id}" name="id">

			<p class="usern">
				ユーザー名:<input type="text" name="user_name"
					value="">
			<div class="threadt">スレッド本文:</div>
			<textarea name="res_text" cols="30" rows="3" maxlength="80"
				wrap="hard" placeholder="80字以内で入力してください。" class="tt"></textarea>
			<div><input type="submit" value="投      稿" class="enniu3"></div>
		</form>

	</section>
	<table class="thd">
		<h2 align="center">コメント</h2>
		<tr>
			<th>ユーザー名&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
			<th>コメント</th>
		</tr>
		<c:forEach var="thread" items="${threads}">
			<tr>
				<td class="table1">${thread.user_name}</td>
				<td>${thread.res_text}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>