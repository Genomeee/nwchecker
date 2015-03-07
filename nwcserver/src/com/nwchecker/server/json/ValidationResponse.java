/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nwchecker.server.json;

import java.util.List;

public class ValidationResponse {

    private String status;
    private String result;
    private List<ErrorMessage> errorMessageList;

    private ValidationResponse() {
    }

    public static ValidationResponse createValidationResponse() {
        return new ValidationResponse();
    }

    public static ValidationResponse createValidationResponse(String status) {
        ValidationResponse validationResponse = new ValidationResponse();
        validationResponse.status = status;
        validationResponse.result = "";
        validationResponse.errorMessageList = null;
        return validationResponse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<ErrorMessage> getErrorMessageList() {
        return this.errorMessageList;
    }

    public void setErrorMessageList(List<ErrorMessage> errorMessageList) {
        this.errorMessageList = errorMessageList;
    }

}
