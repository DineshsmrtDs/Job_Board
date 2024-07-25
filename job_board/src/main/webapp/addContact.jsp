<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String contactName = request.getParameter("contact_name");
    String contactPosition = request.getParameter("contact_position");
    String contactEmail = request.getParameter("contact_email");
    String contactPhone = request.getParameter("contact_phone");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Contacts (company_id, contact_name, contact_position, contact_email, contact_phone) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, contactName);
        pstmt.setString(3, contactPosition);
        pstmt.setString(4, contactEmail);
        pstmt.setString(5, contactPhone);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Contact added successfully!");
        } else {
            out.println("Failed to add contact.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
