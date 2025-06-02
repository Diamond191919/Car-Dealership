package fptu.edu.vn.trainingcenter.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Mechanic")
@Getter
@Setter
public class Mechanic {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mechanicID")
    private int mechanicID;

    @Column(name = "mechanic_name")
    private String mechanicName;
}