<%-- 
    Document   : Menu
    Created on : 22/06/2020, 09:03:29 AM
    Author     : w10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
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
        <table border="1" cellspacing="0" celpagging="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Pentium Menu</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="DatosEstudiante.jsp" >Registro Estudiantes</a></td>
                    </tr>
                    <tr>
                        <td><a href="DatosCurso.jsp" >Registro Curso</a></td>
                    </tr>
                    <tr>
                        <td><a href="DatosCarrera.jsp" >Registro Carrera</a></td>
                    </tr>
                    <tr>
                        <td><a href="DatosMatricula.jsp" >Registro Matricula</a></td>
                    </tr>
                    <tr>
                        <td><a href="Login.jsp" >Volver al Login</a></td>
                    </tr>
                </tbody>
            </table>
    </body>
</html>
