package com.example.main.web_java;

public class Result {
    private Integer id;
    private String studentId;
    private String studentName;
    private float cgpa;

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
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName; // Corrected this line
    }

    // Getters and Setters for CGPA
    public float getCgpa() {
        return cgpa;
    }

    public void setCgpa(float cgpa) {
        this.cgpa = cgpa;
    }
}
