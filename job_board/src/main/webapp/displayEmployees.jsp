<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "SELECT * FROM Users WHERE user_type = 'job_seeker'";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        out.println("<h2>Employees</h2>");
        out.println("<table border='1'><tr><th>User ID</th><th>Username</th><th>Email</th><th>Created At</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("user_id") + "</td>");
            out.println("<td>" + rs.getString("username") + "</td>");
            out.println("<td>" + rs.getString("email") + "</td>");
            out.println("<td>" + rs.getTimestamp("created_at") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
