<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="WebApplication.Categorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Lista de Categorías</title>
  
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


    <form id="form1" runat="server">
        <div>
            <h1>Lista de Categorías</h1>

            <!-- Agrega el Label para mostrar mensajes de éxito -->
            <asp:Label ID="lblMensajeExito" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

            <!-- Agrega el Label para mostrar mensajes de error -->
            <asp:Label ID="lblMensajeError" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>

<asp:GridView ID="gvdCategorias" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="nIdCategori" HeaderText="ID de Categoría" />
        <asp:BoundField DataField="cNombCateg" HeaderText="Nombre de la Categoría" />
        <asp:BoundField DataField="cEsActiva" HeaderText="Es Activa" />
        <asp:TemplateField HeaderText="Acciones">
            <ItemTemplate>
                <!-- Botón de Editar -->
                <asp:Button ID="btnEditar" runat="server" Text="Editar" 
    CommandName="EditarCategoria" CommandArgument='<%# Eval("nIdCategori") %>' 
    OnCommand="btnEditar_Command" CssClass="btn btn-warning" />
                <!-- Botón de Eliminar -->
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                    CommandName="EliminarCategoria" CommandArgument='<%# Eval("nIdCategori") %>' 
                    OnCommand="btnEliminar_Command" CssClass="btn btn-danger" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>








            <asp:Panel ID="pnlEdicion" runat="server" Visible="false">
    <h2>Editar Categoría</h2>
    <asp:Label ID="lblIdCategoriaEdit" runat="server" Visible="true"></asp:Label>

    <!-- Agrega lblIdCategoriaEdit aquí -->
    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>

    <asp:TextBox ID="txtNombreCategoriaEdit" runat="server" placeholder="Nuevo Nombre de Categoría" CssClass="form-control" /><br />
    <asp:CheckBox ID="chkEsActivaEdit" runat="server" Text="Categoría Activa" /><br />
    <asp:Button ID="btnGuardarEdicion" runat="server" Text="Guardar Cambios" OnClick="btnGuardarEdicion_Click" CssClass="btn btn-success" />
    <asp:Button ID="btnCancelarEdicion" runat="server" Text="Cancelar" OnClick="btnCancelarEdicion_Click" CssClass="btn btn-secondary" />
</asp:Panel>





            <asp:Button ID="btnMostrarFormulario" runat="server" Text="Agregar Categoría" CssClass="btn btn-primary" PostBackUrl="AgregarCategoria.aspx" />
        </div>
    </form>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>