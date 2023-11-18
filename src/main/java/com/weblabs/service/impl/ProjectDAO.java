package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.CreateProject;
import com.weblabs.utility.DBUtil;

public class ProjectDAO {

    public static int totalCount() {
        int count = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT COUNT(*) AS count FROM createproject";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (ps != null) ps.close();
                if (rs != null) rs.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return count;
    }

    public static List<CreateProject> getAllProjects() {
        List<CreateProject> allProjects = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT project_id, projectname, Clientid, startdate, enddate, rate, hourly, priority, projectleader, addteam, description, uploadfile FROM createproject";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                CreateProject project = new CreateProject();
                project.setProject_id(resultSet.getString("project_id"));
                project.setProjectname(resultSet.getString("projectname"));
                project.setClientid(resultSet.getString("Clientid"));
                project.setStartdate(resultSet.getString("startdate"));
                project.setEnddate(resultSet.getString("enddate"));
                project.setProjectname(resultSet.getString("projectname"));
                project.setRate(resultSet.getString("rate"));
                project.setHourly(resultSet.getString("hourly"));
                project.setPriority(resultSet.getString("priority"));
                project.setProjectleader(resultSet.getString("projectleader"));
                project.setAddteam(resultSet.getString("addteam"));
                project.setDescription(resultSet.getString("description"));
                project.setUploadfile(resultSet.getString("uploadfile"));
                
                
                // Set other fields using appropriate setters

                allProjects.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return allProjects;
    }
}
