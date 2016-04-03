/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int676.im.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sit.int676.im.model.ConnectionBuilder;

/**
 *
 * @author Neng
 */
public class IncidentsListingReport extends IncidentsReport {
    private static final String SQL_LISTING = "select xia.ticket_num, xia.title, xia.request_date,\n" +
"        xp.project_name, xic.DESCRIPTION category_name, xis.severity_name, xip.priority_name, ist.status_name,\n" +
"        nvl(div.DIVISION_NAME, 'No Assign to Division') div_owner, nvl(emp.EMPLOYEE_NAME, 'No Assign to Owner') owner_name\n" +
"      from xxim_incidents_all xia, xxim_projects xp, xxim_incident_category xic, xxim_incident_severity xis,\n" +
"          xxim_incident_priority xip, xxim_incident_status ist, xxim_division_all div, xxim_employees_all emp\n" +
"      where xia.project_id = xp.project_id\n" +
"      and xia.INCIDENT_CATEGORY_ID = xic.INCIDENT_CATEGORY_ID\n" +
"      and xia.PRIORITY_ID = xip.PRIORITY_ID\n" +
"      and xia.SEVERITY_ID = xis.SEVERITY_ID\n" +
"      and xia.STATUS_ID = ist.STATUS_ID\n" +
"      and xia.OWNER_ID = div.DIVISION_ID(+)\n" +
"      and xia.RESPOND_BY = emp.EMPLOYEE_ID(+)\n" +
"      order by xia.TICKET_ID";
    
    public IncidentsListingReport(ResultSet rs) throws SQLException {
        this.ticket_num = rs.getString("ticket_num");
        this.title = rs.getString("title");
        this.request_date = rs.getString("request_date");
        this.project_name = rs.getString("project_name");
        this.category_name = rs.getString("category_name");
        this.severity_name = rs.getString("severity_name");
        this.priority_name = rs.getString("priority_name");
        this.status_name = rs.getString("status_name");
        this.div_owner = rs.getString("div_owner");
        this.owner_name = rs.getString("owner_name");

    }
    
    public static List<IncidentsListingReport> GenReport() {
        List<IncidentsListingReport> rep = null;
        Connection con = ConnectionBuilder.getConnection();

        try {
            PreparedStatement stm = con.prepareStatement(SQL_LISTING);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (rep == null) {
                    rep = new ArrayList<>();
                }
                rep.add(new IncidentsListingReport(rs));
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rep;

    }
    
}
