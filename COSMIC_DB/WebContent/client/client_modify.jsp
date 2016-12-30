<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%!
    	Connection connection;
    	Statement statement;
    	ResultSet resultSet ,resultSet2;
    
    	String name, id, pw, phone1, phone2, phone3, type , cargo_id ,level_, credit,email_1,email_2;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
	id = (String)session.getAttribute("id");
	String query = "select * from member where id = '" + id + "'";
	String query2="select * from client where id = '" + id + "'";

	
			
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "cosmic" , "cosmic");
	statement = connection.createStatement();
	resultSet =  statement.executeQuery(query);
	
	while(resultSet.next()) {
		name = resultSet.getString("name");
		pw = resultSet.getString("pw");
		phone1 = resultSet.getString("phone1");
		phone2 = resultSet.getString("phone2");
		phone3 = resultSet.getString("phone3");
		email_1= resultSet.getString("email_1");
		email_2 = resultSet.getString("email_2");
		
		type = resultSet.getString("type");
		
	}
	resultSet2 =  statement.executeQuery(query2);
	
	while(resultSet2.next()){
		cargo_id = resultSet2.getString("cargo_id");
		level_ = resultSet2.getString("level_");
		credit = resultSet2.getString("credit");
	}
	
	%>
	
	<form action="ModifyOk" method="post">
		이름 : <input type="text" name="name" size="10" value=<%=name %>><br />
		아이디 : <%=id %><br />
		비밀번호 : <input type="text" name="pw" size="10"><br />
		전화번호 : <select name="phone1">
			<option value="010">010</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			<option value="011">011</option>
		</select> - 
		전화번호:<input type="text" name="phone2" size="5" value=<%=phone2 %>> - <input type="text" name="phone3" size="5" value=<%=phone3 %>> <br />
		이메일: <input type="text" name="email_1" size="5" value=<%=email_1%>>@<input type="text" name="email_2" size="5" value=<%=email_2 %>> <br />
		화물 번호:<input type="text" name="cargo_id" size="5" value=<%=cargo_id%>><br />
		고객 등급: <select name="level_">
			<option value="gold">gold</option>
			<option value="silver">silver</option>
			<option value="017">bronze</option>
			<option value="guest">guest</option>
		</select> <br />
		적립금:<input type="text" name="credit" size="5" value=<%=credit%>><br />
		
		<input type="submit" value="정보수정"> <input type="reset" value="취소">
	</form>
	
</body>
</html>