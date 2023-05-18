package com.example.surveillance.Dto;

public class Location {
    private int id;
    private int locale;
    private int horaire;
    private int surr;

    public Location(int id, int locale, int horaire, int surr) {
        this.id = id;
        this.locale = locale;
        this.horaire = horaire;
        this.surr = surr;
    }

    public int getId() {
        return id;
    }

    public int getLocale() {
        return locale;
    }

    public int getHoraire() {
        return horaire;
    }

    public int getSurr() {
        return surr;
    }
}
