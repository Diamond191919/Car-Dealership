package fptu.edu.vn.trainingcenter.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "ServiceMechanic")
@Getter
@Setter
public class ServiceMechanic implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "serviceTicketID")
    private int serviceTicketID;

    @Column(name = "serviceID")
    private int serviceID;

    @Column(name = "mechanicID")
    private Long mechanicID;

    @Column(name = "hours")
    private int hours;

    @Column(name = "comment")
    private String comment;

    @Column(name = "rate")
    private double rate;

    public ServiceMechanic() {
    }

    public ServiceMechanic(int serviceTicketID, double rate, String comment, int serviceID, Long mechanicID, int hours) {
        this.serviceTicketID = serviceTicketID;
        this.rate = rate;
        this.comment = comment;
        this.serviceID = serviceID;
        this.mechanicID = mechanicID;
        this.hours = hours;
    }

    public int getServiceTicketID() {
        return serviceTicketID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public Long getMechanicID() {
        return mechanicID;
    }

    public int getHours() {
        return hours;
    }

    public String getComment() {
        return comment;
    }

    public double getRate() {
        return rate;
    }
    
    

    public void setServiceTicketID(int serviceTicketID) {
        this.serviceTicketID = serviceTicketID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public void setMechanicID(Long mechanicID) {
        this.mechanicID = mechanicID;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
    
    
}
