<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String photoUrl = request.getParameter("photo_url");
    String photoDescription = request.getParameter("photo_description");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO PhotoGallery (company_id, photo_url, photo_description) VALUES (?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, photoUrl);
        pstmt.setString(3, photoDescription);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Photo added successfully!");
        } else {
            out.println("Failed to add photo.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
