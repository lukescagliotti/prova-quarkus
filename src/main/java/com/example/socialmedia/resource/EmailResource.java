package com.example.socialmedia.resource;

import com.example.socialmedia.dto.EmailRequest;
import com.example.socialmedia.service.EmailService;

import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/email")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class EmailResource {

    @Inject
    EmailService emailService;

    @POST
    @Transactional
    public Response sendEmail(EmailRequest emailRequest) {
        try {
            String recipient = emailRequest.getRecipient();
            String subject = emailRequest.getSubject();
            String body = emailRequest.getBody();

            emailService.sendEmail(recipient, subject, body);

            return Response.ok("Email inviata con successo!").build();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                           .entity("Errore durante l'invio dell'email.")
                           .build();
        }
    }
}