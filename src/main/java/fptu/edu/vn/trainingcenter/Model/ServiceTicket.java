package fptu.edu.vn.trainingcenter.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "ServiceTicket")
@Getter
@Setter
public class ServiceTicket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "serviceTicketID")
    private int serviceTicketID;

    @Column(name = "dateReceived")
    private Date dateReceived;

    @Column(name = "dateReturned")
    private Date dateReturned;

    @Column(name = "custID")
    private int custID;

    @Column(name = "carID")
    private int carID;

    public void setServiceTicketID(int serviceTicketID) {
        this.serviceTicketID = serviceTicketID;
    }

    public void setDateReceived(Date dateReceived) {
        this.dateReceived = dateReceived;
    }

    public void setDateReturned(Date dateReturned) {
        this.dateReturned = dateReturned;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }
    
}