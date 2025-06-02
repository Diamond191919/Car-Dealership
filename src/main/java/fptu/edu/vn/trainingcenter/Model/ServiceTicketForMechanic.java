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
public class ServiceTicketForMechanic {
    private String serviceTicketID;
    private String serviceID;
    private String mechanicID;
    private String dateRecived;
    private String dateReturned;
    private String custID;
    private String cust_name;
    private String carID;
    private String model;
    private int hours;
    private String comment;
    private Double rate;

    public ServiceTicketForMechanic() {
    }

    public ServiceTicketForMechanic(String serviceTicketID, String serviceID, String mechanicID, String dateRecived, String dateReturned, String custID, String cust_name, String carID, String model, int hours, String comment, Double rate) {
        this.serviceTicketID = serviceTicketID;
        this.serviceID = serviceID;
        this.mechanicID = mechanicID;
        this.dateRecived = dateRecived;
        this.dateReturned = dateReturned;
        this.custID = custID;
        this.cust_name = cust_name;
        this.carID = carID;
        this.model = model;
        this.hours = hours;
        this.comment = comment;
        this.rate = rate;
    }

    public String getServiceTicketID() {
        return serviceTicketID;
    }

    public void setServiceTicketID(String serviceTicketID) {
        this.serviceTicketID = serviceTicketID;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getMechanicID() {
        return mechanicID;
    }

    public void setMechanicID(String mechanicID) {
        this.mechanicID = mechanicID;
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

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }
    
    
    
    
}
