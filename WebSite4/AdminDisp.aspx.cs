using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminDisp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    public void load_cat()
    {
        SqlConnection con = new SqlConnection();

        con.ConnectionString = "Data Source=(local);Initial Catalog=MyGov;Integrated Security=True";
        string sqlQuery = "select * from Complaints";

        DataTable dt = new DataTable();
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sqlQuery, con);
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        load_cat();
    }

}