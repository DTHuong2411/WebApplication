/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.DormDAO;
import entity.RoomRegistration;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

/**
 *
 * @author LENOVO
 */
public class AddElectricWaterServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddElectricWaterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddElectricWaterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        DormDAO dao = new DormDAO();
        String studentID = request.getParameter("studentID");
        int oldElectricityIndex = Integer.parseInt(request.getParameter("oldElectricityIndex"));
        int newElectricityIndex = Integer.parseInt(request.getParameter("newElectricityIndex"));
        int oldWaterIndex = Integer.parseInt(request.getParameter("oldWaterIndex"));
        int newWaterIndex = Integer.parseInt(request.getParameter("newWaterIndex"));
        LocalDateTime dateIn4Months = LocalDateTime.now().plusMonths(4);
        int month = dateIn4Months.getMonth().getValue();
        String semester = "";
        if (month >= 1 && month <= 4) {
            semester = semester.concat("SP");
        } else if (month >= 5 && month <= 8) {
            semester = semester.concat("SU");
        } else if (month >= 9 && month <= 12) {
            semester = semester.concat("FA");
        }

        String year = Integer.toString(dateIn4Months.getYear());
        year = year.substring(year.length() - 2);
        semester = semester.concat(year);

        RoomRegistration roomRegistration = dao.getRegisterRoomByIdAndSemester(studentID, semester);
        if (roomRegistration == null) {
            request.setAttribute("err", "Sinh viên này chưa đăng ký phòng kỳ hiện tại");
            request.getRequestDispatcher("addElectricAndWater.jsp").forward(request, response);
        } else {
            dao.addElectricWater(roomRegistration.getRegisterID(), semester, oldElectricityIndex, newElectricityIndex, oldWaterIndex, newWaterIndex);
            response.sendRedirect("ManageElectricAndWaterServlet");
        }

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