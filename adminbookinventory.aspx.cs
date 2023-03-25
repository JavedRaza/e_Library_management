using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillAuthorPublisherDeatails();
            GridView1.DataBind();
        }
        // Go button click
        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        // add button click 
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkBookById())
            {
                Response.Write("<script>alert('Book ID already exists try another Book ID');</script>");
            }
            else
            {
                addNewBook();

            }

        }

        // update button click
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        // Delete button Click
        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        // user defined functions
        void fillAuthorPublisherDeatails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT  author_name from author_master_btl ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT  publisher_name from publisher_master_tbl ;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

            }
            catch(Exception ex)
            {

            }
        }

        // user defined check book exist in datavase
        bool checkBookById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id = '" + TextBox3.Text.Trim() + "' OR book_name = '"+ TextBox2.Text.Trim() + "' ;", con);

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
        // user deined fuction for add button

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach(int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = adventure,SelfHelp, --- to get rid of last extra comma
                genres = genres.Remove(genres.Length - 1);


                string filepath = "~bookInventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("bookInventory/" + filename));
                filepath = "~/bookInventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id , book_name  , genre , author_name, publisher_name , publish_date , language , edition , book_cost , no_of_pages , book_description , actual_stock , current_stock , book_img_link) values(@book_id ,@book_name  , @genre , @author_name, @publisher_name , @publish_date , @language , @edition , @book_cost , @no_of_pages , @book_description , @actual_stock , @current_stock , @book_img_link)", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name",DropDownList3.SelectedItem.Value );
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
              //  clearForm();
                GridView1.DataBind();
                Response.Write("<script>alert('Author Added Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }



        // clear form 
        //void clearForm()
        //{

        //}

    }
}