<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String newsTitle = request.getParameter("news_title");
    String newsContent = request.getParameter("news_content");
    String newsDate = request.getParameter("news_date");
    String newsUrl = request.getParameter("news_url");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO News (company_id, news_title, news_content, news_date, news_url) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, newsTitle);
        pstmt.setString(3, newsContent);
        pstmt.setString(4, newsDate);
        pstmt.setString(5, newsUrl);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("News added successfully!");
        } else {
            out.println("Failed to add news.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
