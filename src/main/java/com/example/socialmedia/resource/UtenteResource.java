package com.example.socialmedia.resource;

import java.util.List;

import com.example.socialmedia.entity.Utente;

import jakarta.transaction.Transactional;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/utenti")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UtenteResource {

    @GET
    public List<Utente> getAllUtenti() {
        return Utente.listAll(); 
    }

    @GET
    @Path("/{id}")
    public Response getUtenteById(@PathParam("id") Long id) {
        Utente utente = Utente.findById(id);
        if (utente != null) {
            return Response.ok(utente).build();
        }
        return Response.status(Response.Status.NOT_FOUND)
                       .entity("Utente con ID " + id + " non trovato.")
                       .build();
    }

    @POST
    @Transactional
    public Response createUtente(Utente utente) {
        if (utente.username == null || utente.email == null || utente.password == null) {
            return Response.status(Response.Status.BAD_REQUEST)
                           .entity("Username, email e password sono obbligatori.")
                           .build();
        }
        utente.persist(); 
        return Response.status(Response.Status.CREATED).entity(utente).build();
    }

    @PUT
    @Path("/{id}")
    @Transactional
    public Response updateUtente(@PathParam("id") Long id, Utente updatedUtente) {
        Utente utente = Utente.findById(id);
        if (utente != null) {
            utente.username = updatedUtente.username;
            utente.email = updatedUtente.email;
            utente.password = updatedUtente.password;
            utente.persist();
            return Response.ok(utente).build();
        }
        return Response.status(Response.Status.NOT_FOUND)
                       .entity("Utente con ID " + id + " non trovato.")
                       .build();
    }

    @DELETE //delete by id
    @Path("/{id}")
    @Transactional
    public Response deleteUtente(@PathParam("id") Long id) {
        boolean deleted = Utente.deleteById(id);
        if (deleted) {
            return Response.noContent().build();
        }
        return Response.status(Response.Status.NOT_FOUND)
                       .entity("Utente con ID " + id + " non trovato.")
                       .build();
    }
}