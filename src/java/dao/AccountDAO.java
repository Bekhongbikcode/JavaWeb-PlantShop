/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
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
// lop nay de chua cac function thuc hien cac cau queries lay data bang Account trong DB
public class AccountDAO {

    //ham nay de lay tat ca cac accounts
    public static ArrayList<Account> getAccounts() throws Exception {
        ArrayList<Account> result = new ArrayList<>();
        //b1: make connection
        try {
            Connection cn = DBUtils.makeConnection();
            //b2: viet sql and exec
            if (cn != null) {

                String sql = "select accID,email,password,fullname,phone,status,role\n"
                        + "from dbo.Accounts";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3: xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int accid = table.getInt("accID");
                        String email = table.getString("email");
                        String password = table.getString("password");
                        String fullname = table.getString("fullname");
                        String phone = table.getString("phone");
                        int status = table.getInt("status");
                        int role = table.getInt("role");
                        Account acc = new Account(accid, email, password, fullname, phone, status, role);
                        result.add(acc);
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

    // ham nay de lay tat ca account
    public static ArrayList<Account> getAccountinAdmin(String keyword, String search) {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && search != null) {
                String sql = "Select accID,email,password,fullname,phone,status,role\n"
                        + "from dbo.Accounts\n";
                if (search.equalsIgnoreCase("byemail")) {
                    sql = sql + "where dbo.Accounts.email like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int accid = rs.getInt("accID");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        String phone = rs.getString("phone");
                        int status = rs.getInt("status");
                        int role = rs.getInt("role");
                        Account acc = new Account(accid, email, password, fullname, phone, status, role);
                        list.add(acc);
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

    //ham nay de lay tat ca account voi role = 0/1
    public static ArrayList<Account> getAccounts(int role) throws Exception {
        ArrayList<Account> result = new ArrayList<>();
        //b1: make connection
        try {
            Connection cn = DBUtils.makeConnection();
            //b2: viet sql and exec
            if (cn != null) {

                String sql = "select accID,email,password,fullname,phone,status,role\n"
                        + "from dbo.Accounts where role=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, role);
                ResultSet table = pst.executeQuery();
                //b3: xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int accid = table.getInt("accID");
                        String email = table.getString("email");
                        String password = table.getString("password");
                        String fullname = table.getString("fullname");
                        String phone = table.getString("phone");
                        int status = table.getInt("status");
                        // int role=table.getInt("role");
                        Account acc = new Account(accid, email, password, fullname, phone, status, role);
                        result.add(acc);
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

    //ham nay de lay 1 Account dua vao email, password va status=1(active)
    public static Account getAccount(String email, String password) throws Exception {
        String sql = "select accID,email,password,fullname,phone,status,role\n"
                + "from dbo.Accounts where email=? and status=1 and password=? COLLATE Latin1_General_CS_AI ";
        Account acc = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int accid = rs.getInt("accID");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                acc = new Account(accid, email, password, fullname, phone, status, role);
            }
        }
        return acc;
    }

    public static boolean insertAccount(String email, String password, String fullname, String phone, int status, int role) throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        try {
            Connection cn = mylib.DBUtils.makeConnection();

            //viet cac query and exec
            if (cn != null) {
                String sql = "INSERT INTO dbo.Accounts VALUES  (?,?,?,?,?,?) ";

                //xu ly dap an
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setString(1, email);
                pstm.setString(2, password);
                pstm.setString(3, fullname);
                pstm.setString(4, phone);
                pstm.setInt(5, status);
                pstm.setInt(6, role);
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

    public static boolean updateAccountStatus(String email, int status) throws Exception {
        try {
            Connection cn = mylib.DBUtils.makeConnection();
            if (cn != null) {

                String sql = "update Accounts set status= ? where email=?";
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setInt(1, status);
                pstm.setString(2, email);
                int row = pstm.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }

    //ham nay de update profile
    public static int updateProfile(int accid, String newfullname, String newphone) throws Exception {
        try {
            Connection cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Accounts set fullname=?,phone=? where accid=?";
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setString(1, newfullname);
                pstm.setString(2, newphone);
                pstm.setInt(3, accid);
                int row = pstm.executeUpdate();
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return accid;
    }

}
