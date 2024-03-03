/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Dish;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MY LAPTOP
 */
public class DishDAO {

    DecimalFormat decimalFormat = new DecimalFormat("###.##"); //dung de format gia tien khi lay tu database
    private Connection conn;

    public DishDAO() throws SQLException {
        conn = DB.DBConnection.getConnection();
    }

    public List<Dish> getAllProduct() {
        List<Dish> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "select * from Dish";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(rs.getInt(1), rs.getString(2), rs.getString(3), Double.parseDouble(decimalFormat.format(rs.getFloat(4))), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Dish getProductById(int id) {
        ResultSet rs = null;
        String sql = "select * from Dish where DishID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Dish(rs.getInt(1), rs.getString(2), rs.getString(3), Double.parseDouble(decimalFormat.format(rs.getFloat(4))), rs.getString(5), rs.getInt(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addNew(int id, String name, String type, double price, String DishIMG, int sta) {
        String sql = "Insert into Dish values(?,?,?,?,?,?)";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, type);
            ps.setFloat(4, (float) price);
            ps.setString(5, DishIMG);
            ps.setInt(6, sta);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int delete(int id, int sta) {
        String sql = "Update Dish set [status]=? where DishID=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(2, id);
            ps.setInt(1, sta);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int getNewID() {
        List<Dish> list = getAllProduct();
        int idMax = list.get(list.size() - 1).getId();
        return ++idMax;
    }

    public int update(int id, String name, String type, double price, String DishIMG) {
        String sql = "Update Dish set [Name]=?,[Type]=?,Price=?,DishIMG=? where DishID=?";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(5, id);
            ps.setString(1, name);
            ps.setString(2, type);
            ps.setFloat(3, (float) price);
            ps.setString(4, DishIMG);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int updateWithoutPicture(int id, String name, String type, double price) {
        String sql = "Update Dish set [Name]=?,[Type]=?,Price=? where DishID=?";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(4, id);
            ps.setString(1, name);
            ps.setString(2, type);
            ps.setFloat(3, (float) price);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public List<Dish> searchByName(String txtSearch) {
        List<Dish> list = new ArrayList<>();
        String sql = "select * from Dish where [Name] like ? or [Type] like ?";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(rs.getInt(1), rs.getString(2), rs.getString(3), Double.parseDouble(decimalFormat.format(rs.getFloat(4))), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<String> listType() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct [Type] from Dish";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new String(rs.getString(1)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Dish> listCake() {
        List<Dish> list = new ArrayList<>();
        String sql = "select * from Dish where [Name] like ? or [Type] like ?";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%nh ng%");
            ps.setString(2, "%nh ng%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(rs.getInt(1), rs.getString(2), rs.getString(3), Double.parseDouble(decimalFormat.format(rs.getFloat(4))), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
