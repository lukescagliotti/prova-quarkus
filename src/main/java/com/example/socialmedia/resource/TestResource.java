package com.example.socialmedia.resource;


import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("/")
public class TestResource {

@GET    //test swagger preso da internet
    public String hello() {
        return "Hello, Quarkus!";
    }
}