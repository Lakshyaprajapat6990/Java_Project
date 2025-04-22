package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Repository.LoginRepo;

@Service
public class LoginService {
    @Autowired
    LoginRepo loginRepo;

    public String userSignUp(String firstName, String lastName, String emailId, String password){

        System.out.println("Recieved data from Controller: " + firstName + "," + lastName + "," + emailId + "," + password);
        return "User Created";
    }
}
