/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Order;
import dto.OrderDetail;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import mylib.DBUtils;

/**
 *
 * @author user
 */
public class OrderDAO {

    //ham nay de chen 1 new order va order details
    public static int insertOrder(int accid, HashMap<String, Integer> cart) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            // ko luu cai du lieu vaso cho toi khi setautocomut = true
            cn.setAutoCommit(false);
            //chen 1 new order
            String sql = "insert dbo.Orders(OrdDate,shipdate,status,AccID)\n"
                    + "values (?,NULL,1,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            Date d = new Date(System.currentTimeMillis());
            pst.setDate(1, d);
            pst.setInt(2, accid);
            result = pst.executeUpdate();
            //lay order id cua order vua chen vao o buoc tren
            if (result > 0) {
                sql = "select top 1 OrderId from Orders order by OrderId desc";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int orderid = rs.getInt("OrderId");
                    //chen bang OrderDetail
                    for (String id : cart.keySet()) {
                        sql = "insert dbo.OrderDetails(OrderID,FID,quantity)\n"
                                + "values(?,?,?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, orderid);
                        pst.setInt(2, Integer.parseInt(id.trim()));
                        pst.setInt(3, cart.get(id));
                        result = pst.executeUpdate();
                    }
                    cn.commit();
                    cn.setAutoCommit(true);
                }
            }

        }
        return result;
    }

    public static ArrayList<Order> getOrders(String email) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate,shipdate, dbo.Orders.status\n"
                        + "from dbo.Orders inner join dbo.Accounts on dbo.Orders.AccID = dbo.Accounts.AccID\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int OrderID = table.getInt("orderID");
                        Date OrderDate = table.getDate("OrdDate");
                        Date ShipDate = table.getDate("shipDate");
                        int Status = table.getInt("status");
                        Order ord = new Order(OrderID, OrderDate, ShipDate, Status, OrderID);
                        list.add(ord);
                    }
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<OrderDetail> getOrderDetails(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT DetailId, OrderID, PID, PName, price, imgPath, quantity\n"
                        + "FROM dbo.OrderDetails, dbo.Plants\n"
                        + "WHERE OrderID = ? AND OrderDetails.FID = Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderdetailid = rs.getInt("DetailId");
                        int plantid = rs.getInt("PID");
                        String plantname = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail ordetail = new OrderDetail(orderdetailid, orderID, plantid, plantname, price, imgpath, quantity);
                        list.add(ordetail);
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

    public static boolean updateOrderStatus(int orderid, int status) throws Exception {
        try {
            Connection cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Orders\n"
                        + "set status = ?\n"
                        + "where OrderID = ?";
                PreparedStatement pstm = cn.prepareStatement(sql);
                pstm.setInt(1, status);
                pstm.setInt(2, orderid);
                int row = pstm.executeUpdate();
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static ArrayList<OrderDetail> getOrderDetails() {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = mylib.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT DetailId, OrderID, PID, PName, price, imgPath, quantity\n"
                        + "FROM dbo.OrderDetails, dbo.Plants\n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs != null) {
                    while (rs.next()) {
                        int orderdetailid = rs.getInt("DetailId");
                        int plantid = rs.getInt("PID");
                        String plantname = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        int orderID = rs.getInt("OrderID");
                        OrderDetail ordetail = new OrderDetail(orderdetailid, orderID, plantid, plantname, price, imgpath, quantity);
                        list.add(ordetail);
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
}
