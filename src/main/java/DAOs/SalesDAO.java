/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ChartDay;
import Models.ChartMonth;
import Models.ChartYear;
import Models.Sales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PhucND-CE171160
 */
public class SalesDAO {

    private Connection conn;

    public SalesDAO() throws SQLException {
        conn = DB.DBConnection.getConnection();
    }

    public List<Sales> getAllSales(String fromDate, String toDate) {
        List<Sales> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT [Name], Sum(Quantity) as sumQuantity, sum([Sum]) as totalSum, [Date]\n"
                + "        FROM OrderDetail\n"
                + "        JOIN [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "        JOIN Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "		where [Date] >=? and [Date] <=?\n"
                + "		GROUP BY [Name],[Date];";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fromDate);
            ps.setString(2, toDate);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Sales(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ChartDay> getChartDay(String year, String month) {
        List<ChartDay> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    [Date],\n"
                + "    SUM([Sum]) AS TotalSum\n"
                + "FROM\n"
                + "    OrderDetail\n"
                + "JOIN\n"
                + "    [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "JOIN\n"
                + "    Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "WHERE\n"
                + "    YEAR([Date]) = ? AND MONTH([Date]) = ? \n"
                + "GROUP BY\n"
                + "    [Date]\n"
                + "ORDER BY\n"
                + "    [Date];";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, month);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartDay(rs.getDate(1), rs.getInt(2), "Default Value"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ChartDay> getPieChartDay(String nowDay) {
        List<ChartDay> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    [Date],\n"
                + "    SUM(Quantity) AS Quantity,\n"
                + "	[Name]\n"
                + "FROM\n"
                + "    OrderDetail\n"
                + "JOIN\n"
                + "    [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "JOIN\n"
                + "    Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "WHERE\n"
                + "    [Date] = ?\n"
                + "GROUP BY\n"
                + "    [Date],[Name]\n"
                + "ORDER BY\n"
                + "    [Date];";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nowDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartDay(rs.getDate(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ChartMonth> getChartMonth(String year) {
        List<ChartMonth> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    MONTH([Date]) AS OrderMonth,\n"
                + "    SUM([Sum]) AS TotalSum\n"
                + "FROM\n"
                + "    OrderDetail\n"
                + "JOIN\n"
                + "    [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "JOIN\n"
                + "    Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "	WHERE\n"
                + "    YEAR([Date]) = ?\n"
                + "GROUP BY\n"
                + "    MONTH([Date])\n"
                + "ORDER BY\n"
                + "    OrderMonth;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartMonth(rs.getString(1), rs.getInt(2), "Default Value"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ChartMonth> getPieChartMonth(String year, String month) {
        List<ChartMonth> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    MONTH([Date]) AS OrderMonth,\n"
                + "    SUM(Quantity) AS Quantity,\n"
                + "	[Name]\n"
                + "FROM\n"
                + "    OrderDetail\n"
                + "JOIN\n"
                + "    [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "JOIN\n"
                + "    Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "	WHERE\n"
                + "    YEAR([Date]) = ? and MONTH([Date]) = ?\n"
                + "GROUP BY\n"
                + "    MONTH([Date]),[Name]\n"
                + "ORDER BY\n"
                + "    OrderMonth;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, month);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartMonth(rs.getString(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ChartYear> getChartYear() {
        List<ChartYear> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    YEAR([Date]) AS OrderYear,\n"
                + "    SUM([Sum]) AS TotalSum\n"
                + "FROM\n"
                + "    OrderDetail\n"
                + "JOIN\n"
                + "    [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "JOIN\n"
                + "    Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "GROUP BY\n"
                + "    YEAR([Date])\n"
                + "ORDER BY\n"
                + "    OrderYear;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartYear(rs.getString(1), rs.getInt(2), "Default Value"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ChartYear> getPieChartYear() {
        List<ChartYear> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    YEAR([Date]) AS OrderYear,\n"
                + "    SUM(Quantity) AS Quantity,\n"
                + "	[Name]\n"
                + "FROM\n"
                + "    OrderDetail\n"
                + "JOIN\n"
                + "    [Order] ON OrderDetail.OrderID = [Order].OrderID\n"
                + "JOIN\n"
                + "    Dish ON OrderDetail.DishID = Dish.DishID\n"
                + "GROUP BY\n"
                + "    YEAR([Date]),[Name]\n"
                + "ORDER BY\n"
                + "    OrderYear;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartYear(rs.getString(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        SalesDAO sDAO = new SalesDAO();
        LocalDate curDate = LocalDate.now();
        String year = String.valueOf(curDate.getYear());
        String month = String.valueOf(curDate.getMonthValue());
        System.out.println("year: " + year);
        System.out.println("month: " + month);
        List<ChartMonth> clist = sDAO.getChartMonth(year);
        for (ChartMonth sales : clist) {
            System.out.println("hihi: " + sales.getMonth());
        }

    }
}
