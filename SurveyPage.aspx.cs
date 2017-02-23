using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class SurveyPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lblFocusGroup.Text = "Focus Group: " + Session["Focus_Group"].ToString();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("ParticipantEntry.aspx");
            }

        }


        // lblFocusGroup.Text = cmd.CommandText;

    }

    protected void rdbResponse_SelectedIndexChanged(object sender, EventArgs e)
    {
        string responseValue = (sender as RadioButtonList).SelectedValue;
        ViewState["responseValue"] += responseValue;

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int numOfDataRaws = GridView1.Rows.Count;
        string responseValueList = string.Empty;

        // if (!IsPostBack)
        try
        {
            responseValueList = ViewState["responseValue"].ToString();

        }
        catch (NullReferenceException)
        {
            lblSubmitMessage.Text = "Please answer all the Question. The Survey is NOT submitted!";

        }

        //  string Focus_Group = Session["Focus_Group"].ToString();

        if (responseValueList.Count() == numOfDataRaws)
        {
            List<int> responses = new List<int>();
            System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection();
            string con_string = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            connection.ConnectionString = con_string;



            for (int i = 0; i < responseValueList.Count(); i++)
            {
                responses.Add(Int32.Parse(responseValueList.Substring(i, 1)));
            }

            //----------------------------------
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT ID FROM Question WHERE Focus_Group='All' OR Focus_Group='" + Session["Focus_Group"].ToString() + "'";



            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            List<int> ID = new List<int>();
            while (rdr.Read())
            {


                ID.Add(Convert.ToInt32(rdr["ID"]));



            }


            conn.Close();
            //-----------------------------------



            ///  List<int> ID = new List<int>();
            /*       int strID=0;
                   for (int i = 0; i < numOfDataRaws; i++)
                   {


                       {

                           Int32.TryParse(GridView1.Rows[i].Cells[0].Text, out strID);
                         //  strID = Convert.ToInt32((GridView1.Rows[i].Cells[0].Text));
                           ID.Add(strID);
                     //      questionList.Add(question);



                       }
                   }*/



            for (int i = 0; i < ID.Count; i++)

            {

                string cmd_string = "INSERT INTO Responses(ID,Response) VALUES ('"
                                             + ID[i] + "', '" + responses[i] + "')";

                SqlCommand command = new SqlCommand(cmd_string, connection);

                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();

            }
            lblSubmitMessage.Text = "Thank You for your Participation. Your Responses are submitted";
            btnDisplaySummary.Visible = true;
            btnStartOver.Width = 400;
            btnStartOver.Height = 40;
            btnStartOver.Text = "Cancel Your Previous Submission and " +
            "Start Over the Survery";
            btnStartOver.Visible = true;
        }
        else
        {
            lblSubmitMessage.ForeColor = System.Drawing.Color.Red;
            lblSubmitMessage.Text = "*Please answer all the Question. The Survey is NOT submitted!";

            //Session.Clear();
            ViewState.Clear();

        }
        lblSubmitMessage.Font.Size = 14;
        lblSubmitMessage.Visible = true;
        btnSubmit.Enabled = false;
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/ParticipantEntry.aspx");
        // Session["initialTable"] = "True";
        Session.Clear();

    }

    protected void btnStartOver_Click(object sender, EventArgs e)
    {
        Session.Clear();
        ViewState.Clear();        
        Response.Redirect("ParticipantEntry.aspx");

    }



    protected void btnDisplaySummary_Click(object sender, EventArgs e)
    {
        //Session["item"] = "All";
        Response.Redirect("SummaryDisplay.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
}
