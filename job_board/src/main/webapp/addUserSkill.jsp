<%@ page import="java.sql.*" %>
<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    int skillId = Integer.parseInt(request.getParameter("skill_id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO UserSkills (user_id, skill_id) VALUES (?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setInt(2, skillId);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("User skill added successfully!");
        } else {
            out.println("Failed to add user skill.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
