/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.Model;

/**
 *
 * @author pc
 */
public class Customer {
    private long custID;
    private String custName;
    private String phone;
    private String sex;
    private String cusAddress;

    public Customer() {
        
    }

    public Customer(long custID, String custName, String phone, String sex, String cusAddress) {
        this.custID = custID;
        this.custName = custName;
        this.phone = phone;
        this.sex = sex;
        this.cusAddress = cusAddress;
    }

 

    
    //getter
    
    
   
    
    public long getCustID() {
        return custID;
    }

    public String getCustName() {
        return custName;
    }

    public String getPhone() {
        return phone;
    }

    public String getSex() {
        return sex;
    }

    public String getCusAddress() {
        return cusAddress;
    }


    
    //setter

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }
    
    
}
