/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import DAOs.AccountDAO;
import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author Group02
 */
public class Order {
    private int orderID;
    private int customerID;
    private double total;
    private Date date;

    public Order() {
    }

    public Order(int orderID, int customerID, double total, Date date) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.total = total;
        this.date = date;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

   

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public String getCustomerName() throws SQLException{
        AccountDAO cusDAO =new AccountDAO();
        String cusName = cusDAO.getNameById(customerID);
        return cusName;
    }
    
}
