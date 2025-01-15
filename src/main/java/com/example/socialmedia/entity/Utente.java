package com.example.socialmedia.entity;

import java.time.LocalDateTime;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "utenti")
public class Utente extends PanacheEntity {

    @Column(nullable = false, unique = true, length = 255)
    public String username;

    @Column(nullable = false, unique = true, length = 255) 
    public String email;

    @Column(nullable = false, length = 255)
    public String password;

    @Column(name = "data_creazione", nullable = false, updatable = false)
    public LocalDateTime dataCreazione;

    @Column(name = "data_modifica", nullable = false)
    public LocalDateTime dataModifica;

    public Utente() {}

    public Utente(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    @PrePersist
    protected void onCreate() {
        this.dataCreazione = LocalDateTime.now();
        this.dataModifica = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.dataModifica = LocalDateTime.now();
    }
}