using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Categorias : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindCategoriesToGridView();

            }
        }


        // Método para verificar si existen productos relacionados con la categoría
        private bool CheckIfProductsExistForCategory(int idCategoria)
        {
            bool productosRelacionados = false;

            // Utiliza una consulta SQL para contar los productos relacionados con la categoría
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT COUNT(*) FROM coProducto WHERE nIdCategori = @idCategoria";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@idCategoria", idCategoria);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    // Si count es mayor que cero, significa que hay productos relacionados
                    if (count > 0)
                    {
                        productosRelacionados = true;
                    }
                }
            }

            return productosRelacionados;
        }


        // Método para eliminar la categoría si no hay productos relacionados
        private void DeleteCategory(int idCategoria)
        {
            // Llamar al procedimiento almacenado para eliminar la categoría
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Usp_Del_Co_Categoria", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nIdCategoria", idCategoria);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }



        protected void btnGuardarCategoria_Click(object sender, EventArgs e)
        {
           
        }



        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "EliminarCategoria")
            {
                int idCategoria = Convert.ToInt32(e.CommandArgument);

                // Verificar si existen productos relacionados con la categoría
                bool productosRelacionados = CheckIfProductsExistForCategory(idCategoria);

                if (productosRelacionados)
                {
                    // Mostrar un mensaje de error en la página
                    lblMensajeError.Text = "No se puede eliminar la categoría porque existen productos relacionados.";
                    lblMensajeError.Visible = true;
                    lblMensajeExito.Visible = false;
                }
                else
                {
                    // Si no hay productos relacionados, entonces puedes eliminar la categoría
                    DeleteCategory(idCategoria);

                    // Mostrar un mensaje de éxito en la página
                    lblMensajeExito.Text = "La categoría ha sido eliminada exitosamente.";
                    lblMensajeExito.Visible = true;
                    lblMensajeError.Visible = false;
                }

                // Volver a cargar los datos en el GridView para reflejar los cambios
                BindCategoriesToGridView(); 
            }
        }



        private void BindCategoriesToGridView()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Usp_Get_All_Co_Categorias", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            gvdCategorias.DataSource = dt;
                            gvdCategorias.DataBind();
                        }
                    }
                }
            }
        }




  protected void btnEditar_Command(object sender, CommandEventArgs e)
{
    // Obtén el ID de la categoría que estás editando
    int idCategoria = Convert.ToInt32(e.CommandArgument);

    // Establece el texto en el control lblIdCategoriaEdit
    lblIdCategoriaEdit.Text = idCategoria.ToString();

    // Mostrar el panel de edición
    pnlEdicion.Visible = true;
}




 


        private void CargarDatosCategoria(int idCategoria)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Usp_Get_Co_Categoria_By_Id", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@idCategoria", idCategoria);

                    connection.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtNombreCategoriaEdit.Text = reader["cNombCateg"].ToString();
                            chkEsActivaEdit.Checked = (reader["cEsActiva"].ToString() == "S");
                        }
                    }
                }
            }
        }



        protected void btnCancelarEdicion_Click(object sender, EventArgs e)
        {
            // Ocultar el panel de edición al cancelar la edición
            pnlEdicion.Visible = false;
        }


        protected void btnGuardarEdicion_Click(object sender, EventArgs e)
        {
            int idCategoria = Convert.ToInt32(lblIdCategoriaEdit.Text); // Obtenemos el ID de la categoría a editar
            string nuevoNombre = txtNombreCategoriaEdit.Text;
            string categoriaActiva = chkEsActivaEdit.Checked ? "S" : "N";

            // Validación: Verificar si el campo de nombre está en blanco
            if (string.IsNullOrWhiteSpace(nuevoNombre))
            {
                // El campo está en blanco, muestra un mensaje de error
                lblMensajeError.Text = "El nombre de la categoría no puede estar en blanco.";
                lblMensajeError.Visible = true;
                return; // Detén el proceso de guardado
            }

            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Usp_Edit_Co_Categoria", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nIdCategoria", idCategoria);
                    cmd.Parameters.AddWithValue("@cNombCateg", nuevoNombre);
                    cmd.Parameters.AddWithValue("@cEsActiva", categoriaActiva);

                    connection.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Actualización exitosa
                        lblMensajeExito.Text = "Categoría actualizada con éxito.";
                        lblMensajeExito.Visible = true;
                    }
                    else
                    {
                        // Hubo un error al actualizar
                        lblMensajeError.Text = "No se pudo actualizar la categoría.";
                        lblMensajeError.Visible = true;
                    }

                    // Ocultar el panel de edición
                    pnlEdicion.Visible = false;
                }
            }

            // Recargar los datos en el GridView para reflejar los cambios
            BindCategoriesToGridView(); // Asume que tienes un método BindCategoriesToGridView para cargar los datos
        }
    }
}     