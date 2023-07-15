package com.example.surveillance.Dto;

public class Professeur {
    private Integer id;
    private String nom;
    private String prenom;
    private Integer affectationCountLeft;

    public Integer getAffectationCountLeft() {
        return affectationCountLeft;
    }

    public void setAffectationCountLeft(Integer affectationCountLeft) {
        this.affectationCountLeft = affectationCountLeft;
    }

    public Professeur(Integer id, String nom, String prenom) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNomComplet() {
        return getNom() + " " + getPrenom();
    }
}
