<%-- 
    Document   : editar_consejo
    Created on : 9/04/2026, 11:22:40 AM
    Author     : PC-13
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Editar Consejo</title></head>
<body style="padding: 30px;">
    <h2>Modificar Información de Seguridad</h2>
    <%
        String id = request.getParameter("id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pre_examen", "root", "");
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM t_consejos WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
    %>
    <form action="acciones.jsp" method="POST">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        
        Título: <br><input type="text" name="titulo" value="<%= rs.getString("titulo") %>" required style="width: 300px;"><br><br>
        Tipo: <br>
        <select name="tipo">
            <option value="Tip" <%= rs.getString("tipo").equals("Tip") ? "selected" : "" %>>Tip de Seguridad</option>
            <option value="Legislacion" <%= rs.getString("tipo").equals("Legislacion") ? "selected" : "" %>>Legislación</option>
            <option value="Normativa" <%= rs.getString("tipo").equals("Normativa") ? "selected" : "" %>>Normativa ISO</option>
        </select><br><br>
        Descripción: <br><textarea name="descripcion" rows="4" style="width: 300px;"><%= rs.getString("descripcion") %></textarea><br><br>
        Autor: <br><input type="text" name="autor" value="<%= rs.getString("autor") %>" required><br><br>
        
        <input type="submit" value="Actualizar Cambios" style="background: #2980b9; color: white; padding: 10px;">
        <a href="index.jsp">Cancelar</a>
    </form>
    <% 
            }
            cn.close();
        } catch(Exception e) { response.sendRedirect("error_handler.jsp"); }
    %>
</body>
</html>