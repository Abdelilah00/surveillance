package com.example.surveillance.Dto;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class Consultation {
    Integer horaireId;
    String module;
    String filiere;
    String date;
    String heure;
    String duree;
    List<String> locals;
    Integer nbs;


    public Consultation(Integer horaireId,String module, String filiere, String date, String heure, String duree, List<String> locals, Integer nbs) {
        this.horaireId = horaireId;
        this.module = module;
        this.filiere = filiere;
        this.date = date;
        this.heure = heure;
        this.duree = duree;
        this.locals = locals;
        this.nbs = nbs;
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
    public List<String> getLocals() {
        return locals;
    }

    public String getFormattedLocals() {
        return String.join(" - ", locals);
    }

    public Integer getNbs() {
        return nbs;
    }
}
