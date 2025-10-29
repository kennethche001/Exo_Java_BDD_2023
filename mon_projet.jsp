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

    // Gestion des actions : ajout, suppression, marquer terminé
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
        taskList.remove(index);
    } else if ("complete".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        taskList.get(index).setCompleted(true);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mini Gestionnaire de Taches</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .completed { 
                text-decoration: line-through; 
                color: gray; }
        table { border-collapse: collapse; width: 70%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
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
