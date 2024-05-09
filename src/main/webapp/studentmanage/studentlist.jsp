1<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>


<h2 class="studentmanage"
	style="
	width:79%;
	background-color:#DCDCDC; 
	padding: 5px; 
	margin-bottom: 5%;
	margin-left: 20%;">学生管理</h2>
<div style="width: 50%; margin-left: 30%">
	<section class="me-4" style="width: 100%;">
	<div class="my-2 text-end px-4" style="margin-bottom: 1rem; margin-left: 500px;">
		<a href="../studentmanage/insert.jsp">新規登録</a>
	</div>
	<form action="../student/StudentList.action" method="post">
	<div style="width: 700px;
				height: 150px;
				box-sizing: border-box;
 				margin: 1em 0;
  				padding: 3rem;
  				border-radius: 1em;
  				border: 2px solid gainsboro;">
				<label>入学年度</label> 
				<label style="padding-left: 150px;">クラス番号</label><br>
		<div style="display: flex; align-items: center;">
				<select class="form-select" id="select_ent_year" name="f1" 
				style="width: 200px; height: 30px; border-radius: 10px; padding-left: 3px; font-size: 18px;">
					<option value="0">------</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
				</select> 
				<select class="form-select"id="select_class_num" name="f2" 
				style="width: 200px; height: 30px; margin-left: 20px; border-radius: 10px; padding-left: 3px; font-size: 18px;">
					<option value="0">------</option>
					<option value="101">101</option>			
					<option value="131">131</option>
					<option value="201">201</option>
				</select>
		
				<input class="form-check-input" type="checkbox"id="select_is_attend" name="f3" value="true">
				<label>在学中</label>
		
				<button type="submit" style="margin-left: 20px;">絞り込み</button>			
			</div>
			</div>		
			</form>
		
		
	<c:choose>
	<c:when test="${empty list}">
		検索結果：${list.size() }件<br>
		学生情報が存在しませんでした。
	</c:when>
	<c:otherwise>
		検索結果： ${list.size() }件<br>
	
		<table style="border-collapse:  collapse;">
			<tr style="border-bottom:1px solid #000000;">
				<th>入学年度</th>
				<th>学生番号</th>
				<th>氏名</th>
				<th>クラス</th>
				<th class="text-center">在学中</th>
				<th></th>
				<th></th>
			</tr>
			
			<c:forEach var="student" items="${list}">
				<tr style="text-align: center; 
				border-bottom:1px solid gainsboro; padding: 30px 40px;">
				<form action="../student/StudentSelect.action">
					<td>${student.ent_year}</td>
					<td><input type="text" value="${student.no}" name="no" readonly style="border:none; text-align: center;"></td>
					<td>${student.name}</td>
					<td>${student.class_num}</td>
					<td>
					<c:choose>
						<c:when test="${student.is_attend}">
							〇
						</c:when>
						<c:otherwise>
							×
						</c:otherwise>
					</c:choose>
					</td>
					
					<td>
    					<input type="submit" value="変更">
					</td>
					</form>	
				</tr>
			</c:forEach>
			
	</table>
	</c:otherwise>
	</c:choose>
</section>
</div>
	<%@include file="../footer.jsp"%>