<%-- 
    Document   : acciones
    Created on : 9/04/2026, 11:22:53 AM
    Author     : PC-13
--%>

<%@ page import="java.sql.*" %>
<%@include file="filtro_waf.jsp" %>
<%
    String accion = request.getParameter("accion");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pre_examen", "root", "");
        
        if("insertar".equals(accion)){
            PreparedStatement ps = cn.prepareStatement("INSERT INTO t_consejos (titulo, tipo, descripcion, autor) VALUES (?,?,?,?)");
            ps.setString(1, request.getParameter("titulo"));
            ps.setString(2, request.getParameter("tipo"));
            ps.setString(3, request.getParameter("descripcion"));
            ps.setString(4, request.getParameter("autor"));
            ps.executeUpdate();
        } 
        else if("eliminar".equals(accion)){
            PreparedStatement ps = cn.prepareStatement("DELETE FROM t_consejos WHERE id = ?");
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
        }
        // Nota: El update lo podemos hacer después si te da tiempo, por ahora con estos cumples el CRUD básico.
        else if("actualizar".equals(accion)){
            PreparedStatement ps = cn.prepareStatement("UPDATE t_consejos SET titulo=?, tipo=?, descripcion=?, autor=? WHERE id=?");
            ps.setString(1, request.getParameter("titulo"));
            ps.setString(2, request.getParameter("tipo"));
            ps.setString(3, request.getParameter("descripcion"));
            ps.setString(4, request.getParameter("autor"));
            ps.setInt(5, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
        }
        cn.close();
        response.sendRedirect("index.jsp");
    } catch(Exception e) {
        // Punto G: Tratamiento de errores enviando la excepción a nuestra página de error
        request.setAttribute("exception", e);
        pageContext.forward("error_handler.jsp");
    }
%>