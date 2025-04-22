package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.EntityClasses.LoginEntity;

public interface LoginRepo extends JpaRepository<LoginEntity,Integer>{
    
}
