<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 
<%
String url = "jdbc:mysql://localhost:3307/cakeStore?useUnicode=true&characterEncoding=utf8";
String username = "cakeStoreManager";
String userpass = "1004";
// 접속드라이버 연결
Class.forName("com.mysql.jdbc.Driver");
// 접속정보 세팅
Connection conn = DriverManager.getConnection(url, username, userpass);
//접속한 MySQL의 SQL실행 결과를 윟나 메모리 공간 확보
Statement stmt = conn.createStatement();

%>