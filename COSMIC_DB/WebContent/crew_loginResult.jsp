<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%! String name , id ,pw ,type ; %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<% 
	
	name= (String)session.getAttribute("name");
	id = (String) session.getAttribute("id");
	pw= (String) session.getAttribute("pw");
	type=(String) session.getAttribute("type");
	%>
	<%=type%>  
	<%=name%> 님 안녕하세요 <br/><br/> 
	<a href="join_page.html">화물 검색</a><br/>
	<a href="client/client_search.html">화물 선적</a><br/>
	<a href="client/client_modify.jsp">필요한 물품 신청</a><br/>
	<a href="client/client_delete.jsp">선적된 화물 검새</a><br/>
	<a href="client/client_delete.jsp">선박 상태 변경  </a><br/>
	
</body>
</html>