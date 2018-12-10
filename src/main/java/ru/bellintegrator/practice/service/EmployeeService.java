package ru.bellintegrator.practice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class EmployeeService {
    @Autowired
    public EmployeeService() {

    }

    @Transactional
    public String add() {
        return "this is EmployeeService.add";
    }

    @Transactional
    public String employees() {
        return "this is EmployeeService.employees";
    }

}
