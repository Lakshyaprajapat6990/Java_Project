package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.Service.LoginService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @Autowired
    LoginService loginService;

    //Loading user registration form with get method
    @RequestMapping(method = RequestMethod.GET, path = "/signup")
    public String userRegistrationForm(){
        return "welcome";
    }

    //Loading user registration with post method
    @RequestMapping(method = RequestMethod.POST, path = "/account/signup")
    public String userRegistration(HttpServletRequest request){

        String firstName = request.getParameter("first");
        String lastName = request.getParameter("last");
        String emailId = request.getParameter("email");
        String passwordU = request.getParameter("password");

        System.out.println("Recieved data from Http requests: " + firstName + "," + lastName + "," + emailId + "," + passwordU);

        loginService.userSignUp(firstName, lastName, emailId, passwordU);

        return "message";
    }
    

}
