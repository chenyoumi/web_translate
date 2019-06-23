    <%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
        <%@ page  import="java.util.*" %>
        <%@page import="java.security.MessageDigest"%> <!--引入加密包-->

        <!DOCTYPE html>
        <html>
        <head>
        <title>Insert title here</title>
        </head>
        <body>
            <%
            request.setCharacterEncoding("UTF-8");//设置统一字符编码

            String username = request.getParameter("name");
            String password = request.getParameter("passwd");

            MessageDigest md5 = MessageDigest.getInstance("md5");
            String passwdStr = "";
            byte[] by = md5.digest(password.getBytes());
            for (int i = 0; i < by.length; i++) {
                passwdStr += Byte.toString(by[i]);
            }

        %>
        <h1><%=username %></h1>
        <h1><%=password %></h1>
        <h1><%=passwdStr %></h1>
        </body>
        </html>