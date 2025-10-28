<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>

<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 
    <input type="text" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération de la chaîne saisie --%>
<%
    String chaine = request.getParameter("chaine");

    if (chaine != null && !chaine.trim().equals("")) {
        String[] tableauDeChiffres = chaine.trim().split("\\s+");
        int[] tab = new int[tableauDeChiffres.length];
        for (int i = 0; i < tableauDeChiffres.length; i++) {
            tab[i] = Integer.parseInt(tableauDeChiffres[i]);
        }
%>

    <p>Le tableau contient <%= tab.length %> valeurs :</p>
    <%
        for (int i = 0; i < tab.length; i++) {
    %>
        Valeur <%= (i + 1) %> : <%= tab[i] %><br>
    <%
        }
    %>

    <hr>

    <h2>Exercice 1 : Le carré de la première valeur</h2>
    <%
        int carre = tab[0] * tab[0];
    %>
    <p>Le carré de la première valeur (<%= tab[0] %>) est : <%= carre %></p>

    <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
    <%
        int somme2 = tab[0] + tab[1];
    %>
    <p>La somme des deux premières valeurs est : <%= somme2 %></p>

    <h2>Exercice 3 : La somme de toutes les valeurs</h2>
    <%
        int sommeTotale = 0;
        for (int val : tab) {
            sommeTotale += val;
        }
    %>
    <p>La somme de toutes les valeurs est : <%= sommeTotale %></p>

    <h2>Exercice 4 : La valeur maximale</h2>
    <%
        int max = tab[0];
        for (int val : tab) {
            if (val > max) max = val;
        }
    %>
    <p>La valeur maximale est : <%= max %></p>

    <h2>Exercice 5 : La valeur minimale</h2>
    <%
        int min = tab[0];
        for (int val : tab) {
            if (val < min) min = val;
        }
    %>
    <p>La valeur minimale est : <%= min %></p>

    <h2>Exercice 6 : La valeur la plus proche de 0</h2>
    <%
        int procheDeZero = tab[0];
        for (int val : tab) {
            if (Math.abs(val) < Math.abs(procheDeZero)) {
                procheDeZero = val;
            }
        }
    %>
    <p>La valeur la plus proche de 0 est : <%= procheDeZero %></p>

    <h2>Exercice 7 : La valeur la plus proche de 0 (version 2)</h2>
    <%
        int procheDeZero2 = tab[0];
        for (int val : tab) {
            if (Math.abs(val) < Math.abs(procheDeZero2)) {
                procheDeZero2 = val;
            } else if (Math.abs(val) == Math.abs(procheDeZero2) && val > procheDeZero2) {
                // En cas d'égalité, on garde le positif
                procheDeZero2 = val;
            }
        }
    %>
    <p>La valeur la plus proche de 0 (avec préférence pour le positif) est : <%= procheDeZero2 %></p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
