package fptu.edu.vn.trainingcenter.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Role")
@Getter
@Setter
public class Role {
    @Id
    @Column(name = "roleID")
    private String roleID;

    @Column(name = "name")
    private String name;
}