<%-- 
    Document   : Register
    Created on : Jun 2, 2021, 4:59:13 PM
    Author     : bader
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${pageContext.request.contextPath}/Resources/Images/BloodDrop.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Register</title>
        <link rel="stylesheet" href="Register.css"/>

    </head>
    <body class="background-image">

        <%@include file="../Header/Header.jsp" %>




        <div class="container">

            <form class="register-form"> 
                <p class="title">Vous voulez sauver des vies ? Entrez vos coordonnées pour devenir donateur ! et quelqu'un qui a besoin de sang vous contactera au besoin.<br> <span>(N.B : vous pouvez vous désinscrire à tout moment)</span></p>
               

                <div class="input-form">
                    <label>Prenom<span style="color:red;">*</span> :</label>
                    <input type="text" name="prenom" placeholder="Prenom..." required/>
                </div>

                <div class="input-form">
                    <label>Nom<span style="color:red;">*</span> :</label>
                    <input type="text" name="nom" placeholder="Nom..." required/>
                </div>

                <div class="input-form">
                    <label>Ville<span style="color:red;">*</span> :</label>
                    <input type="text" name="ville" placeholder="Ville..." required/>
                </div>

                <div class="input-form">
                    <label>Adresse<span style="color:red;">*</span> :</label>
                    <input type="text" name="adresse" placeholder="Adresse..." required/>
                </div>

                <div class="input-form">
                    <label>Groupe Sanguin<span style="color:red;">*</span> :</label>
                    <select name="groupe_sanguin">
                        <option value="O+" selected>O+</option>
                        <option value="O-">O-</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>

                <div class="input-form">
                    <label>Date de Naissance<span style="color:red;">*</span> :</label>
                    <input type="date" value='1999-07-18' name="date_naissance" required/>
                </div>


                <div class="input-form">
                    <label>Telephone<span style="color:red;">*</span> :</label>
                    <input type="tel" name="telephone"  placeholder="Telephone..." required/>
                </div>

                <div class="input-form">
                    <label>Email<span style="color:red;">*</span> :</label>
                    <input type="email" name="email"  placeholder="Email..." required/>
                </div>

                <div class="input-form">
                    <label>Mot de passe<span style="color:red;">*</span> :</label>
                    <input type="password" name="password"  placeholder="Password..." required/>
                </div>

                
                <input class="register-button" type="submit" value="S'inscrire"/>
            </form>
        </div>









        <%@include file="../Footer/Footer.jsp" %>

    </body>
</html>
