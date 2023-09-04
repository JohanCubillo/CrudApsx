using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace WebApplication4
{
    public partial class AgregarCategoria : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Lógica de carga de la página
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            // Obtener los valores de los controles de entrada
            int idCategoria = Convert.ToInt32(txtIDCategoria.Text);
            string nombreCategoria = txtNombreCategoria.Text;
            bool activa = chkActiva.Checked;

            // Convertir el valor de activa a "S" o "N"
            string estadoCategoria = activa ? "S" : "N";

            // Obtener la cadena de conexión desde web.config
            string connectionString = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Verificar si la categoría ya existe en la base de datos
                    SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM coCategoria WHERE nIdCategori = @IDCategoria", connection);
                    checkCmd.Parameters.AddWithValue("@IDCategoria", idCategoria);
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        // La categoría ya existe, mostrar un mensaje de error
                        lblMensaje.Text = "El ID de la Categoria ya ha sido ingresada anteriormente.";
                    }
                    else
                    {
                        // La categoría no existe, proceder con la inserción
                        // Crear un comando para ejecutar el procedimiento almacenado
                        SqlCommand cmd = new SqlCommand("Usp_Ins_Co_Categoria", connection);
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Pasar los parámetros al procedimiento almacenado
                        cmd.Parameters.AddWithValue("@IDCategoria", idCategoria);
                        cmd.Parameters.AddWithValue("@NombreCategoria", nombreCategoria);
                        cmd.Parameters.AddWithValue("@Activa", estadoCategoria);

                        // Ejecutar el procedimiento almacenado
                        cmd.ExecuteNonQuery();

                        // Mostrar un mensaje de éxito

                        divMensajeExito.Visible = true;

                        formularioCat.Visible = false;

                        // Mostrar el mensaje de éxito
                        lblMensaje.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    // Capturar y manejar errores, por ejemplo, mostrar un mensaje de error
                    lblMensaje.Text = "Error al insertar los datos: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}