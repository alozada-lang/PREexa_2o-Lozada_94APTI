<%-- 
    Document   : filtro_waf
    Created on : 9/04/2026, 11:23:05 AM
    Author     : PC-13
--%>

<%@ page import="java.sql.*, java.util.*, java.util.regex.*" %>
<%
    String[] blacklisted = {"(?i)<script.*?>", "(?i)OR\\s+['\"]?\\d+", "(?i)DROP\\s+TABLE"};
    Enumeration<String> params = request.getParameterNames();
    while (params.hasMoreElements()) {
        String name = params.nextElement();
        String val = request.getParameter(name);
        for (String p : blacklisted) {
            if (Pattern.compile(p).matcher(val).find()) {
                // Registrar en log y bloquear
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pre_examen", "root", "");
                PreparedStatement ps = cn.prepareStatement("INSERT INTO t_logs_waf (ip_address, payload) VALUES (?,?)");
                ps.setString(1, request.getRemoteAddr());
                ps.setString(2, name + "=" + val);
                ps.executeUpdate();
                out.print("<h1 style='color:red;'>WAF: Intento de ataque bloqueado</h1>");
                return;
            }
        }
    }
%>