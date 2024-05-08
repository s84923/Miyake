<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp" %>
<%@include file="../sidebar.jsp" %>


<h2 class="studentmanage"
	style="
	width:79%;
	background-color:#DCDCDC; 
	padding: 5px; 
	margin-bottom: 10%;
	margin-left: 20%;">学生登録</h2>

<div style="text-align: center; overflow: hidden;">
<form action="../studentlist/StudentCreate.action" method="post">
	<label style="float: left; padding-left: 170px">入学年度</label><br> 
		<select class="form-select" id="ent_year" name="ent_year" style="width: 700px; height: 40px;">
			<option value="0">------</option>
			<option value="2020">2020</option>
			<option value="2021">2021</option>
			<option value="2022">2022</option>
			<option value="2023">2023</option>
			<option value="2024">2024</option>
		</select>
		
	<br>
	<label style="float: left; padding-left: 170px">学生番号</label><br>
		<input type="text" name="no" placeholder="学生番号を入力してください。" required
		style="width: 700px; height: 40px;">
	<br>
	<label style="float: left; padding-left: 170px">氏名</label><br>
		<input type="text" name="name" placeholder="氏名を入力してください。" required
		style="width: 700px; height: 40px;">
	<br>
	<label style="float: left; padding-left: 170px">クラス</label><br>
		<select class="form-select" id="class_num" name="class_num" style="width: 700px; height: 40px;">
			<option value="0">------</option>
			<option value="131">131</option>
			<option value="201">201</option>
			<option value="101">101</option>
		</select>
	<br>
	<input type="submit" value="登録して終了" 
			style="	color: white;
					margin-top: 50px;
					cursor: pointer;
					height: 55px;
					width: 97px; 
					background-color: #87CEEB;
					border-radius: 1rem;
					border-style: none;">
</form>
</div>


<%@include file="../footer.jsp" %>
