<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String partnerName = request.getParameter("partner_name");
    String partnerType = request.getParameter("partner_type");
    String partnerUrl = request.getParameter("partner_url");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO PartnersCustomers (company_id, partner_name, partner_type, partner_url) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, partnerName);
        pstmt.setString(3, partnerType);
        pstmt.setString(4, partnerUrl);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Partner/Customer added successfully!");
        } else {
            out.println("Failed to add Partner/Customer.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
