package com.example.socialmedia.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "dms", schema = "public")
public class Dms {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, updatable = false)
    private Integer id;

    @Column(name = "mittente_id", nullable = false)
    private Integer mittenteId;

    @Column(name = "destinatario_id", nullable = false)
    private Integer destinatarioId;

    @Column(name = "messaggio", nullable = false)
    private String messaggio;

    @Column(name = "data_creazione", columnDefinition = "timestamp default now()")
    private LocalDateTime dataCreazione;

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMittenteId() {
        return mittenteId;
    }

    public void setMittenteId(Integer mittenteId) {
        this.mittenteId = mittenteId;
    }

    public Integer getDestinatarioId() {
        return destinatarioId;
    }

    public void setDestinatarioId(Integer destinatarioId) {
        this.destinatarioId = destinatarioId;
    }

    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }

    public LocalDateTime getDataCreazione() {
        return dataCreazione;
    }

    public void setDataCreazione(LocalDateTime dataCreazione) {
        this.dataCreazione = dataCreazione;
    }
}