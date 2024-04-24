package com.javaweb.entity;

import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name ="building")
@Transactional

public class BuildingEntity extends BaseEntity{

    @Column(name = "name")
    private String name;

    @Column(name = "managername")
    private String managername ;

    @Column(name = "managerphone")
    private String managerPhone ;

    @Column(name = "ward")
    private String ward;

    @Column(name = "street")
    private String street;

    @Column(name = "direction")
    private String direction ;

    @Column(name = "numberofbasement")
    private Long numberOfBasement;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "district")
    private String district;

    @Column(name = "type")
    private String type;
    @Column(name = "floorarea")
    private Long floorArea;

    @Column(name = "rentprice")
    private Long rentprice;

    @Column(name = "brokeragefee")
    private Double brokeragefee;

    @Column(name = "servicefee")
    private Long servicefee;

    @Column(name = "note")
    private String note ;

    @Column(name = "structure")
    private String structure;

    @Column(name = "motofee")
    private String motoFee;

    @Column(name = "carfee")
    private String carFee;

    @Column(name = "level")
    private String level;

    @Column(name ="rentpricedescription")
    private String rentpricedescription;

    @Column(name ="deposit")
    private String deposit;

    @Column(name ="payment")
    private String payment;

    @Column(name ="renttime")
    private String rentTime;

    @Column(name ="overtimefee")
    private String overtimeFee;

    @Column(name ="electricityfee")
    private String electricityFee;

    @Column(name ="decorationtime")
    private String decorationTime;

    @Column(name ="avatar")
    private String image;


    @OneToMany(mappedBy ="buildings" , fetch = FetchType.LAZY , cascade =  CascadeType.ALL , orphanRemoval =  true)
    private List<RentareaEntity> listRentarea = new ArrayList();

   /* @OneToMany(mappedBy="building", fetch = FetchType.LAZY)
    private List<AssignmentBuildingEntity> assignmentBuildingEntities = new ArrayList<>();*/

    @ManyToMany(fetch =  FetchType.LAZY )
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid" , nullable = false),
            inverseJoinColumns =  @JoinColumn(name ="staffid", nullable= false))
    private List<UserEntity> users = new ArrayList<>();

    public List<UserEntity> getUsers() {
        return users;
    }


    public void setUsers(List<UserEntity> users) {
        this.users = users;
    }

    public String getDirection() {
        return direction;
    }
    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Long getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(Long numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }

    public Long getRentprice() {
        return rentprice;
    }

    public void setRentprice(Long rentprice) {
        this.rentprice = rentprice;
    }

    public Long getServicefee() {
        return servicefee;
    }

    public void setServicefee(Long servicefee) {
        this.servicefee = servicefee;
    }

    public Long getFloorarea() {
        return floorArea;
    }

    public void setFloorarea(Long floorarea) {
        this.floorArea = floorarea;
    }

    public Double getBrokeragefee() {
        return brokeragefee;
    }

    public void setBrokeragefee(Double brokeragefee) {
        this.brokeragefee = brokeragefee;
    }

    public String getWard() {
        return ward;
    }
    public void setWard(String ward) {
        this.ward = ward;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getManagername() {
        return managername;
    }
    public void setManagername(String managername) {
        this.managername = managername;
    }
    public String getManagerPhone() {
        return managerPhone;
    }
    public void setManagerPhone(String managerphonenumber) {
        this.managerPhone = managerphonenumber;
    }


    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<RentareaEntity> getListRentarea() {
        return listRentarea;
    }

    public void setListRentarea(List<RentareaEntity> listRentarea) {
        this.listRentarea = listRentarea;
    }



  /*  public List<AssignmentBuildingEntity> getAssignmentBuildingEntities() {
        return assignmentBuildingEntities;
    }

    public void setAssignmentBuildingEntities(List<AssignmentBuildingEntity> assignmentBuildingEntities) {
        this.assignmentBuildingEntities = assignmentBuildingEntities;
    }*/

    public String getCarFee() {
        return carFee;
    }

    public void setCarFee(String carFee) {
        this.carFee = carFee;
    }

    public String getMotoFee() {
        return motoFee;
    }

    public void setMotoFee(String motoFee) {
        this.motoFee = motoFee;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    public Long getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Long floorArea) {
        this.floorArea = floorArea;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getRentpricedescription() {
        return rentpricedescription;
    }

    public void setRentpricedescription(String rentpricedescription) {
        this.rentpricedescription = rentpricedescription;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getElectricityFee() {
        return electricityFee;
    }

    public void setElectricityFee(String electricityFee) {
        this.electricityFee = electricityFee;
    }

    public String getOvertimeFee() {
        return overtimeFee;
    }

    public void setOvertimeFee(String overtimeFee) {
        this.overtimeFee = overtimeFee;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getRentTime() {
        return rentTime;
    }

    public void setRentTime(String rentTime) {
        this.rentTime = rentTime;
    }

    public String getDecorationTime() {
        return decorationTime;
    }

    public void setDecorationTime(String decorationTime) {
        this.decorationTime = decorationTime;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
