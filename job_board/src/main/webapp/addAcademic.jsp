<%@ page import="java.sql.*" %>
<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String institutionName = request.getParameter("institution_name");
    String degree = request.getParameter("degree");
    String fieldOfStudy = request.getParameter("field_of_study");
    String startDate = request.getParameter("start_date");
    String endDate = request.getParameter("end_date");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Academics (user_id, institution_name, degree, field_of_study, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setString(2, institutionName);
        pstmt.setString(3, degree);
        pstmt.setString(4, fieldOfStudy);
        pstmt.setString(5, startDate);
        pstmt.setString(6, endDate);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Academic record added successfully!");
        } else {
            out.println("Failed to add academic record.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
