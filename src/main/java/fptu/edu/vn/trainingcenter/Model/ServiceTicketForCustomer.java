/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Model;

/**
 *
 * @author Diamond1
 */
public class ServiceTicketForCustomer {

    private String serviceTicketID;
    private String custID;
    private String cust_name;
    private String dateRecived;
    private String dateReturned;
    private String carID;
    private String model;
    private String colour;
    private String year;
    private String part_name;
    private int numberUsed;
    private Double price;

    public ServiceTicketForCustomer() {
    }

    public ServiceTicketForCustomer(String serviceTicketID, String custID, String cust_name, String dateRecived, String dateReturned, String carID, String model, String colour, String year, String part_name, int numberUsed, Double price) {
        this.serviceTicketID = serviceTicketID;
        this.custID = custID;
        this.cust_name = cust_name;
        this.dateRecived = dateRecived;
        this.dateReturned = dateReturned;
        this.carID = carID;
        this.model = model;
        this.colour = colour;
        this.year = year;
        this.part_name = part_name;
        this.numberUsed = numberUsed;
        this.price = price;
    }

    public String getServiceTicketID() {
        return serviceTicketID;
    }

    public void setServiceTicketID(String serviceTicketID) {
        this.serviceTicketID = serviceTicketID;
    }

    public String getCustID() {
        return custID;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public String getDateRecived() {
        return dateRecived;
    }

    public void setDateRecived(String dateRecived) {
        this.dateRecived = dateRecived;
    }

    public String getDateReturned() {
        return dateReturned;
    }

    public void setDateReturned(String dateReturned) {
        this.dateReturned = dateReturned;
    }

    public String getCarID() {
        return carID;
    }

    public void setCarID(String carID) {
        this.carID = carID;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPart_name() {
        return part_name;
    }

    public void setPart_name(String part_name) {
        this.part_name = part_name;
    }

    public int getNumberUsed() {
        return numberUsed;
    }

    public void setNumberUsed(int numberUsed) {
        this.numberUsed = numberUsed;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
    
}
