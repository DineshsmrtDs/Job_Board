<%@ page import="java.sql.*" %>
<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String firstName = request.getParameter("first_name");
    String lastName = request.getParameter("last_name");
    String phone = request.getParameter("phone");
    String resume = request.getParameter("resume");
    String linkedinUrl = request.getParameter("linkedin_url");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Profiles (user_id, first_name, last_name, phone, resume, linkedin_url) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setString(2, firstName);
        pstmt.setString(3, lastName);
        pstmt.setString(4, phone);
        pstmt.setString(5, resume);
        pstmt.setString(6, linkedinUrl);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Profile created successfully!");
        } else {
            out.println("Profile creation failed.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
