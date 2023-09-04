<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4._Default" %>





 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
       <hr class="container">
    <div class="row">
        <div class="col-md-6">
            <!-- Primer div con texto y enlace a Pagina1.aspx -->
            
                <div class="card-body">
                    <h5 class="card-title">Mirar todos los productos</h5>
                    <p class="card-text">Puedes mirar todos los productos con sus respectivas categorias.</p>
                    <asp:HyperLink runat="server" ID="lnkPagina1" NavigateUrl="Productos.aspx" Text="Ir a Productos" CssClass="btn btn-primary" />
                </div>
            </div>
        
        <div class="col-md-6">
            <!-- Segundo div con enlace a Pagina2.aspx -->
            
                <asp:HyperLink runat="server" ID="lnkPagina2" NavigateUrl="Pagina2.aspx">
                    <img src="productos.png" alt="Imagen" class="card-img-top" />
                </asp:HyperLink>
            
        </div>
    </div>

          <hr>



             <div class="row">
      <div class="col-md-6">
          <!-- Primer div con texto y enlace a Pagina1.aspx -->
          
              <div class="card-body">
                  <h5 class="card-title">Categorías</h5>
                  <p class="card-text">Mira, agrega, edita o elimina una categoría.</p>
                  <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="~/Categoria.aspx" Text="Ir a Categorías" CssClass="btn btn-primary" />
              </div>
          </div>
      
      <div class="col-md-6">
          <!-- Segundo div con enlace a Pagina2.aspx -->
          
              <asp:HyperLink runat="server" ID="HyperLink2" NavigateUrl="Pagina2.aspx">
                  <img src="categorias.png" alt="Imagen" class="card-img-top" />
              </asp:HyperLink>
          
      </div>
  </div>


</div>
         

    </main>
</asp:Content>
