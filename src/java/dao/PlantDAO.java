/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author user
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                        + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Plants.PName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static Plant getPlant(int pid) {
        Plant p = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as cateID,CateName\n"
                        + "from Plants, Categories\n"
                        + "where Plants.CateID=Categories.CateID and PID=? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    pid = rs.getInt("PID");
                    String pname = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("cateID");
                    String cateName = rs.getString("CateName");
                    p = new Plant(pid, pname, price, imgPath, des, status, cateid, cateName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return p;
    }

    public static ArrayList<Plant> showPlants() throws Exception {
        ArrayList<Plant> result = new ArrayList<>();
        //b1: make connection
        try {
            Connection cn = DBUtils.makeConnection();
            //b2: viet sql and exec
            if (cn != null) {

                String sql = "select PID,PName,price,imgPath,description,status,dbo.Plants.CateID,CateName\n"
                        + "from dbo.Plants inner join dbo.Categories on dbo.Plants.CateID = dbo.Categories.CateID";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3: xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int pid = table.getInt("PID");
                        String pname = table.getString("PName");
                        int price = table.getInt("price");
                        String imgpath = table.getString("imgPath");
                        String discription = table.getString("description");
                        int status = table.getInt("status");
                        int cateid = table.getInt("CateID");
                        String cateName = table.getString("CateName");
                        Plant plt = new Plant(pid, pname, price, imgpath, discription, status, cateid, pname);
                        result.add(plt);
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

    public static int updatePlant(int plantid, String newplantname, int newprice, String newdiscription) throws Exception {
        try {
            Connection cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plants\n"
                        + "set PName = ? , price = ? , description = ?\n"
                        + "where PID = ?";
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setString(1, newplantname);
                pstm.setInt(2, newprice);
                pstm.setString(3, newdiscription);
                pstm.setInt(4, plantid);
                int row = pstm.executeUpdate();
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return plantid;
    }

    public static boolean insertPlant(String Pname, int price, String discription, int status, int cateid) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        try {
            Connection cn = mylib.DBUtils.makeConnection();

            //viet cac query and exec
            if (cn != null) {
                String sql = "Insert into dbo.Plants values (?,?,null,?,?,?)";

                //xu ly dap an
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setString(1, Pname);
                pstm.setInt(2, price);
                pstm.setString(3, discription);
                pstm.setInt(4, status);
                pstm.setInt(5, cateid);
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
