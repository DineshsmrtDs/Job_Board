<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "SELECT * FROM Users WHERE user_type = 'job_seeker' AND username LIKE ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, "%" + username + "%");
        ResultSet rs = pstmt.executeQuery();

        out.println("<h2>Employees with Username Like '" + username + "'</h2>");
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

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
