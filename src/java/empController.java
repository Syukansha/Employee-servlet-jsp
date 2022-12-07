/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import person.bean.Staff;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author KANSHA
 */
public class empController extends HttpServlet {
    private PreparedStatement sql,sql2,sql3;
    ResultSet pt =null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void init ()throws ServletException{
        initializeJdbc();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String salary = request.getParameter("salary");
        int sal = Integer.parseInt(salary);
        double sal2 = Double.parseDouble(salary);
        String design = request.getParameter("designation");
        
        
        try{
            
            if(request.getParameter("id")!=null){
                int id = Integer.parseInt(request.getParameter("id"));
                updateStaff(name,sal,design,id);
                RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                rd.forward(request, response);
                return;               
            }else{
                if(name==null){
                     
                     RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                     rd.forward(request, response);
                     return;
                }
                Staff st = new Staff();
                 st.setName(name);
                 st.setDesignation(design);
                 st.setSalary(sal2);
                
                 String checkStaff = st.getDesignation();
                 
                storeStaff(name,sal,design);
                RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                rd.forward(request, response);
                return;
                              
            }     
        }
        catch(Exception ex){
            out.println("Error"+ex.getMessage());
             
        }
        finally{
            out.close();
        }    
    }  
    private void initializeJdbc(){
        try{
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/emp;create=true;user=app;password=app";
            
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(connectionString);
            
            sql = conn.prepareStatement("insert into staff(NAME,SALARY,DESIGNATION) values (?,?,?)");
            sql2 = conn.prepareStatement("Update staff set NAME=?,SALARY=?,DESIGNATION=? WHERE ID=?");
           
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    private void storeStaff(String name, int salary, String design) throws SQLException{
        
        sql.setString(1, name);
        sql.setInt(2, salary);
        sql.setString(3, design);
        sql.executeUpdate();
    
    }
    
    private void updateStaff(String name, int salary, String design, int id)throws SQLException{
        sql2.setString(1, name);
        sql2.setInt(2,salary);
        sql2.setString(3, design);
        sql2.setInt(4, id);
        sql2.executeUpdate();
    }    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
