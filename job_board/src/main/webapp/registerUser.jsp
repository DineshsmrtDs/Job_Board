<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String userType = request.getParameter("user_type");

    // Hashing the password (consider using a library like BCrypt for stronger security)
    String passwordHash = Integer.toString(password.hashCode());

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Users (username, password_hash, email, user_type) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, passwordHash);
        pstmt.setString(3, email);
        pstmt.setString(4, userType);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Registration successful!");
        } else {
            out.println("Registration failed.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
