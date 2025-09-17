<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    </p>
    <% } %>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Double boucle pour former un carré d'étoiles --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <P>
        <% for (int j = 1; j <= cpt; j++) { %>
            <%= "*" %>
        <% } %>
        </P>
    <% } %>


<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Double boucle pour former un triangle rectangle aligné à gauche --%>
<% for (int i = 1; i <= cpt; i++) { %>
        <P>
        <% for (int j = 1; j <= i; j++) { %>
            <%= "*" %>
        <% } %>
        </P>
    <% } %>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Double boucle pour produire un triangle rectangle aligné à gauche --%>
<% for (int i = 1; i <= cpt; i--) { %>    
        <P>
        <% for (int j = 1; j <= i; j++) { %>
            <%= "*" %>
        <% } %>
        </P>
    <% } %>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Boucle pour construire le triangle rectangle aligné à droite --%>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
        <%-- Affichage des espaces pour aligner à droite --%>
        <% for (int j = 1; j <= (cpt - i); j++) { %>
            &nbsp;
        <% } %>
        
        <%-- Affichage des étoiles --%>
        <% for (int k = 1; k <= i; k++) { %>
            *
        <% } %>
    </p>
<% } %>

<h2>Exercice 5 : Triangle isocele</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Double boucle pour produire un triangle rectangle aligné à droite --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        
        <%-- Boucle pour les espaces --%>
        <% for (int j = 1; j <= cpt - i; j++) { %>
            <%= " " %>
        <% } %>

        <%-- Boucle pour les étoiles --%>
        <% for (int k = 1; k <= i; k++) { %>
            <%= "*" %>
        <% } %>
        
    <% } %>

<h2>Exercice 6 : Le demi losange</h2>
<p>Ecrire le code afin de produire un losange</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <% int n = Integer.parseInt(valeur); %>

    <%-- Partie haute du losange --%>
    <% for (int i = 1; i <= n; i++) { %>
        <pre>
        <%-- Espaces avant les étoiles --%>
        <% for (int j = 1; j <= n - i; j++) { %>
            <%= " " %>
        <% } %>
        <%-- Étoiles --%>
        <% for (int k = 1; k <= 2 * i - 1; k++) { %>
            <%= "*" %>
        <% } %>
        </pre>
    <% } %>

    <%-- Partie basse du losange --%>
    <% for (int i = n - 1; i >= 1; i--) { %>
        <pre>
        <%-- Espaces avant les étoiles --%>
        <% for (int j = 1; j <= n - i; j++) { %>
            <%= " " %>
        <% } %>
        <%-- Étoiles --%>
        <% for (int k = 1; k <= 2 * i - 1; k++) { %>
            <%= "*" %>
        <% } %>
        </pre>
    <% } %>
<% } %>


<h2>Exercice 7 : La table de multiplication</h2>
<p>Ecrire le code afin de créser une table de multiplication</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <% int n = Integer.parseInt(valeur); %>

    <%-- Boucle pour générer la table de multiplication --%>
    <% for (int i = 1; i <= n; i++) { %>
        <p><%= n %> x <%= i %> = <%= (n * i) %></p>
    <% } %>
<% } %>


<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
