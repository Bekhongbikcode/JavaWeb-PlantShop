/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Categories;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author LENOVO
 */
public class CategoriesDAO {

    public static ArrayList<Categories> showCategories() throws Exception {
        ArrayList<Categories> result = new ArrayList<>();
        //b1: make connection
        try {
            Connection cn = DBUtils.makeConnection();
            //b2: viet sql and exec
            if (cn != null) {

                String sql = "select CateID,CateName\n"
                        + "from dbo.Categories";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3: xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int cateid = table.getInt("CateID");
                        String catename = table.getString("CateName");
                        Categories cts = new Categories(cateid, catename);
                        result.add(cts);
                    }
                }
                //b4: close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int updateCategories(int plantid, String newplantname) throws Exception {
        try {
            Connection cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Categories \n"
                        + "set CateName = ?\n"
                        + "where CateID = ?";
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setString(1, newplantname);
                pstm.setInt(2, plantid);
                int row = pstm.executeUpdate();
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return plantid;
    }

    public static boolean insertPlant(String catename) throws Exception {
        ArrayList<Categories> list = new ArrayList<>();
        try {
            Connection cn = mylib.DBUtils.makeConnection();

            //viet cac query and exec
            if (cn != null) {
                String sql = "insert into dbo.Categories values(?)";

                //xu ly dap an
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setString(1, catename);
                int row = pstm.executeUpdate();
                System.out.println("Row inserted!");

                //dong connecton
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

}
