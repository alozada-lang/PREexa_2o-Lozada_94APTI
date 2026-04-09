<%-- 
    Document   : alta_consejo
    Created on : 9/04/2026, 11:22:24 AM
    Author     : PC-13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Nuevo Consejo</title></head>
<body style="padding: 30px;">
    <h2>Registrar Nuevo Tip o Legislación</h2>
    <form action="acciones.jsp" method="POST">
        <input type="hidden" name="accion" value="insertar">
        Título: <br><input type="text" name="titulo" required style="width: 300px;"><br><br>
        Tipo: <br>
        <select name="tipo">
            <option value="Tip">Tip de Seguridad</option>
            <option value="Legislacion">Legislación</option>
            <option value="Normativa">Normativa ISO</option>
        </select><br><br>
        Descripción: <br><textarea name="descripcion" rows="4" style="width: 300px;"></textarea><br><br>
        Autor: <br><input type="text" name="autor" required><br><br>
        <input type="submit" value="Guardar Información" style="background: #27ae60; color: white; padding: 10px;">
        <a href="index.jsp">Cancelar</a>
    </form>
</body>
</html>