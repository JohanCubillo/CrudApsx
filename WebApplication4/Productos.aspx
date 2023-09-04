<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebApplication4.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="Default.aspx">Inicio <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Productos.aspx">Productos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Categoria.aspx">Categorías</a>
            </li>
        </ul>
    </div>
</nav>


    <form runat="server">

<asp:GridView 
    ID="gvdProductos" 
    runat="server" 
    AutoGenerateColumns="false"
    CssClass="styled-gridview"
    style="font-size: 14px; margin-bottom: 10px;">
    <Columns>
        <asp:BoundField DataField="nIdProduct" HeaderText="ID del Producto" />
        <asp:BoundField DataField="cNombProdu" HeaderText="Nombre del Producto" />
        <asp:BoundField DataField="nPrecioProd" HeaderText="Precio" />
        <asp:BoundField DataField="cNombCateg" HeaderText="Nombre de la Categoría" />
       
    </Columns>
</asp:GridView>


    </form>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>