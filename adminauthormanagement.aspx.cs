using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Go button for searching an author
        protected void Button4_Click(object sender, EventArgs e)
        {
            checkAuthorById();


        }
        // user defined function for Seaching an author by Id
        void checkAuthorById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from author_master_btl where author_id = '" + TextBox1.Text.Trim() + "';", con);

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
         
        //Click button for Adding an author in the Database
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkAuthor())
            {
                Response.Write("<script>alert('Author ID already exists try another user name');</script>");
            }
            else
            {
                addAuthor();
                
            }
        }

        // User defined function check author exist in database table
        bool checkAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from author_master_btl where author_id = '" + TextBox1.Text.Trim() + "';", con);
               
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
        // user defined function for Adding an author to the database
        void addAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_btl (author_id , author_name ) values(@author_id , @author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                clearForm();
                GridView1.DataBind();
                Response.Write("<script>alert('Author Added Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }
        //Click button for Updating  author details in the Database
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkAuthor())
            {
                updateAuthor();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Author ID does not exist ');</script>");
            }

        }

        // user defined fuction for updating the author name
        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_btl  SET author_name = @author_name WHERE author_id = '"+TextBox1.Text.Trim()+"' ", con);
                
                cmd.Parameters.AddWithValue("@author_name", TextBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Author Updated Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }
        //Click button for Deleting an  author  in the Database
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkAuthor())
            {
                deleteAuthor();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Author does not exists ');</script>");
            }
        }
        // user defined delete function for author deletion
        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_btl  WHERE author_id = '" + TextBox1.Text.Trim() + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Author deleted Successfully');</script>");

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