package com.weblabs.srv;

import java.io.IOException; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.AddProjectServiceImp;
import com.weblabs.service.impl.EmployeeServiceImpl;

@WebServlet("/AddProjectSrv")
public class AddProjectSrv extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

           HttpSession session = request.getSession();
//        String userType = (String) session.getAttribute("usertype");
//        String userName = (String) session.getAttribute("username");
//        String password = (String) session.getAttribute("password");
//
//        if (userType == null || !userType.equals("admin")) {
//            response.sendRedirect("login.jsp?message=Access Denied!");
//        } else if (userName == null || password == null) {
//            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//        }\

        String status = "Add P Failed!";
        String projectname = request.getParameter("projectname");
        String client = request.getParameter("clients");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String rate= request.getParameter("rate");
        String hourly= request.getParameter("hourly");
        String priority= request.getParameter("priority");
        String projectleader= request.getParameter("projectleader");
        String addteam= request.getParameter("addteam");
        String description= request.getParameter("description");
        String uploadfile= request.getParameter("uploadfile");
       
        
       AddProjectServiceImp employee = new AddProjectServiceImp();
        status=employee.addProject(projectname, client, startdate, enddate, rate, hourly, priority, projectleader, addteam, description, uploadfile);
        
    		  
    		   RequestDispatcher rd = request.getRequestDispatcher("includes/projects/add.jsp?message=" + status);
       rd.forward(request, response);
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}
