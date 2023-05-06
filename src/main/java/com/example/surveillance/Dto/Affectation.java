package com.example.surveillance.Dto;

import java.net.Inet4Address;

public class Affectation {
    Integer horaireId;
    String module ;
    String filiere ;
    String date ;
    String heure ;
    String duree ;

    public Affectation(Integer horaireId, String module, String filiere, String date, String heure, String duree) {
        this.horaireId=horaireId;
        this.module = module;
        this.filiere = filiere;
        this.date=date;
        this.heure = heure;
        this.duree = duree;
    }

    public Integer getHoraireId() {
        return horaireId;
    }
    public String getModule() {
        return module;
    }
    public String getFiliere() {
        return filiere;
    }
    public String getDate() {
        return date;
    }
    public String getHeure() {
        return heure;
    }
    public String getDuree() {
        return duree;
    }
}
