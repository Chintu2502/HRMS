<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.TimeSheetDAO" %>
<%@ page import="com.weblabs.beans.AddTimesheet" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <!-- Add your CSS and JavaScript includes here -->
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

   <!-- Fontawesome CSS -->
     <link rel="stylesheet" href="css/font-awesome.min.css">

 <!--    Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

 <!--    Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

 <!--    Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

 <!--    Main CSS -->
    <link rel="stylesheet" href="css/style.css">
 <!--    table styles CSS -->
    <link rel="stylesheet" href="css/tstyles.css">

   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<AddTimesheet> timesheet = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
       timesheet = TimeSheetDAO.getFilteredTimesheets(whereClause, start, limit);
    }

    if (timesheet!= null && !timesheet.isEmpty()) {
    	AddTimesheet time = timesheet.get(0); // Access the first element
        if (timesheet != null) {
%>

   
   <div class="main-wrapper">

    <!-- Header -->
    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <!-- Include your sidebar HTML here -->
    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            
            <div class="page-header">
<form action="./EditTimeSheetSrv" method="post">
  <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-form-label">ID <span class="text-danger">*</span></label>
                            <input name="id" value="<%= time.getId() %>" required class="form-control" type="text" readonly>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Project <span class="text-danger">*</span></label>
                            <input name="project" value="<%= time.getProject() %>" required class="form-control" type="text">
                        </div>
              
                        <div class="form-group">
                            <label class="col-form-label">Deadline <span class="text-danger">*</span></label>
                            <input name="deadline" value="<%= time.getDeadline() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Total Hours <span class="text-danger">*</span></label>
                            <input name="totalhours" value="<%= time.getTotalhours() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Remaining Hours <span class="text-danger">*</span></label>
                            <input name="remaininghours" value="<%= time.getRemainingHours() %>" required class="form-control" type="text">
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Date <span class="text-danger">*</span></label>
                            <input name="date" value="<%= time.getDate() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Hours <span class="text-danger">*</span></label>
                            <input name="hours" value="<%= time.getHours() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Description <span class="text-danger">*</span></label>
                            <input name="description" value="<%= time.getDescription() %>" required class="form-control" type="text">
                        </div>
                       
 
                        <div class="submit-section">
                            <button type="submit" name="update_employee" class="btn btn-primary submit-btn">Update</button>
                        </div>
                  </div>
                </div>
                        </form>
                         </div>
                   </div>
                </div>
                </div>
                <%
    HttpSession sessionstatus = request.getSession(true);

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Employee Position Updated Successfully!")) {
        response.sendRedirect("employee.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>Employee not found with the provided ID.</p>
</div>
<%
    }
%>
<%
        }
%>
<%
        }
%>
<!-- Include your JavaScript libraries here -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
                
                        