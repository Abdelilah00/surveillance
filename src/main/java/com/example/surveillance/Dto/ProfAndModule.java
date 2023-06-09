package com.example.surveillance.Dto;

public class ProfAndModule {

    private Integer id;
    private Integer numero;
    private String nomAndPrenom;
    private String module;
    private String filiere;
    private String session;
    private String locale;


    public ProfAndModule(Integer numero, String nomAndPrenom, String module, String filiere, String session, String locale) {
        this.numero = numero;
        this.nomAndPrenom = nomAndPrenom;
        this.module = module;
        this.filiere = filiere;
        this.session = session;
        this.locale = locale;
    }

    public String getLocale() {
        return locale;
    }

    public Integer getId() {
        return id;
    }

    public Integer getNumero() {
        return numero;
    }

    public String getNomAndPrenom() {
        return nomAndPrenom;
    }

    public String getModule() {
        return module;
    }

    public String getFiliere() {
        return filiere;
    }

    public String getSession() {
        return session;
    }
}
