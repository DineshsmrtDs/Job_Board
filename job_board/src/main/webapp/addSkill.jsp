<%@ page import="java.sql.*" %>
<%
    String skillName = request.getParameter("skill_name");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Skills (skill_name) VALUES (?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, skillName);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Skill added successfully!");
        } else {
            out.println("Failed to add skill.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
