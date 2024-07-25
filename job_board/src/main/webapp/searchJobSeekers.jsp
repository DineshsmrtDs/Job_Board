<%@ page import="java.sql.*" %>
<%
    String town = request.getParameter("town");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "SELECT U.user_id, U.username, P.first_name, P.last_name, P.phone " +
                       "FROM Users U " +
                       "JOIN Profiles P ON U.user_id = P.user_id " +
                       "WHERE U.user_type = 'job_seeker' " +
                       "AND P.town = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, town);
        ResultSet rs = pstmt.executeQuery();

        out.println("<h2>Job Seekers in " + town + "</h2>");
        out.println("<table border='1'><tr><th>User ID</th><th>Username</th><th>First Name</th><th>Last Name</th><th>Phone</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("user_id") + "</td>");
            out.println("<td>" + rs.getString("username") + "</td>");
            out.println("<td>" + rs.getString("first_name") + "</td>");
            out.println("<td>" + rs.getString("last_name") + "</td>");
            out.println("<td>" + rs.getString("phone") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
