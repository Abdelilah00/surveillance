package com.example.surveillance.Dto;

public class Session {
    Integer id;
    String nom;
    String type;

    public Session(String nom, String type) {
        this.nom = nom;
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getType() {
        return type;
    }
}
