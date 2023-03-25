using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ELibraryManagement
{
    public partial class adminusermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        // Go button
        protected void Button3_Click(object sender, EventArgs e)
        {
            searchUserById();

        }

        // user defined function for go button to search using particular ID
        void searchUserById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id = '" + TextBox3.Text.Trim() + "';", con);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TextBox2.Text = dt.Rows[0][0].ToString();
                    TextBox4.Text = dt.Rows[0][1].ToString();
                    TextBox7.Text = dt.Rows[0][2].ToString();
                    TextBox9.Text = dt.Rows[0][3].ToString();
                    TextBox1.Text = dt.Rows[0][4].ToString();
                    TextBox5.Text = dt.Rows[0][5].ToString();
                    TextBox6.Text = dt.Rows[0][6].ToString();
                    TextBox10.Text = dt.Rows[0][7].ToString();
                    TextBox8.Text = dt.Rows[0][10].ToString();

                }
                else
                {
                    Response.Write("<script>alert(' Invalid User  ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");


            }
        }

        //status -- Approved button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UpdateUserStatus("Active");

        }
       
        //status -- Pending button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateUserStatus("Pending");

        }

        //status -- defaulter button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateUserStatus("Deactivate");
        }

        /// user defined function for Updating the account status of user
        void UpdateUserStatus(String status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl  SET account_status = @account_status WHERE member_id = '" + TextBox3.Text.Trim() + "' ", con);
                cmd.Parameters.AddWithValue("@account_status", status);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                searchUserById();
                Response.Write("<script>alert('Status Updated Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");


            }




        }


        //Delete permanently Clikc button 
        protected void Button1_Click(object sender, EventArgs e)
        {
            deletememberById();
            clearForm();

        }

        void deletememberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl  WHERE member_id = '" + TextBox3.Text.Trim() + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Member deleted Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void clearForm()
        {
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox7.Text = "";
            TextBox9.Text = "";
            TextBox1.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox10.Text = "";
            TextBox8.Text = "";

        }


    }
}