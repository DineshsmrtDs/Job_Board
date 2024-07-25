<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String literatureTitle = request.getParameter("literature_title");
    String literatureContent = request.getParameter("literature_content");
    String literatureUrl = request.getParameter("literature_url");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO TechnicalLiterature (company_id, literature_title, literature_content, literature_url) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, literatureTitle);
        pstmt.setString(3, literatureContent);
        pstmt.setString(4, literatureUrl);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Technical literature added successfully!");
        } else {
            out.println("Failed to add technical literature.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
