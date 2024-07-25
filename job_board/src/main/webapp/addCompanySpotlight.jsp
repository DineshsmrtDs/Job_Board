<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String spotlightMessage = request.getParameter("spotlight_message");
    String startDate = request.getParameter("start_date");
    String endDate = request.getParameter("end_date");
    String mediaUrl = request.getParameter("media_url");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO CompanySpotlight (company_id, spotlight_message, start_date, end_date, media_url) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, spotlightMessage);
        pstmt.setString(3, startDate);
        pstmt.setString(4, endDate);
        pstmt.setString(5, mediaUrl);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Company spotlight added successfully!");
        } else {
            out.println("Failed to add company spotlight.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
