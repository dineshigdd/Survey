using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAnotherSurvy_Click(object sender, EventArgs e)
    {
      
        SqlConnection connection = new System.Data.SqlClient.SqlConnection();
        string con_string = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        connection.ConnectionString = con_string;

        string cmd_string = "DELETE FROM Responses";
        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(cmd_string, connection);

        command.Connection.Open();
        command.ExecuteNonQuery();                  // execute the delete command
        command.Connection.Close();
    }
}
