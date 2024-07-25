<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String awardName = request.getParameter("award_name");
    String awardDescription = request.getParameter("award_description");
    String awardDate = request.getParameter("award_date");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Awards (company_id, award_name, award_description, award_date) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, awardName);
        pstmt.setString(3, awardDescription);
        pstmt.setString(4, awardDate);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Award added successfully!");
        } else {
            out.println("Failed to add award.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
