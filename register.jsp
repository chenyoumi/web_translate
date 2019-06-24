    <%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
        <%@ page  import="java.util.*" %>
        <%@ page  import="java.sql.*"%>
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
            <p><b>JDBC连接数据库</b></p>
        <%
             Connection con=null;
             String DriverName="com.mysql.jdbc.Driver";
             String DBname="jdbc:mysql://47.98.189.231:3306/web_translate";
             String DBuser="root";
             String DBcode="4580c4da7414ea8a";

            try
            {
                con=DriverManager.getConnection(DBname,DBuser,DBcode);
            }

            catch(SQLException e)
            {
                out.print(e.toString());
            }
        %>

            <p><b>JDBC连接数据库测试结果</b></p>
        <%
            if(con!=null)
            {
                DatabaseMetaData dbmeta=con.getMetaData() ;
                out.print("<br><b>数据库产品：</b>"+dbmeta.getDatabaseProductName());
                out.print("<br><b>数据库版本：</b>"+dbmeta.getDatabaseProductVersion());
                out.print("<br><b>用户名：</b>"+dbmeta.getUserName());
                out.print("<br><b>测试连接成功 ! </b>");
                try{con.close();}
                catch(Exception e){}
            }
            else
                out.print("<br><b>连接失败</b>");
        %>


        <h1><%=username %></h1>
        <h1><%=password %></h1>
        <h1><%=passwdStr %></h1>
        </body>
        </html>