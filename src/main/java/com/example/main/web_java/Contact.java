package com.example.main.web_java;

public class Contact {
    private Integer id; // Serial number
    private String studentId;
    private String name;
    private String department;
    private String section;
    private String semester; // New field for semester
    private String fatherName; // New field for father's name
    private String motherName; // New field for mother's name
    private String address; // New field for address


    // Getters and Setters for ID
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    // Getters and Setters for Student ID
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Getters and Setters for Name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getters and Setters for Department
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    // Getters and Setters for Section
    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    // Getters and Setters for Semester
    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    // Getters and Setters for Father's Name
    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    // Getters and Setters for Mother's Name
    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    // Getters and Setters for Address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
