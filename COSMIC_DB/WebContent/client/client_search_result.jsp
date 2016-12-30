<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%!
 
 String id ,name , pw , phone1, phone2 ,phone3 ,email_1 , email_2,type;
 String level_ ,cargo_id, credit;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
당신이 검색한 아이디는 : <%=id %> 입니다 <br/><br/>
그에 대한 정보는 아래와 같습니다.<br/>
<%


name = (String)session.getAttribute("name");
id= (String)session.getAttribute("id");
pw= (String)session.getAttribute("pw");
phone1= (String)session.getAttribute("phone1");
phone2= (String)session.getAttribute("phone2");
phone3 = (String)session.getAttribute("phone3");
email_1 = (String)session.getAttribute("email_1");
email_2= (String)session.getAttribute("email_2");
type = (String)session.getAttribute("type");
level_ = (String)session.getAttribute("level_");
cargo_id = (String)session.getAttribute("cargo_id");
//credit = (String)session.getAttribute("credit");


%>

id:<%=id %><br/>
pw:<%=pw %><br/>
phone :<%=phone1 %> - <%=phone2 %>-<%=phone3 %><br/>
name: <%=name%><br/>
e-mail:<%=email_1%>@<%=email_2%><br/>
type:<%=type%><br/>
level:<%=level_%><br/>
cargo id:<%=cargo_id%><br/> 
credit :<%=credit%><br/>

<a href= "client_modify.jsp">선원정보 변경  </a><br/>
</body>
</html>