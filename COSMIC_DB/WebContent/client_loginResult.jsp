<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%! String name , id ,pw ,type ; %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
	<% 
	
	name= (String)session.getAttribute("name");
	id = (String) session.getAttribute("id");
	pw= (String) session.getAttribute("pw");
	type=(String) session.getAttribute("type");
	%>
	<%=type%>  
	<%=name%> 님 안녕하세요 <br/><br/> 
	<a href="join_page.html">화물 등록 </a><br/>
	<a href="client/client_search.html">화물 검색 </a><br/>
	<a href="client/client_modify.jsp">화물 삭제</a><br/>
	<a href="client/client_delete.jsp"></a><br/>
	


<body>
</body>
</html>