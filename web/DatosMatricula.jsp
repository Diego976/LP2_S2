<%-- 
    Document   : RegistroMatricula
    Created on : 25/07/2020, 08:42:43 PM
    Author     : Diego Alonso
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Matricula</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idmatricula;
            String s_estudiante;
            String s_curso;
            String s_carrera;
            String s_ciclo;

        %>
    </head>
    <body>
        
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idmatricula = request.getParameter("f_idmatricula");
                if (s_accion!=null && s_accion.equals("M1")) {
                    consulta =  "   select estudiante, curso, carrera, ciclo   "
                                + " from matricula  "
                                + " where  "
                                + " idmatricula =  " + s_idmatricula;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                            
                    %>    
                    <form name="EditarMatriculaForm" action="DatosMatricula.jsp" method="GET">
                    <table border="0" align="center">
                        <thead>
                            <tr>
                                <th colspan="2">Editar Matricula</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Estudiante:</td>
                                <td><input type="text" name="f_estudiante" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="35"/></td>                           
                            </tr>
                            <tr>
                                <td>Curso:</td>
                                <td><input type="text" name="f_curso" value="<% out.print(rs.getString(2)); %>" maxlength="30" size="25" /></td>
                            </tr>
                            <tr>
                                <td>Carrera: </td>
                                <td><input type="text" name="f_carrera" value="<% out.print(rs.getString(3)); %>" maxlength="1" size="2" /></td>
                            </tr>
                            <tr>
                                <td>Ciclo: </td>
                                <td><input type="text" name="f_ciclo" value="<% out.print(rs.getString(4)); %>" maxlength="4" size="6" /></td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <input type="submit" value="Editar" name="f_editar" />
                                    <input type="hidden" name="f_accion" value="M2" />
                                    <input type="hidden" name="f_idmatricula" value="<%out.print(s_idmatricula);%>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                    
                    <%
                        }
                }else{

        %>
        <form name="AgregarMatriculaForm" action="DatosMatricula.jsp" method="GET">
            <table border="0" align="center" class="ecologico" style="margin: auto; display: table">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Matricula</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Estudiante:</td>
                        <td><input type="text" name="f_estudiante" value="" maxlength="40" size="25"/></td>
                        
                    </tr>
                    <tr>
                        <td>Curso:</td>
                        <td><input type="text" name="f_curso" value="" maxlength="30" size="25" /></td>      
                    </tr>
                    <tr>
                        <td>Carrera: </td>
                        <td><input type="text" name="f_carrera" value="" maxlength="1" size="2" /></td>
                    </tr>
                    <tr>
                        <td>Ciclo: </td>
                        <td><input type="text" name="f_ciclo" value="" maxlength="3" size="5" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                            <a href="Menu.jsp"><input type="button" value="Volver" name="" /></a>
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
            }
        %>
        
        <table border="1" cellpadding ="2" align = "center" class="ecologico" style="margin: auto; display: table" >
            <thead>
                <tr>
                    <th colspan="8">
                        Datos Matricula
                    </th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Estudiante</th>
                    <th>Curso</th>
                    <th>Carrera</th>
                     <th>Ciclo</th>
                    <th colspan="2">Acciones</th>

                </tr>
            </thead>

        <%        
                
                if(s_accion !=null) {
                    if (s_accion.equals("E")) {
                            consulta =    " delete from matricula "
                                        + " where  "
                                        + " idmatricula = " + s_idmatricula +"; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if(s_accion.equals("C")){
                            s_estudiante = request.getParameter("f_estudiante");
                            s_curso = request.getParameter("f_curso");
                            s_carrera = request.getParameter("f_carrera");
                            s_ciclo = request.getParameter("f_ciclo");
                            
                            consulta =    " insert into "
                                        + " matricula (estudiante, curso, carrera, ciclo)"
                                        + " values('"+ s_estudiante +"', '"+ s_curso +"', '"+s_carrera+"', '"+s_ciclo+"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                            s_estudiante = request.getParameter("f_estudiante");
                            s_curso = request.getParameter("f_curso");
                            s_carrera = request.getParameter("f_carrera");
                            s_ciclo = request.getParameter("f_ciclo");
                            
                            consulta =  "   update matricula  "
                                        + " set  "
                                        + " estudiante = '"+ s_estudiante +"', "
                                        + " curso = '" + s_curso + "', "
                                        + " carrera = '" + s_carrera + "',  "
                                        + " ciclo = '" + s_ciclo + "'  "
                                        + " where  "
                                        + " idmatricula = " + s_idmatricula + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }
                    
                }
                
                consulta= " Select idmatricula, estudiante, curso, carrera ,ciclo "
                          +" from matricula ";
                        
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {    
                    ide = rs.getString(1);
                    num++;
                    %>
                    <tr align="center">
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><a href="DatosMatricula.jsp?f_accion=E&f_idmatricula=<%out.print(ide);%>"><img src="imagen/BotonEliminar.png" width="15" height="15"></a></td>
                        <td><a href="DatosMatricula.jsp?f_accion=M1&f_idmatricula=<%out.print(ide);%>"><img src="imagen/BotonEditar.png" width="20" height="20"></a></td>
                        
                    </tr>                    
                    <%
                    }
                    rs.close();
                    pst.close();
                    cn.close();
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
        </table>
    </body>
</html>
