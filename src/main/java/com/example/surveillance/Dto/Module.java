package com.example.surveillance.Dto;

public class Module {
    private Integer id;
    private String nom;
    private Integer respo;

    private String respoName;

    public void setRespo(Integer respo) {
        this.respo = respo;
    }

    public String getRespoName() {
        return respoName;
    }

    public void setRespoName(String respoName) {
        this.respoName = respoName;
    }

    public Module(Integer id, String nom, Integer respo) {
        this.id = id;
        this.nom = nom;
    }
    public Integer getId() {
        return id;
    }
    public Integer getRespo() {
        return respo;
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
}
