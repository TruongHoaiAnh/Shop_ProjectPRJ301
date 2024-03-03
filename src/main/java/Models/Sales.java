/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author PhucND-CE171160
 */
public class Sales {
    private String dishName;
    private int sumDishQuantity;
    private int totalDishSum;
    private Date orderDate;

    public Sales() {
    }

    public Sales(String dishName, int sumDishQuantity, int totalDishSum, Date orderDate) {
        this.dishName = dishName;
        this.sumDishQuantity = sumDishQuantity;
        this.totalDishSum = totalDishSum;
        this.orderDate = orderDate;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public int getSumDishQuantity() {
        return sumDishQuantity;
    }

    public void setSumDishQuantity(int sumDishQuantity) {
        this.sumDishQuantity = sumDishQuantity;
    }

    public int getTotalDishSum() {
        return totalDishSum;
    }

    public void setTotalDishSum(int totalDishSum) {
        this.totalDishSum = totalDishSum;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
}
