package ru.bellintegrator.practice.view;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Api(description = "Сотрудник")
public class EmployeeView {

    @NotEmpty
    public String id;

    @Size(max = 50)
    @NotEmpty
    @ApiModelProperty(value = "имя")
    public String firstName;

    @Size(max = 50)
    @NotEmpty
    @ApiModelProperty(value = "второе имя")
    public String secondName;

    @Size(max = 50)
    @NotEmpty
    @ApiModelProperty(value = "отчество")
    public String middletName;

    @Size(max = 50)
    @NotEmpty
    @ApiModelProperty(value = "фамилия")
    public String lasttName;

    @Override
    public String toString() {
        return "id: " + id + "; first name: " + firstName + "; second name: " + secondName + "; middle name: " + middletName + "; last name: " + lasttName;
    }
}
