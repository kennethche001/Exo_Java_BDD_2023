<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de caractères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<%
    String chaine = request.getParameter("chaine");
    if (chaine != null) {
%>

    <%-- Longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- 3e caractère --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3e caractère de votre chaîne est la lettre <%= caractereExtrait %></p>

    <%-- Sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous-chaîne de votre texte : <%= sousChaine %></p>

    <%-- Recherche du premier "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en position : <%= position %></p>

    <hr>

    <h2>Exercice 1 : Combien de 'e' dans notre chaîne de caractères ?</h2>
    <%
        int compteurE = 0;
        for (int i = 0; i < chaine.length(); i++) {
            if (chaine.charAt(i) == 'e' || chaine.charAt(i) == 'E') {
                compteurE++;
            }
        }
    %>
    <p>Votre texte contient <%= compteurE %> lettre(s) 'e'.</p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <%
        String vertical = "";
        for (int i = 0; i < chaine.length(); i++) {
            vertical += chaine.charAt(i) + "<br>";
        }
    %>
    <p><%= vertical %></p>

    <h2>Exercice 3 : Retour à la ligne</h2>
    <%
        String retourLigne = chaine.replace(" ", "<br>");
    %>
    <p><%= retourLigne %></p>

    <h2>Exercice 4 : Afficher une lettre sur deux</h2>
    <%
        String uneLettreSurDeux = "";
        for (int i = 0; i < chaine.length(); i += 2) {
            uneLettreSurDeux += chaine.charAt(i);
        }
    %>
    <p><%= uneLettreSurDeux %></p>

    <h2>Exercice 5 : La phrase en verlant</h2>
    <%
        String verlant = "";
        for (int i = chaine.length() - 1; i >= 0; i--) {
            verlant += chaine.charAt(i);
        }
    %>
    <p><%= verlant %></p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <%
        int voyelles = 0;
        int consonnes = 0;
        String lettres = chaine.toLowerCase();

        for (int i = 0; i < lettres.length(); i++) {
            char c = lettres.charAt(i);
            if (Character.isLetter(c)) {
                if ("aeiouy".indexOf(c) != -1) {
                    voyelles++;
                } else {
                    consonnes++;
                }
            }
        }
    %>
    <p>Voyelles : <%= voyelles %> | Consonnes : <%= consonnes %></p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
