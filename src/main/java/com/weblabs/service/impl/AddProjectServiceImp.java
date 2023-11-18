package com.weblabs.service.impl;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddprojectService;
import com.weblabs.utility.DBUtil;

public class AddProjectServiceImp implements AddprojectService{

	@Override
	public String addProject(String projectname, String client, String startdate, String enddate, String rate,
			String hourly, String priority, String projectleader, String addteam, String description,
			String uploadfile) {
		
		      String status = "Project Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO createproject (projectname,client,startdate,enddate,rate,hourly,priority,projectleader,addteam,description,uploadfile) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, projectname);
            ps.setString(2, client);
            ps.setString(3, startdate);
            ps.setString(4, enddate);
            ps.setString(5, rate);
            ps.setString(6, hourly);
            ps.setString(7, priority);
            ps.setString(8, projectleader);
            ps.setString(9, addteam);
            ps.setString(10, description);
            ps.setString(11, uploadfile);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Project Added Successfully!";
            }
        } catch (SQLException e) {
            status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return status;
	}

}
