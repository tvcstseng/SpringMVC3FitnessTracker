<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Minutes</title>

<script type="text/javascript" src="jquery-1.11.3.js"> </script>

<script type="text/javascript">
	$(document).ready(
		function(){
			//$.getJSON('http://localhost:8080/FitnessTracker/activities.json', {			
			$.getJSON('<spring:url value="activities.json"/>', {			
				ajax : 'true'
			}, function(data){
				var html = '<option value="">--Please select one--</option>';
				var len = data.length;
				for(var i = 0; i < len; i++){
					html += '<option value="' + data [i].desc + '">'
						+ data[i].desc + '</option>';
				}
				html += '</option>';
				
				$('#activities').html(html);
			});
		}
	);		
</script> 

</head>
<body>
	<h1>Add Minutes Exercised</h1>
	
	language : <a href="?language=en">English</a> | <a href="?language=es">Spanish</a>
	
	<form:form commandName="exercise">
		<table>
			<tr>
				<td><spring:message code="goal.text" /></td>
				<td><form:input path="minutes" /></td>
				<td>
					<form:select id="activities" path="activity"></form:select>
				</td>
			</tr>

			<tr>
				<td colspan="3"><input type="submit" value="Enter Exercise" />
				</td>
			</tr>
		</table>
	</form:form>
	
	<h1>Our goal for the day is: ${goal.minutes}</h1>
	
</body>
</html>