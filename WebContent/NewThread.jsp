<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<%@include file="common/header.jsp"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="keijiban.css" rel="stylesheet" type="text/css" media="all">
<title>掲示板</title>
</head>
<style>
.title {
	margin-top: 50px;
	margin-left: 445px;
	font-weight: bold;
	color: #333;
}

.category {
	margin-top: 20px;
	margin-left: 445px;
	font-weight: bold;
	color: #333;
}

.date {
	margin-top: 20px;
	margin-left: 445px;
	font-weight: bold;
}

.text {
	margin-top: 20px;
	width: 407px;
	height: 149px;
}

.nai {
	font-weight: bold;
	margin-left: 445px;
	margin-top:15px;
	color: #333;
}

.newth {
	margin-top: 50px;
}

#textarea {
	margin-top: -22px;
	margin-left:563px;
}

.enniu2 {
	background-color: #847bba;
	background-image: linear-gradient(to bottom, #847bba, #7568ba);
	border: 1px solid #493e87;
	box-shadow: inset 0 1px 0 #bab6d4, inset 0 -1px 0 #655aa1, inset 0 0 0
		1px #948dba, 0 2px 4px rgb(0 0 0/ 20%);
	color: white;
	text-shadow: 0 1px 2px rgb(0 0 0/ 30%);
	padding: 6px;
	margin-left: -10px;
	margin-top: 10px;
	border-radius: 5px;
}

.enniu2:disabled {
	background-image: linear-gradient(to bottom, white, white);
}
</style>
<body>
	<section>
		<h1 align="center" class="newth">新規投稿</h1>
		<form method="get" action="NewThread">
			<p class="title">
				タ &nbsp&nbspイ &nbspト &nbspル：<input id="title" size = "58" type="text"
					maxlength="50" placeholder="50文字以内" name="th_title" value="" onkeyup="checkLen1(this)"
            data-options="required:true">
			</p>
			<p class="category">
				カ テ&nbspゴ リ ー：<input type="text" maxlength="20" placeholder="20文字以内"
					name="th_category" value="" style="width:270px;" onkeyup="checkLen2(this)"
            data-options="required:true">
			</p>
			<div class="nai">
				内 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp容：</div>
				<textarea id="textarea" name="maintext" cols="60" rows="7"
					maxlength="1500" placeholder="1500文字以内でお願いします。" onkeyup="checkLen3(this)"
            data-options="required:true"></textarea>
			<p align="center">
				<input type="submit" id="btn" disabled="disabled" value="投      稿"
					class="enniu2">
			</p>
		</form>
	</section>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function checkLen1(obj){
    var maxChars = 50;
    if (obj.value.length > maxChars){
        alert("文字数が多い");
        obj.value = obj.value.substring(0,maxChars);
    }
}
function checkLen2(obj){
    var maxChars = 30;
    if (obj.value.length > maxChars){
        alert("文字数が多い");
        obj.value = obj.value.substring(0,maxChars);
    }
}
function checkLen3(obj){
    var maxChars = 1500;
    if (obj.value.length > maxChars){
        alert("文字数が多い");
        obj.value = obj.value.substring(0,maxChars);
    }
}
const title = document.getElementById('title');
const textarea = document.getElementById('textarea');
const btn = document.getElementById('btn');

title.addEventListener('keyup', (e) => {
	console.log(title.value.length, textarea.value.length);
  if (title.value.length > 0 && textarea.value.length > 0 ) {
    btn.disabled = false;
  }else{
    btn.disabled = true;
  }
});

textarea.addEventListener('keyup', (e) => {
	console.log(title.value.length, textarea.value.length);
  if (title.value.length > 0 && textarea.value.length > 0 ) {
    btn.disabled = false;
  }else{
    btn.disabled = true;
  }
});
</script>
</html>