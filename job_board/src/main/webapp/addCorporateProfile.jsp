<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String profileDescription = request.getParameter("profile_description");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO CorporateProfiles (company_id, profile_description) VALUES (?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, profileDescription);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Corporate profile added successfully!");
        } else {
            out.println("Failed to add corporate profile.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
