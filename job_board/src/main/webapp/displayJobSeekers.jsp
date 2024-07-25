<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "SELECT * FROM Profiles JOIN Users ON Profiles.user_id = Users.user_id WHERE Users.user_type = 'job_seeker'";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        out.println("<h2>Job Seekers</h2>");
        out.println("<table border='1'><tr><th>User ID</th><th>Username</th><th>First Name</th><th>Last Name</th><th>Phone</th><th>Resume</th><th>LinkedIn</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("user_id") + "</td>");
            out.println("<td>" + rs.getString("username") + "</td>");
            out.println("<td>" + rs.getString("first_name") + "</td>");
            out.println("<td>" + rs.getString("last_name") + "</td>");
            out.println("<td>" + rs.getString("phone") + "</td>");
            out.println("<td>" + rs.getString("resume") + "</td>");
            out.println("<td>" + rs.getString("linkedin_url") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
