/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend.Models;

/**
 *
 * @author bader
 */
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class Donneur implements Serializable
{
    private BigDecimal id;
    private String prenom;
    private String nom;
    private String ville;
    private String adresse;
    private String groupe_sanguin;
    private Date date_naissance;
    private String telephone;
    private String email;
    private String password;
    private String disponible;

    public Donneur(BigDecimal id, String prenom, String nom, String ville, String adresse, String groupe_sanguin, Date date_naissance, String telephone, String email, String password, String disponible) {
        this.id = id;
        this.prenom = prenom;
        this.nom = nom;
        this.ville = ville;
        this.adresse = adresse;
        this.groupe_sanguin = groupe_sanguin;
        this.date_naissance = date_naissance;
        this.telephone = telephone;
        this.email = email;
        this.password = password;
        this.disponible = disponible;
    }

    
    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getGroupe_sanguin() {
        return groupe_sanguin;
    }

    public void setGroupe_sanguin(String groupe_sanguin) {
        this.groupe_sanguin = groupe_sanguin;
    }

    public Date getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(Date date_naissance) {
        this.date_naissance = date_naissance;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisponible() {
        return disponible;
    }

    public void setDisponible(String disponible) {
        this.disponible = disponible;
    }

   
}