using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using WebApplication4;

namespace WebApplication4
{
    public partial class Productos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("Usp_Sel_Co_Productos", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            gvdProductos.DataSource = reader;
                            gvdProductos.DataBind();
                        }
                    }
                }
            }
        }
    }
}



