<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "SELECT * FROM Companies";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        out.println("<h2>Companies</h2>");
        out.println("<table border='1'><tr><th>Company ID</th><th>Company Name</th><th>Website</th><th>Description</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("company_id") + "</td>");
            out.println("<td>" + rs.getString("company_name") + "</td>");
            out.println("<td>" + rs.getString("company_website") + "</td>");
            out.println("<td>" + rs.getString("company_description") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
