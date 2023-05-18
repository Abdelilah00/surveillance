package com.example.surveillance.Dto;

public class Local {
    private Integer id;
    private String nom;
    private Integer capacite;
    private Integer respo;

    public void setRespo(Integer respo) {
        this.respo = respo;
    }

    public String getRespoName() {
        return respoName;
    }

    public void setRespoName(String respoName) {
        this.respoName = respoName;
    }

    private String respoName;

    public Integer getRespo() {
        return respo;
    }

    public Local(Integer id, String nom, Integer capacite, Integer respo) {
        this.id = id;
        this.nom = nom;
        this.capacite = capacite;
        this.respo = respo;
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

    public Integer getCapacite() {
        return capacite;
    }

    public void setCapacite(Integer capacite) {
        this.capacite = capacite;
    }
}
