<%@ page import="java.sql.*" %>
<%
    String companyName = request.getParameter("company_name");
    String town = request.getParameter("town");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        StringBuilder query = new StringBuilder("SELECT C.company_id, C.company_name, C.company_website, C.company_description " +
                                                "FROM Companies C " +
                                                "JOIN Profiles P ON C.user_id = P.user_id " +
                                                "WHERE 1=1");
        if (companyName != null && !companyName.trim().isEmpty()) {
            query.append(" AND C.company_name LIKE ?");
        }
        if (town != null && !town.trim().isEmpty()) {
            query.append(" AND P.town = ?");
        }

        PreparedStatement pstmt = con.prepareStatement(query.toString());

        int paramIndex = 1;
        if (companyName != null && !companyName.trim().isEmpty()) {
            pstmt.setString(paramIndex++, "%" + companyName + "%");
        }
        if (town != null && !town.trim().isEmpty()) {
            pstmt.setString(paramIndex, town);
        }

        ResultSet rs = pstmt.executeQuery();

        out.println("<h2>Companies Search Results</h2>");
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

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
