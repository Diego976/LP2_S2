<%-- 
    Document   : Login
    Created on : 22/06/2020, 09:03:04 AM
    Author     : w10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <style type="text/css">
            table td {
                padding: 5px;
            }
            table thead{
                background: #008080;
                color: #fff;            
            }
            table tbody{
                text-align: left;
            }
            table{
                font-family: Verdana;
            }
        </style>
    </head>
    <body>
        <form name="f_datos" action="Valida.jsp" method="POST">
            <table border="1" cellspacing="0" celpagging="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Ingrese usuario</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="f_usuario" value="" /></td>
                    </tr>
                    <tr>
                        <td>Clave</td>
                        <td><input type="password" name="f_clave" value="" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><input type="submit" value="Ingresar" name="f_ingresar" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
