package com.example.main.web_java;

public class Contact {
    private Integer id; // Serial number
    private String studentId;
    private String name;
    private String department;
    private String section; // New field for section

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
}
