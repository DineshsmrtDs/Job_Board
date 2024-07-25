<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
        }
        .section {
            margin-bottom: 30px;
        }
        .section h2 {
            cursor: pointer;
            color: #007BFF;
            text-decoration: underline;
        }
        .section-content {
            display: none;
            margin-top: 10px;
        }
        .section-content a {
            display: block;
            margin: 10px 0;
            text-decoration: none;
            color: #007BFF;
        }
        .section-content a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function toggleSection(sectionId) {
            var content = document.getElementById(sectionId);
            content.style.display = content.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <h1>Main Menu</h1>

    <!-- Job Seekers Section -->
    <div class="section">
        <h2 onclick="toggleSection('jobSeekersContent')">Job Seekers</h2>
        <div id="jobSeekersContent" class="section-content">
            <ul>
                <li><a href="user.jsp">Users</a></li>
                <li><a href="profiles.jsp">Profiles</a></li>
                <li><a href="skills.jsp">Skills</a></li>
                <li><a href="userskills.jsp">UserSkills</a></li>
                <li><a href="academic_record.jsp">Academics</a></li>
                <li><a href="applications.jsp">Applications</a></li>
                <li><a href="searchJobSeekers.jsp">Search Job Seekers by Town</a></li>
                <li><a href="displayJobSeekers.jsp">Display Job Seekers</a></li>
            </ul>
        </div>
    </div>

    <!-- Employers Perspective Section -->
    <div class="section">
        <h2 onclick="toggleSection('employersContent')">Employers Perspective</h2>
        <div id="employersContent" class="section-content">
            <ul>
                <li><a href="jobs.jsp">Jobs</a></li>
                <li><a href="jobskills.jsp">JobSkills</a></li>
                <li><a href="searchEmployees.jsp">Search Employees by Username</a></li>
                <li><a href="displayEmployees.jsp">Display Employees</a></li>
            </ul>
        </div>
    </div>

    <!-- Companies Section -->
    <div class="section">
        <h2 onclick="toggleSection('companiesContent')">Companies</h2>
        <div id="companiesContent" class="section-content">
            <ul>
                <li><a href="companies.jsp">Companies</a></li>
                <li><a href="company_spotlight.jsp">CompanySpotlight</a></li>
                <li><a href="product_overview.jsp">ProductOverview</a></li>
                <li><a href="partners_customers.jsp">PartnersCustomers</a></li>
                <li><a href="awards.jsp">Awards</a></li>
                <li><a href="news.jsp">News</a></li>
                <li><a href="contacts.jsp">Contacts</a></li>
                <li><a href="photo_gallery.jsp">PhotoGallery</a></li>
                <li><a href="corporate_profiles.jsp">CorporateProfiles</a></li>
                <li><a href="technical_literature.jsp">TechnicalLiterature</a></li>
                <li><a href="industry_speaks.jsp">IndustrySpeaks</a></li>
                <li><a href="searchCompanies.jsp">Search Companies</a></li>
                <li><a href="displayCompanies.jsp">Display Companies</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
