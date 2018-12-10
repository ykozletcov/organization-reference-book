package ru.bellintegrator.practice.controller.employee;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.bellintegrator.practice.service.EmployeeService;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@Api(value = "EmployeeController", description = "Управление информацией о сотрудниках")
@RestController
@RequestMapping(value = "/", produces = APPLICATION_JSON_VALUE)
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @ApiOperation(value = "добавить нового сотрудника", httpMethod = "POST")
    @PostMapping("/employee")
    public void addEmployee() {
        employeeService.add();
    }

    @ApiOperation(value = "показать сотрудника", httpMethod = "GET")
    @GetMapping("/employee")
    public void showEmployee() {
        employeeService.employees();
    }



}
