<%-- <%@ page import="com.weblabs.service.impl.EmployeeTasksDAO" %>
<%@ page import="com.weblabs.model.EmployeeTask" %>
<%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
    // Sample data for recent tasks (you should replace this with your actual data retrieval logic)
    List<EmployeeTask> recentTasks = EmployeeTasksDAO.getRecentTasks(username);
%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include your head content here, similar to the admin dashboard -->
</head>
<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- /Header -->

        <!-- Sidebar -->
        <jsp:include page="sidebar.jsp" />
        <!-- /Sidebar -->

        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <!-- Page Content -->
            <div class="content container-fluid">

                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Display welcome message -->
                            <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                              <%--   Welcome <%= username %>! --%>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

                <div class="row">
                    <!-- Add employee-specific dashboard elements here -->
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-6">
                        <div class="card dash-widget">
                            <div class="card-body">
                                <span class="dash-widget-icon"><i class="fa fa-tasks"></i></span>
                                <div class="dash-widget-info">
                                   <%--  <h3><%= recentTasks.size() %></h3> --%>
                                    <span>Recent Tasks</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Add more employee-specific elements as needed -->

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <!-- Employee-specific content (e.g., recent tasks, announcements, etc.) -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title mb-0">Recent Tasks</h3>
                            </div>
                            <div class="card-body">
                              <%--   <ul>
                                    <% for (EmployeeTask task : recentTasks) { %>
                                        <li><%= task.getDescription() %> - <%= task.getStatus() %></li>
                                    <% } %>
                                </ul> --%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /Page Content -->

        </div>
        <!-- /Page Wrapper -->

    </div>
    <!-- /Main Wrapper -->

    <!-- Include your script tags and other JavaScript content here -->

</body>
</html>
