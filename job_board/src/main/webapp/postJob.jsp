<%@ page import="java.sql.*" %>
<%
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String jobTitle = request.getParameter("job_title");
    String jobDescription = request.getParameter("job_description");
    String jobLocation = request.getParameter("job_location");
    String jobType = request.getParameter("job_type");
    String salary = request.getParameter("salary");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Board", "root", "mysql1234");

        String query = "INSERT INTO Jobs (company_id, job_title, job_description, job_location, job_type, salary) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        pstmt.setString(2, jobTitle);
        pstmt.setString(3, jobDescription);
        pstmt.setString(4, jobLocation);
        pstmt.setString(5, jobType);
        pstmt.setString(6, salary);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("Job posted successfully!");
        } else {
            out.println("Job posting failed.");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
