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
	margin-left: 367px;
	margin-top: 5px;
}

.tt {
	width: 400px;
	height: 100px;
	margin-left: 455px;
	margin-top: -21px;
}

.thd {
	margin-top: 30px;
	margin-left: 350px;
	white-space: pre-wrap;
	word-wrap: break-word;
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
	margin-top: 18px;
	margin-left: 642px;
	border-radius: 5px;
}

.enniu3:disabled {
	background-image: linear-gradient(to bottom, white, white);
}

.main {
	margin: 10px 350px;
	white-space: pre-wrap;
	word-wrap: break-word;
}

.table1 {
	vertical-align: top;
	padding: 5px;
	white-space: pre-wrap;
	word-wrap: break-word;
}

#contents {
	display: flex;
	padding: 40px;
	box-sizing: border-box;
}

#main {
	box-sizing: border-box;
	height: 2000px;
	flex: 1;
}

#sub {
	box-sizing: border-box;
	width: 90px;
	margin-right: auto;
}

#sub .box {
	position: sticky;
	top: 25px;
	width: 100%;
	height: 300px;
}
</style>
<body>
	<div id="contents">
		<aside id="sub">
			<div class="box">
				<section>
					<h2>返信</h2>
					<form method="get" action="Ress">

						<c:forEach var="thread" items="${threads}">
							<input id="id" name="th_id" type="hidden" value="${thread.th_id}">
						</c:forEach>

						<input type="hidden" value="${id}" name="id">


						<p>
							ユーザー名:<input type="text" name="user_name" value="" maxlength="20"
								placeholder="20文字以内" onkeyup="checkLen2(this)"
								data-options="required:true">
						<div>レ ス 本 文:</div>
						<textarea id="res_text" name="res_text" cols="30" rows="3"
							maxlength="80" wrap="hard" placeholder="80字以内で入力してください。"
							onkeyup="checkLen3(this)" data-options="required:true"></textarea>
						<div>
							<input type="submit" id="btn" disabled="disabled"
								value="投      稿">
						</div>

					</form>

				</section>
			</div>
		</aside>
		<main id="main">
			<table>
				<h2 align="center">タイトル</h2>
				<c:forEach var="thread" items="${threads}">
					<tr>
						<td><p class="main">${thread.name}</p></td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<h2 align="center">本文</h2>
				<c:forEach var="thread" items="${threads}">
					<tr>
						<td><p class="main">${thread.th_detalis}</p></td>
					</tr>
				</c:forEach>
			</table>
			<table class="thd">
				<h2 align="center">コメント</h2>
				<tr>
					<td class="table1">ユーザー名</td>
					<td class="table1">コメント</td>
					<td class="table1">日付</td>
				</tr>
				<c:forEach var="thread" items="${threads}">
					<tr>
						<td class="table1">${thread.user_name}</td>
						<td class="table1">${thread.res_text}</td>
						<td class="table1">${thread.res_date}</td>
					</tr>
				</c:forEach>
			</table>
		</main>

	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function checkLen2(obj){
    var maxChars = 30;
    if (obj.value.length > maxChars){
        alert("文字数が多い");
        obj.value = obj.value.substring(0,maxChars);
    }
}
function checkLen3(obj){
    var maxChars = 80;
    if (obj.value.length > maxChars){
        alert("文字数が多い");
        obj.value = obj.value.substring(0,maxChars);
    }
}
const id = document.getElementById('id');
const res_text = document.getElementById('res_text');
const btn = document.getElementById('btn');

id.addEventListener('keyup', (e) => {
	console.log(id.value.length, res_text.value.length);
  if (id.value.length > 0 && res_text.value.length > 0 ) {
    btn.disabled = false;
  }else{
    btn.disabled = true;
  }
});

res_text.addEventListener('keyup', (e) => {
	console.log(id.value.length, res_text.value.length);
  if (id.value.length > 0 && res_text.value.length > 0 ) {
    btn.disabled = false;
  }else{
    btn.disabled = true;
  }
});
</script>

</html>