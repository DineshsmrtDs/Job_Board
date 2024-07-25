<%@ page import="java.sql.*" %>
<%
    int applicationId = Integer.parseInt(request.getParameter("application_id"));
    String status = request.getParameter("status");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");
        String query = "UPDATE JobApplications SET status = ? WHERE application_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, status);
        pstmt.setInt(2, applicationId);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Application status updated successfully!");
        } else {
            out.println("Failed to update application status.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
