/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs; 

import Models.Account;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MY LAPTOP
 */
public class AccountDAO {

    private Connection conn;

    public AccountDAO() throws SQLException {
        conn = DB.DBConnection.getConnection();
    }

    public List<Account> getAllCustomer() {
        List<Account> list = new ArrayList<>();

        ResultSet rs = null;
        String sql = "select * from Account";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9), rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account login(String username, String password) throws SQLException {
        ResultSet rs = null;
        String sql = "select * from Account where UserName=? and Password=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, getMd5(password));
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String gender = rs.getString(7);
                String address = rs.getString(8);
                boolean isAdmin = rs.getBoolean(9);
                int status = rs.getInt(10);
                if (getMd5(password).equals(rs.getString(4))) {
                    return new Account(id, name, username, getMd5(password), phone, email, gender, address, isAdmin, status);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getCus(String username) throws SQLException {
        ResultSet rs = null;
        String sql = "select * from Account where UserName=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String gender = rs.getString(7);
                String address = rs.getString(8);
                boolean isAdmin = rs.getBoolean(9);
                int status = rs.getInt(10);
                return new Account(id, name, username, password, phone, email, gender, address, isAdmin, status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getMd5(String input) {
        try {
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isAdmin(Account acc) throws SQLException {
        ResultSet rs = null;
        String sql = "select * from Account where UserName=? and IsAdmin=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUserName());
            ps.setString(2, "True");
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }

    public Account addCus(String fullname, String username, String password, String phone, String email, String gender, String address, boolean isAdmin, int status) {
        String sql = "insert into Account values(?,?,?,?,?,?,?,?,?,?)";
        int id = numberOfAcc() + 1;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, fullname);
            ps.setString(3, username);
            ps.setString(4, getMd5(password));
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, gender);
            ps.setString(8, address);
            if (isAdmin) {
                ps.setInt(9, 1);
            } else {
                ps.setInt(9, 0);
            }
            ps.setInt(10, 1);
            ps.executeUpdate();
            return new Account(id, fullname, username, getMd5(password), phone, email, gender, address, isAdmin, status);

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int numberOfAcc() {
        int number = 1;
        ResultSet rs = null;
        String sql = "Select * from Account";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                number++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }

    public boolean checkUserNameExist(String username) {
        String sql = "Select * from Account where UserName = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public boolean checkEmailExist(String email) {
        String sql = "Select * from Account where Email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
    
    public boolean checkPassExist(String pass) {
        String sql = "Select * from Account where Password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public boolean checkPhoneExist(String phone) {
        String sql = "Select * from Account where Phone = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public Account updateCus(int id, String fullname, String username, String password, String phone, String email, String gender, String address, boolean isAdmin, int status) {
        String sql = "update Account set [Fullname]=?,UserName=?,[Password]=?,Phone=?,Email=?,Gender=?,[Address]=?,IsAdmin=? where UserID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, getMd5(password));
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, gender);
            ps.setString(7, address);
            if (isAdmin) {
                ps.setInt(8, 1);
            } else {
                ps.setInt(8, 0);
            }
            ps.setInt(9, id);
            ps.executeUpdate();
            return new Account(id, fullname, username, getMd5(password), phone, email, gender, address, isAdmin, 1);

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int deleteCus(int sta, int id) {
        String sql = "update Account set [status]=? where UserID=?";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, sta);
            ps.setInt(2, id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return kq;
    }

    public int getID(String username) {
        String sql = "select UserID from Account where Username=?";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public String getNameById(int id) {
        String sql = "select [Fullname] from Account where UserID=?";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int updateAdmin(String username) {
        String sql = "Update Account set IsAdmin=1 where UserName=?";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            kq = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
}
