package com.example.socialmedia.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "commenti", schema = "public")
public class Commento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, updatable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "post_id", nullable = false, foreignKey = @ForeignKey(name = "commenti_post_id_fkey"))
    private Post post;

    @ManyToOne
    @JoinColumn(name = "utente_id", nullable = false, foreignKey = @ForeignKey(name = "commenti_utente_id_fkey"))
    private Utente utente;

    @Column(name = "contenuto", nullable = false)
    private String contenuto;

    @Column(name = "data_creazione", columnDefinition = "timestamp default now()")
    private LocalDateTime dataCreazione;

    @Column(name = "data_modifica", columnDefinition = "timestamp default now()")
    private LocalDateTime dataModifica;

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public String getContenuto() {
        return contenuto;
    }

    public void setContenuto(String contenuto) {
        this.contenuto = contenuto;
    }

    public LocalDateTime getDataCreazione() {
        return dataCreazione;
    }

    public void setDataCreazione(LocalDateTime dataCreazione) {
        this.dataCreazione = dataCreazione;
    }

    public LocalDateTime getDataModifica() {
        return dataModifica;
    }

    public void setDataModifica(LocalDateTime dataModifica) {
        this.dataModifica = dataModifica;
    }
}