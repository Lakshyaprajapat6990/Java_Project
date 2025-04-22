package com.example.demo.EntityClasses;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "LoginDetails")
public class LoginEntity {

    @Id
    private String emailId;
    private String firstName;
    private String lastName;
    private String password;

    
}
