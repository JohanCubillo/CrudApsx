<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCategoria.aspx.cs" Inherits="WebApplication4.AgregarCategoria" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Inserción de Categoría</title>
    <!-- Agregar enlaces a los estilos de Bootstrap (asegúrate de que las rutas sean correctas) -->
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




    <form runat="server" class="container mt-5" id="formularioCat">
        <h1>Formulario de Inserción de Categoría</h1>
        
        <!-- Controles de entrada -->
        <div class="form-group">
            <label for="txtIDCategoria">ID de Categoría:</label>
            <asp:TextBox ID="txtIDCategoria" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="txtNombreCategoria">Nombre de Categoría:</label>
            <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <div class="form-check">
                <asp:CheckBox ID="chkActiva" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="chkActiva">Activa</label>
            </div>
        </div>

        <!-- Botón para insertar -->
        <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" CssClass="btn btn-primary" />

        <!-- Mensaje de resultado -->
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success mt-3"></asp:Label>
    </form>


   <div class="alert alert-success alert-dismissible fade show" id="divMensajeExito" runat="server" visible="false" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); max-width: 300px; text-align: center; padding: 10px;">
    <p style="margin-bottom: 10px;">Datos de categoría insertados con éxito.</p>
    <a href="Categoria.aspx" class="btn btn-primary">Volver a categorias</a>
    <button type="button" class="close" data-dismiss="alert" aria-label="Cerrar">
        <span aria-hidden="true">&times;</span>
    </button>
</div>






    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>