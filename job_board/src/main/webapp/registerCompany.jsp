<%@ page import="java.sql.*" %>
<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String companyName = request.getParameter("company_name");
    String companyWebsite = request.getParameter("company_website");
    String companyDescription = request.getParameter("company_description");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Companies (user_id, company_name, company_website, company_description) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setString(2, companyName);
        pstmt.setString(3, companyWebsite);
        pstmt.setString(4, companyDescription);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Company registered successfully!");
        } else {
            out.println("Company registration failed.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
