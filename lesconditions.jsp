<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>

<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" name="valeur2">
    <p>Saisir la valeur 3 (pour l'exercice 1) : <input type="text" name="valeur3">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<%
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");

    if (valeur1 != null && valeur2 != null && !valeur1.equals("") && !valeur2.equals("")) {
        int intValeur1 = Integer.parseInt(valeur1);
        int intValeur2 = Integer.parseInt(valeur2);
%>

    <%-- Comparaison de base entre les deux valeurs --%>
    <% if (intValeur1 > intValeur2) { %>
        <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
        <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
        <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>

    <hr>

    <h2>Exercice 1 : Comparaison 1 (C compris entre A et B)</h2>
    <%
        if (valeur3 != null && !valeur3.equals("")) {
            int intValeur3 = Integer.parseInt(valeur3);

            int min = Math.min(intValeur1, intValeur2);
            int max = Math.max(intValeur1, intValeur2);

            if (intValeur3 >= min && intValeur3 <= max) {
    %>
                <p>Oui, la valeur C (<%= intValeur3 %>) est comprise entre A (<%= intValeur1 %>) et B (<%= intValeur2 %>).</p>
    <%
            } else {
    %>
                <p>Non, la valeur C (<%= intValeur3 %>) n'est pas comprise entre A (<%= intValeur1 %>) et B (<%= intValeur2 %>).</p>
    <%
            }
        } else {
    %>
        <p>Veuillez saisir les trois valeurs pour cet exercice.</p>
    <%
        }
    %>

    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <%
        if (valeur1 != null && !valeur1.equals("")) {
            int nombre = Integer.parseInt(valeur1);
            if (nombre % 2 == 0) {
    %>
                <p>Le nombre <%= nombre %> est pair.</p>
    <%
            } else {
    %>
                <p>Le nombre <%= nombre %> est impair.</p>
    <%
            }
        }
    %>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
