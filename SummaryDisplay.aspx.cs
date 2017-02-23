using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SummaryDisplay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


   
        if (!IsPostBack)
        {
            ListItem All = new ListItem("All");
            
            ddlFocusgroup.DataSource = JoinTable1;
            ddlFocusgroup.DataTextField = "Focus_Group";
            ddlFocusgroup.DataBind();            
            ddlFocusgroup.Items.Add(All);


            ddlCatagory.DataSource = JoinTable2;
            ddlCatagory.DataTextField = "Catagory";
            ddlCatagory.DataBind();            
            ddlCatagory.Items.Add(All);
         
           
        }
        

        

    }

      protected void Button1_Click(object sender, EventArgs e)
    {
       
        

         if (ddlFocusgroup.Text == "All" && ddlCatagory.Text == "All")
        {
         
            GridView2.DataSourceID = "ShowAll";
        }
        else
        if (ddlFocusgroup.Text == "All")
        {
            GridView2.DataSourceID = "SqlDataAllforFocusGroup";
        }
        else
        if (ddlCatagory.Text == "All")
        {
            GridView2.DataSourceID = "SqlDataAllforCatagory";
        }
       

        else
            GridView2.DataSourceID = "SqlDSDummary";


        GridView2.DataBind();
        GridView2.Visible = true;
        btnClear.Visible = true;
        btnBargraph.Enabled = true;
        btnBargraph.Visible = true;
        
        GridView2.Columns[0].Visible = false;
        Chart2.Visible = false;


        /*  SqlConnection conn = new SqlConnection();
          conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
          SqlCommand cmd = new SqlCommand();
          cmd.Connection = conn;
          cmd.CommandText = "SELECT * FROM Responses INNER JOIN Question ON Responses.ID = Question.ID";
          //"WHERE (Question.Focus_Group="+ ddlFocusgroup.DataTextField +
          // "AND"+ ddlCatagory.DataTextField;

          conn.Open();
          SqlDataReader rdr = cmd.ExecuteReader();



          int Count = 0;
          while (rdr.Read())
          {
              if (rdr["Focus_Group"].ToString() == ddlFocusgroup.Text &&
                  rdr["Catagory"].ToString() == ddlCatagory.Text)
              {

                  Count++;

              }
          }


          conn.Close();

          TextBox1.Text = Count.ToString();
          */
    }

    protected void btnClear_Click(object sender, EventArgs e)
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


protected void btnBargraph_Click(object sender, EventArgs e)
{


    if (ddlFocusgroup.Text == "All" && ddlCatagory.Text == "All")
    {
        Chart2.DataSourceID = "ShowAll";
    }
    else
    if (ddlFocusgroup.Text == "All")
    {

        Chart2.DataSourceID = "SqlDataAllforFocusGroup";

    }
    else 
    if (ddlCatagory.Text == "All")
    {
        Chart2.DataSourceID = "SqlDataAllforCatagory";

    }

    else
    {
        Chart2.DataSourceID = "SqlDSDummary";

    }

    Chart2.DataBind();
    Chart2.Visible = true;
    GridView2.Columns[0].Visible = true;
    btnBargraph.Enabled = false;
    btnDetaildDispplay.Visible = true;


    /*SqlConnection conn = new SqlConnection();
    conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
    SqlCommand cmd = new SqlCommand();
    cmd.Connection = conn;

    cmd.CommandText =
    "SELECT AVG(Responses.Response) AS 'Average' FROM Responses INNER JOIN Question ON Responses.ID = Question.ID WHERE Question.Focus_Group='" + 
    ddlFocusgroup.Text +"'" +
    "AND Question.Catagory ='"+ ddlCatagory.Text+"'";


    conn.Open();
    SqlDataReader rdr=cmd.ExecuteReader();

     List<int> average = new List<int>();

       while(rdr.Read())
       {

           average.Add(Convert.ToInt32(rdr["Average"]));
       }
       conn.Close();

       Session["Average"] = average;
       Response.Redirect("DetailedDisplay.aspx");

    conn.Close();*/

        //Session["Focus_Group"] = ddlFocusgroup.Text;
        //Session["Catagory"] = ddlCatagory.Text;
        //Response.Redirect("BarChart.aspx");
    }

    protected void btnDetaildDispplay_Click(object sender, EventArgs e)
    {
        Response.Redirect("DetailedDisplay.aspx");
    }



  

    protected void btnTakeSurvey(object sender, EventArgs e)
    {
        Response.Redirect("ParticipantEntry.aspx");
    }
}