using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }
        // searching publishers using Go button
        protected void Button4_Click(object sender, EventArgs e)
        {
            checkPublisherById();

        }
        // user defined pulishers check function
        void checkPublisherById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from publisher_master_tbl where publisher_id = '" + TextBox1.Text.Trim() + "';", con);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TextBox3.Text = dt.Rows[0][1].ToString();

                }
                else
                {
                    Response.Write("<script>alert(' invalid Author ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");


            }
        }
         // add publishers in database
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkPublisher())
            {
                Response.Write("<script>alert('Publisher ID already exists try another Publisher ID');</script>");
            }
            else
            {
                addPublisher();

            }
           
        }

        // user defined function for Publisher adding in database
        void addPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl (publisher_id , publisher_name ) values(@publisher_id , @publisher_name)", con);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", TextBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                clearForm();
                // GridView1.DataBind();
                Response.Write("<script>alert('Publisher Added Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        // user defined function for Publisher check (if exist) in database
        bool checkPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from publisher_master_tbl where publisher_id = '" + TextBox1.Text.Trim() + "';", con);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return true;
                }
                else return false;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;

            }
        }

        // update publisher in the database
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkPublisher())
            {
                updatePublisher();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Publisher ID does not exist ');</script>");
            }


        }
        // user defined function for updating a publisher
        void updatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl  SET publisher_name = @publisher_name WHERE publisher_id = '" + TextBox1.Text.Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@publisher_name", TextBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        // delete pulishers in the database
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkPublisher())
            {
                deletePublisher();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Publisher ID does not exist ');</script>");
            }


        }
        void deletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl  WHERE publisher_id = '" + TextBox1.Text.Trim() + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Publisher deleted Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox3.Text = "";
        }
    }
}