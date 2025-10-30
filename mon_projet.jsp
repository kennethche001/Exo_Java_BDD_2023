<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
    class Task {
        private String title;
        private String description;
        private String dueDate;
        private boolean completed;

        public Task(String title, String description, String dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
            this.completed = false;
        }

        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public String getDueDate() { return dueDate; }
        public boolean isCompleted() { return completed; }
        public void setCompleted(boolean completed) { this.completed = completed; }
    }

    ArrayList<Task> taskList = (ArrayList<Task>) session.getAttribute("taskList");
    if (taskList == null) {
        taskList = new ArrayList<>();
        session.setAttribute("taskList", taskList);
    }

    String action = request.getParameter("action");
    if ("add".equals(action)) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDate = request.getParameter("dueDate");
        if (title != null && !title.isEmpty()) {
            taskList.add(new Task(title, description, dueDate));
        }
} else if ("delete".equals(action)) {
    int index = Integer.parseInt(request.getParameter("index"));
    if (index >= 0 && index < taskList.size()) {
        taskList.remove(index);
    }
    // Redirection pour éviter la répétition de l'action après rafraîchissement
    response.sendRedirect("mon_projet.jsp");
    return;
} else if ("complete".equals(action)) {
    int index = Integer.parseInt(request.getParameter("index"));
    if (index >= 0 && index < taskList.size()) {
        taskList.get(index).setCompleted(true);
    }
    // Redirection ici aussi
    response.sendRedirect("mon_projet.jsp");
    return;
}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestionnaire de Taches de Kenneth</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(120deg, #74ABE2, #5563DE);
        color: #333;
        margin: 0;
        padding: 0;
    }

    h1 {
        background-color: #3949ab;
        color: white;
        text-align: center;
        padding: 20px 0;
        margin: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }

    h2 {
        color: #2e3b8b;
        margin-left: 10%;
    }

    form {
        background: white;
        width: 70%;
        margin: 20px auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
    }

    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
    }

    input[type="text"], input[type="date"] {
        width: 97%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input[type="submit"] {
        background-color: #3949ab;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        transition: background 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #283593;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 20px auto;
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
    }

    th {
        background-color: #3f51b5;
        color: white;
        padding: 12px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .completed {
        text-decoration: line-through;
        color: gray;
    }

    a {
        text-decoration: none;
        color: #3949ab;
        font-weight: bold;
    }

    a:hover {
        color: #1a237e;
        text-decoration: underline;
    }

    .footer {
        text-align: center;
        margin-top: 30px;
        padding: 15px;
        color: white;
        font-size: 14px;
    }
    </style>

</head>
<body>
    <h1>Mini gestionnaire de taches</h1>

    <h2>Ajouter une tache</h2>
    <form method="post" action="mon_projet.jsp">
        <input type="hidden" name="action" value="add">
        <label>Titre: <input type="text" name="title" required></label><br><br>
        <label>Description: <input type="text" name="description"></label><br><br>
        <label>Date de fin: <input type="date" name="dueDate"></label><br><br>
        <input type="submit" value="Ajouter">
    </form>

    <h2>Liste des taches</h2>
    <table>
        <tr>
            <th>Titre</th>
            <th>Description</th>
            <th>Date de fin</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
        <%
            for (int i = 0; i < taskList.size(); i++) {
                Task t = taskList.get(i);
        %>
        <tr>
            <td class="<%= t.isCompleted() ? "completed" : "" %>"><%= t.getTitle() %></td>
            <td class="<%= t.isCompleted() ? "completed" : "" %>"><%= t.getDescription() %></td>
            <td class="<%= t.isCompleted() ? "completed" : "" %>"><%= t.getDueDate() != null ? t.getDueDate() : "" %></td>
            <td class="<%= t.isCompleted() ? "completed" : "" %>"><%= t.isCompleted() ? "Terminee" : "En cours" %></td>
            <td>
                <% if (!t.isCompleted()) { %>
                    <a href="mon_projet.jsp?action=complete&index=<%=i%>">Terminer</a> |
                <% } %>
                <a href="mon_projet.jsp?action=delete&index=<%=i%>">Supprimer</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
