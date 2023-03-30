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

        static string gloabal_filepath;
        static int global_actual_stock, golbal_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        // Go button click
        protected void Button3_Click(object sender, EventArgs e)
        {
             
                fillAuthorPublisherDeatails();
             

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
             if (checkBookById())
            {
                updateBookInfo();
            }
            else
            {
                Response.Write("<script>alert('Book ID does not exists try another Book ID');</script>");

            }
           

        }

        // Delete button Click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkBookById())
            {
                deleteBook();
            }
            else
            {
                Response.Write("<script>alert('Book ID does not exists try another Book ID');</script>");

            }

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
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl WHERE book_id = '" + TextBox3.Text.Trim() + "'" , con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ListBox1.ClearSelection();
                if (dt.Rows.Count > 0)
                {
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox8.Text = dt.Rows[0]["publish_date"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["edition"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["book_cost"].ToString() ;
                    TextBox13.Text = dt.Rows[0]["no_of_pages"].ToString();
                    TextBox15.Text = dt.Rows[0]["book_description"].ToString();
                    TextBox10.Text = dt.Rows[0]["actual_stock"].ToString();
                    TextBox12.Text = dt.Rows[0]["current_stock"].ToString();
                    TextBox14.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()));

                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for(int i = 0; i < genre.Length; i++)
                    {
                        for(int j =0;j< ListBox1.Items.Count; j++)
                        {
                            if (genre[i] == ListBox1.Items[j].ToString())
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }
                        
                }
                else
                {
                    Response.Write("<script>alert('Book ID not exist ');</script>");
                }
                gloabal_filepath = dt.Rows[0]["book_img_link"].ToString();
                global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                golbal_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                global_issued_books = global_actual_stock - golbal_current_stock;




            }
            catch (Exception ex)
            {

            }
        }
        // user defined update fuction for book by
        void updateBookInfo()
        {
            try
            {
                int actual_stock = Convert.ToInt32(TextBox10.Text.Trim());
                int current_stock = Convert.ToInt32(TextBox12.Text.Trim());
                if(global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if (global_issued_books > actual_stock)
                    {
                        Response.Write("<script>alert('actual stock value can not be less than the issued books');</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        TextBox12.Text = "" + current_stock;
                    }
                }




                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = adventure,SelfHelp, --- to get rid of last extra comma
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~bookInventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if(filename == null || filename == "")
                {
                    filepath = gloabal_filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("bookInventory/" + filename));
                    filepath = "~/bookInventory/" + filename;
                }
               

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name = @book_name , genre =@genre , author_name=@author_name, publisher_name=@publisher_name , publish_date=@publish_date , language=@language , edition=@edition , book_cost=@book_cost , no_of_pages=@no_of_pages , book_description=@book_description , actual_stock=@actual_stock , current_stock=@current_stock , book_img_link=@book_img_link where book_id = '" + TextBox3.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", actual_stock);
                cmd.Parameters.AddWithValue("@current_stock", current_stock);
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Book Updated Successfully');</script>");


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
                cmd.Parameters.AddWithValue("@current_stock", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
              //  clearForm();
                GridView1.DataBind();
                Response.Write("<script>alert('Book Added Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }
        // user defined delete function
        void deleteBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl  WHERE book_id = '" + TextBox3.Text.Trim() + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Book deleted Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }


        }


        // clear form 
        //void clearform()
        //{


        //}

    }
}