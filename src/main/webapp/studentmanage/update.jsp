<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp" %>
<%@include file="../sidebar.jsp" %>

<h2 class="studentmanage"
	style="
	width:79%;
	background-color:#DCDCDC; 
	padding: 5px; 
	margin-bottom: 10%;
	margin-left: 20%;">学生情報変更</h2>

<div style="text-align: center; overflow: hidden;">
<form action="../studentlist/StudentUpdate.action" method ="post">	
		<div style="display: flex;">
		
 		<label style="float: left; padding-left: 50px; padding-bottom: 40px;">入学年度</label>
 		<br>
 			 <input value="${student.ent_year}" readonly 
 			 style="width: 700px; height: 40px; margin: 40px 50px; border: none;">
 		</div>	 
 		<div style="display: flex;">	 
 		<label style="float: left; padding-left: 50px; padding-bottom: 40px;">学生番号</label>
 		<br>
 			<input type="text" value="${student.no}" name="no" readonly 
 			style="width: 700px; height: 40px; margin: 40px 50px; border: none;">
 			
 		</div>
 		
 		<div style="display: flex;">
		<label style="float: left; padding-left: 50px; padding-bottom: 50px;">氏名</label>
		<br>
			<input type="text" name="f1" required style="width: 700px; height: 40px; margin: 40px 80px; font-size:20px;">
		</div>
		<div style="display: flex;">
		<label style="float: left; padding-left: 50px; padding-bottom: 50px;">クラス番号</label>
		<br>
			<select class="form-select"id="select_class_num" name="f2" style="width: 700px; height: 40px; margin: 40px 35px;">
				<option value="0">------</option>
				<option value="101">101</option>			
				<option value="131">131</option>
				<option value="201">201</option>
			</select> 
		</div>
		<div>
		<label style="float: left; padding-left: 50px; padding-bottom: 50px;">在学中</label>
			<input class="form-check-input" type="checkbox"id="select_is_attend" name="f3" value="true" style=" margin: 40px 65px; float: left; width: 15px; height: 15px;">
		<br>
		</div>
		<div style="display: flex; padding: 60px 50px;">
			<input type="submit" value="変更" 
			style="	color: white;
					margin-top: 50px;
					cursor: pointer;
					height: 55px;
					width: 97px; 
					background-color: #87CEEB;
					border-radius: 1rem;
					border-style: none;">
		</div>
</form>
</div>

<%@include file="../footer.jsp" %>

