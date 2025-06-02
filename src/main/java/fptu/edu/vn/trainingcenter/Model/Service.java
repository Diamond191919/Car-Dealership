/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.Model;

/**
 *
 * @author Admin
 */
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Service")
public class Service implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "serviceID")
    private Long serviceID;

    @Column(name = "service_name")
    @NotNull(message = "Service name cannot be null")
    @Size(min = 3, max = 100, message = "Service name must be between 3 and 100 characters")
    private String service_name;

    @Column(name = "hourly_rate")
    @NotNull(message = "Hourly rate cannot be null")
    @Positive(message = "Hourly rate must be positive")
    private double hourlyRate;

    @Column(name = "status")
    @NotNull(message = "Status cannot be null")
    private String status;

    public static String formatCurrency(double amount) {
        Locale locale = new Locale("vi", "VN"); // Locale cho Việt Nam
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        return currencyFormatter.format(amount);
    }

    public Service() {
    }

    public Service(Long serviceID, String service_name, double hourlyRate, String status) {
        this.serviceID = serviceID;
        this.service_name = service_name;
        this.hourlyRate = hourlyRate;
        this.status = status;
    }
    
    

    public Long getServiceID() {
        return serviceID;
    }

    public void setServiceID(Long serviceID) {
        this.serviceID = serviceID;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public double getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(double hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
