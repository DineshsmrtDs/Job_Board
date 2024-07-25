<%@ page import="java.sql.*" %>
<%
    int jobId = Integer.parseInt(request.getParameter("job_id"));
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String coverLetter = request.getParameter("cover_letter");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Applications (job_id, user_id, cover_letter) VALUES (?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, jobId);
        pstmt.setInt(2, userId);
        pstmt.setString(3, coverLetter);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Application submitted successfully!");
        } else {
            out.println("Application submission failed.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
