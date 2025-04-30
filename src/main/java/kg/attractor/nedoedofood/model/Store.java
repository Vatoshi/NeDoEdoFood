package kg.attractor.nedoedofood.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "store")
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    private String description;

    @ManyToOne
    @JoinColumn(name = "address_id")
    private Address address;

    @Column(name = "phone_number")
    private Long phoneNumber;

    private String email;

    @Column(name = "work_time_from")
    private Timestamp workTimeFrom;

    @Column(name = "work_time_to")
    private Timestamp workTimeTo;

    private String logo;

    @OneToMany(mappedBy = "store")
    private List<Dish> dishes;

}

