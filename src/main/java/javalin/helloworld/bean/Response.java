package javalin.helloworld.bean;

import java.io.Serializable;

public class Response implements Serializable {

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
