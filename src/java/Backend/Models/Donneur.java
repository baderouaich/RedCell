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
    private BigDecimal id_donneur;
    private String prenom;
    private String nom;
    private String region;
    private String ville;
    private String groupe_sanguin;
    private Date date_naissance;
    private String telephone;
    private String email;
    private String password;
    private String disponible;

  
   
}