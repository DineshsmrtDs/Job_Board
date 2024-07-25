<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String productName = request.getParameter("product_name");
    String productDescription = request.getParameter("product_description");
    String productUrl = request.getParameter("product_url");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO ProductOverview (company_id, product_name, product_description, product_url) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, productName);
        pstmt.setString(3, productDescription);
        pstmt.setString(4, productUrl);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Product overview added successfully!");
        } else {
            out.println("Failed to add product overview.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
