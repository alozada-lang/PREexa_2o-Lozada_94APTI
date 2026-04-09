<%-- 
    Document   : error_handler
    Created on : 9/04/2026, 11:23:17 AM
    Author     : PC-13
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Ups! Algo salió mal</title></head>
<body style="font-family: sans-serif; text-align: center; padding-top: 50px;">
    <h1 style="color: #e74c3c;">Error en el Sistema ASI</h1>
    <p>Lo sentimos, ha ocurrido un problema técnico.</p>
    <div style="background: #f9f9f9; border: 1px solid #ddd; display: inline-block; padding: 20px;">
        <strong>Detalle del error:</strong> <%= exception.getMessage() %>
    </div>
    <br><br>
    <a href="index.jsp">Volver al inicio</a>
</body>
</html>