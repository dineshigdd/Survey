using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SurveyQuestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }




    protected void btnTakeSurvey_Click(object sender, EventArgs e)
    {
        Session["Focus_Group"] = ddlFocusGroup.Text;

        Response.Redirect("SurveyPage.aspx");
    }






    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administration.aspx");
    }
}
















