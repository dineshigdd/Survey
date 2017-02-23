using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailedDisplay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        barChart.Visible = true;
    }

    protected void btnTakeSurvey(object sender, EventArgs e)
    {
        Response.Redirect("ParticipantEntry.aspx");
    }
}