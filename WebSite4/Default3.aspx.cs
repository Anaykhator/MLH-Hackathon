using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        }
    }

    public void btn1(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        string cat = DDL1.SelectedItem.Text.ToString();
        string lat = hdn.Value;
        string lng = hdn2.Value;
        TextBox1.Text = lng;

        con.ConnectionString = "Data Source=(local);Initial Catalog=MyGov;Integrated Security=True";
        string sqlQuery = "INSERT INTO Complaints select ISNULL(Max(Cid),100)+1 ,'" + cat + "','" + lat + "','" + lng + "','" + txtPhotoImg.Text.ToString() + "' from Complaints";

        SqlCommand comm = new SqlCommand(sqlQuery, con);
        con.Open();


        int rows = comm.ExecuteNonQuery();
        if (rows > 0)
        {
            TextBox1.Text = "Done";

        }
        con.Close();
        //TextBox1.Text = cat;
    }

    protected void btnUpload_Click3(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            string fileNameMaster = (System.DateTime.Now.ToString("ddmmyyyyhhssf") + FileUpload1.FileName);
            string savePath = (Server.MapPath("Img/") + fileNameMaster.ToString());

            FileUpload1.SaveAs(savePath);
            txtPhotoImg.Text = fileNameMaster.ToString();
            Img1.ImageUrl = "Img/" + fileNameMaster.ToString();
            Img1.Visible = true;
        }
    }

}