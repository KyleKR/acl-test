<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="twitter4j.Twitter" %>
<%@ page import="twitter4j.TwitterFactory" %>
<%@ page import="twitter4j.auth.RequestToken" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<%
String consumerKey = "cKclUsPKaN91RFpRam2t16rNe";
String consumerSecret = "MCzCE0Sy6NrGqX1ORYSkaoBTwiWehB9TdiVMk233oy8wrrqjF7";
Twitter twitter = new TwitterFactory().getInstance();
//twitter로 접근한다.
twitter.setOAuthConsumer(consumerKey, consumerSecret);

//성공시 requestToken에 해당정보를 담겨져온다.
RequestToken requestToken =  twitter.getOAuthRequestToken();

//requestToken 을 반드시 세션에 담아주어야 한다.
request.getSession().setAttribute("requestToken", requestToken);
String authUrl = requestToken.getAuthorizationURL();  //접속할 url값이 넘어온다.
String accessToken = requestToken.getToken(); //token값을 가져온다.
String tokenSecret = requestToken.getTokenSecret(); //token Secret값을 가져온다.
%>
authUrl: <%=authUrl%><br/>
accessToken: <%=accessToken%><br/>
tokenSecret: <%=tokenSecret%><br/>

<a href="<%=authUrl%>">[로그인]</a>
</body>
</html>