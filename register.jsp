    <%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
        <%@ page  import="java.util.*" %>
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
        %>
        <h1><%=username %></h1>
        <h1><%=password %></h1>
        </body>
        </html>