<%-- 
    Document   : index
    Created on : 9/04/2026, 11:21:47 AM
    Author     : PC-13
--%>

<%@ page import="java.sql.*" %>
<%@include file="filtro_waf.jsp" %> <%-- ¡Seguridad ante todo! --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>SegurEmpresa - ASI</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #2c3e50; color: white; }
        .btn { padding: 8px 12px; text-decoration: none; border-radius: 4px; color: white; }
        .btn-add { background: #27ae60; }
        .btn-edit { background: #2980b9; }
        .btn-del { background: #c0392b; }
    </style>
</head>
<body>
    <h1>Plataforma ASI: Consejos y Legislación Empresarial</h1>
    <p>Bienvenido al sistema de administración de seguridad informática.</p>
    <hr>
    <a href="alta_consejo.jsp" class="btn btn-add"> + Nuevo Consejo</a>
    <br><br>
    <table>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Tipo</th>
            <th>Descripción</th>
            <th>Autor</th>
            <th>Acciones</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pre_examen", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM t_consejos");
                while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("titulo") %></td>
            <td><%= rs.getString("tipo") %></td>
            <td><%= rs.getString("descripcion") %></td>
            <td><%= rs.getString("autor") %></td>
            <td>
                <a href="editar_consejo.jsp?id=<%= rs.getInt("id") %>" class="btn btn-edit">Editar</a>
                <a href="acciones.jsp?accion=eliminar&id=<%= rs.getInt("id") %>" class="btn btn-del" onclick="return confirm('¿Seguro?')">Borrar</a>
            </td>
        </tr>
        <% } cn.close(); } catch(Exception e) { response.sendRedirect("error_handler.jsp?msg=" + e.getMessage()); } %>
    </table>
</body>
</html>