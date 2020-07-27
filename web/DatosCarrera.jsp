<%-- 
    Document   : RegistroCarrera
    Created on : 25/07/2020, 08:42:26 PM
    Author     : Diego Alonso Ibarra
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Carrera</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idcarrera;
            String s_nombre;
            String s_codigo;
            String s_estado;

        %>
    </head>
    <body>
        
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idcarrera = request.getParameter("f_idcarrera");
                if (s_accion!=null && s_accion.equals("M1")) {
                    consulta =  "   select nombre, codigo, estado  "
                                + " from carrera  "
                                + " where  "
                                + " idcarrera =  " + s_idcarrera;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                            
                        
                    %>    
                    <form name="EditarCarreraForm" action="DatosCarrera.jsp" method="GET">
                    <table border="0" align="center">
                        <thead>
                            <tr>
                                <th colspan="2">Editar Carrera</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="35"/></td>                           
                            </tr>
                            <tr>
                                <td>Codigo:</td>
                                <td><input type="text" name="f_codigo" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="25" /></td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                                <td><input type="text" name="f_estado" value="<% out.print(rs.getString(5)); %>" maxlength="1" size="2" /></td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <input type="submit" value="Editar" name="f_editar" />
                                    <input type="hidden" name="f_accion" value="M2" />
                                    <input type="hidden" name="f_idcarrera" value="<%out.print(s_idcarrera);%>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                    
                    <%
                        }
                }else{

        %>
        <form name="AgregarCarreraForm" action="DatosCarrera.jsp" method="GET">
            <table border="0" align="center" class="ecologico" style="margin: auto; display: table">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Curso</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" name="f_nombre" value="" maxlength="40" size="25"/></td>
                        
                    </tr>
                    <tr>
                        <td>Codigo:</td>
                        <td><input type="text" name="f_codigo" value="" maxlength="30" size="25" /></td>      
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2" /></td>
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
                        Datos Carrera
                    </th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Codigo</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>

                </tr>
            </thead>

        <%        
                
                if(s_accion !=null) {
                    if (s_accion.equals("E")) {
                            consulta =    " delete from carrera "
                                        + " where  "
                                        + " idcarrera = " + s_idcarrera +"; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if(s_accion.equals("C")){
                            s_nombre = request.getParameter("f_nombre");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            
                            consulta =    " insert into "
                                        + " carrera (nombre, codigo, estado)"
                                        + " values('"+ s_nombre +"', '"+ s_codigo +"', '"+s_estado+"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            
                            consulta =  "   update carrera  "
                                        + " set  "
                                        + " nombre = '"+ s_nombre +"', "
                                        + " codigo = '" + s_codigo + "', "
                                        + " estado = '" + s_estado + "'  "
                                        + " where  "
                                        + " idcarrera = " + s_idcarrera + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }
                    
                }
                
                consulta= " Select idcarrera, nombre, codigo, estado "
                        + " from carrera ";
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
                        <td><a href="DatosCarrera.jsp?f_accion=E&f_idcarrera=<%out.print(ide);%>"><img src="imagen/BotonEliminar.png" width="15" height="15"></a></td>
                        <td><a href="DatosCarrera.jsp?f_accion=M1&f_idcarrera=<%out.print(ide);%>"><img src="imagen/BotonEditar.png" width="20" height="20"></a></td>
                        
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
