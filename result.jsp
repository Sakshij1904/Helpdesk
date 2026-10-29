<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Helpdesk Records</title>
</head>
<body>

<h2>All Helpdesk Records</h2>

<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/helpdeskdb", "root", "root"
);

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM helpdesk");
%>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Raised By</th>
        <th>Issue Type</th>
        <th>Priority</th>
        <th>Description</th>
        <th>Status</th>
    </tr>

    <%
    while(rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("raised_by") %></td>
        <td><%= rs.getString("issue_type") %></td>
        <td><%= rs.getString("priority") %></td>
        <td><%= rs.getString("description") %></td>
        <td><%= rs.getString("status") %></td>
    </tr>
    <%
    }

    rs.close();
    st.close();
    con.close();
    %>
</table>

</body>
</html>