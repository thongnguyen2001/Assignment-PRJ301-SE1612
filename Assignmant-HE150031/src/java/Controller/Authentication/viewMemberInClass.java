/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Authentication;

import DAL.AccountDB;
import DAL.ScheduleDB;
import Model.Account;
import Model.Schedule;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class viewMemberInClass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDB db = new AccountDB();
        Account account = db.getAccount("thongnkhe150031@fpt.edu.vn", "123456");
        if(account == null){
            response.getWriter().print("null");
        }else{
            response.getWriter().print(account.getEmail());
        }
        Account account1 = (Account) request.getSession().getAttribute("account");
        response.getWriter().print(account1.getEmail());
//        ClassDB classDB = new ClassDB();
//        response.getWriter().print(classDB.getClss().size());
//        ClassDB db = new ClassDB();
//        ArrayList<Account> userInClass = db.getUserInClass(1);
//        response.getWriter().print(userInClass.size());      
//
//        ScheduleDB schDB = new ScheduleDB();  
//        ArrayList<Schedule> sche = schDB.getScheduleByTeacher(10);
//        response.getWriter().print(sche.get(0).getClss().getClassName());
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
