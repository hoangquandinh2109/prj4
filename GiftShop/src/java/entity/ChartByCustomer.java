/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Asus
 */
public class ChartByCustomer {

    private String email;
    private String name;
    private double income;

    public ChartByCustomer() {
    }

    public ChartByCustomer(String email, String name, double income) {
        this.email = email;
        this.name = name;
        this.income = income;
    }

    public ChartByCustomer(ChartByCustomer newCust) {
        this.email = new String(newCust.getEmail());
        this.name = new String(newCust.getName());
        this.income = newCust.getIncome();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

}
