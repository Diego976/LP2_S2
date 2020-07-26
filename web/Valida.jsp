<%-- 
    Document   : Valida
    Created on : 22/06/2020, 09:03:18 AM
    Author     : w10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
            String s_usuario;
            String s_clave;
            int tipo;
        %>
    </head>
    <body>
        <%
            s_usuario = request.getParameter("f_usuario");
            s_clave =   request.getParameter("f_clave");
            if(s_usuario.equals("Pentium")&&s_clave.equals("123")) {
                response.sendRedirect("Menu.jsp");
            } else {
                response.sendRedirect("Login.jsp");            
            }
        %>
    </body>
</html>
