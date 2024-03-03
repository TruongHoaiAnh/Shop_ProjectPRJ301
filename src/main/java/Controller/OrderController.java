/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.OrderDAO;
import DAOs.SalesDAO;
import Models.Cart;
import Models.Account;
import Models.ChartDay;
import Models.ChartMonth;
import Models.ChartYear;
import Models.Item;
import Models.Order;
import Models.Sales;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.converter.LocalDateTimeStringConverter;

/**
 *
 * @author MY LAPTOP
 */
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        OrderDAO ordDAO = new OrderDAO();
        if (path.endsWith("/order/checkout")) {
            Account role = (Account) request.getSession().getAttribute("role");
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (role != null) {
                if (cart != null) {
                    ordDAO.addOrder(role, cart);
                    request.getSession().removeAttribute("cart");
                    request.getSession().setAttribute("size", 0);
                    response.sendRedirect("/product/home");
                } else {
                    response.sendRedirect("/product/home");
                }
            } else {
                response.sendRedirect("/customer/login");
            }

        } else if (path.endsWith("/order/list")) {
            Account role = (Account) request.getSession().getAttribute("role");
            if (role != null) {
                List<Order> listOrd = ordDAO.getOrderByCustomer(role);
                request.getSession().setAttribute("listOrd", listOrd);
                request.getRequestDispatcher("/order.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }

        } else if (path.startsWith("/order/detail/")) {
            try {
                String[] data = path.split("/");
                int orderID = Integer.parseInt(data[data.length - 1]);
                List<Item> listDetail = ordDAO.getOrderDetail(orderID);
                request.getSession().setAttribute("orderID", orderID);
                request.getSession().setAttribute("listDetail", listDetail);
                request.getRequestDispatcher("/orderDetail.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (path.endsWith("/order/allList")) {
            List<Order> listAll = ordDAO.getAllOrder();
            request.getSession().setAttribute("listOrd", listAll);
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } else if (path.endsWith("/order/sales")) {
            SalesDAO sDAO;
            try {
                sDAO = new SalesDAO();
                LocalDate curDate = java.time.LocalDate.now();
                List<Sales> listSales = sDAO.getAllSales(curDate.toString(), curDate.toString());
                request.getSession().setAttribute("fromDate", curDate.toString());
                request.getSession().setAttribute("toDate", curDate.toString());
                request.getSession().setAttribute("listSales", listSales);
                request.getRequestDispatcher("/sales.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (path.endsWith("/order/sales/chart")) {
            SalesDAO sDAO;
            try {
                sDAO = new SalesDAO();
                LocalDate curDate = LocalDate.now();
                String year = String.valueOf(curDate.getYear());
                String month = String.valueOf(curDate.getMonthValue());
                List<ChartDay> clist = sDAO.getChartDay(year, month);
                request.getSession().setAttribute("year", year);
                request.getSession().setAttribute("month", month);
                request.getSession().setAttribute("option", "1");
                request.getSession().setAttribute("listChartDay", clist);
                request.getRequestDispatcher("/chart.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (path.endsWith("/order/sales/pieChart")) {
            SalesDAO sDAO;
            try {
                sDAO = new SalesDAO();
                LocalDate curDate = LocalDate.now();
                String year = String.valueOf(curDate.getYear());
                String month = String.valueOf(curDate.getMonthValue());
                List<ChartDay> cPList = sDAO.getPieChartDay(curDate.toString());
                request.getSession().setAttribute("nowDay", curDate.toString());
                request.getSession().setAttribute("pyear", year);
                request.getSession().setAttribute("pmonth", month);
                request.getSession().setAttribute("poption", "1");
                request.getSession().setAttribute("pListChartDay", cPList);
                request.getRequestDispatcher("/pieChart.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
        if (request.getParameter("btnDate") != null) {
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            SalesDAO sDAO;
            try {
                sDAO = new SalesDAO();
                LocalDate curDate = java.time.LocalDate.now();
                List<Sales> listSales = sDAO.getAllSales(fromDate, toDate);
                request.getSession().setAttribute("fromDate", fromDate);
                request.getSession().setAttribute("toDate", toDate);
                request.getSession().setAttribute("listSales", listSales);
                request.getRequestDispatcher("/sales.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("btnChart") != null) {
            String option = request.getParameter("chartType");
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            SalesDAO sDAO;
            try {
                sDAO = new SalesDAO();
                LocalDate curDate = java.time.LocalDate.now();
                List<ChartDay> clist = sDAO.getChartDay(year, month);
                List<ChartMonth> mlist = sDAO.getChartMonth(year);
                List<ChartYear> ylist = sDAO.getChartYear();
                request.getSession().setAttribute("year", year);
                request.getSession().setAttribute("month", month);
                request.getSession().setAttribute("option", option);
                request.getSession().setAttribute("listChartDay", clist);
                request.getSession().setAttribute("listChartMonth", mlist);
                request.getSession().setAttribute("listChartYear", ylist);
                request.getRequestDispatcher("/chart.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("btnPieChart") != null) {
            String option = request.getParameter("chartType");
            String day = request.getParameter("day");
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            SalesDAO sDAO;
            try {
                sDAO = new SalesDAO();
                List<ChartDay> cPList = sDAO.getPieChartDay(day);
                List<ChartMonth> mPList = sDAO.getPieChartMonth(year, month);
                List<ChartYear> yPList = sDAO.getPieChartYear();
                request.getSession().setAttribute("nowDay", day);
                request.getSession().setAttribute("pyear", year);
                request.getSession().setAttribute("pmonth", month);
                request.getSession().setAttribute("poption", option);
                request.getSession().setAttribute("pListChartDay", cPList);
                request.getSession().setAttribute("pListChartMonth", mPList);
                request.getSession().setAttribute("pListChartYear", yPList);
                request.getRequestDispatcher("/pieChart.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
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

    public static String convertDateFormat(String inputDate) {
        try {
            // Define the input date format (mm/dd/yyyy)
            SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");

            // Define the desired output date format (yyyy-MM-dd)
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

            // Parse the input date
            Date date = (Date) inputFormat.parse(inputDate);

            // Format the date in the desired output format
            return outputFormat.format(date);
        } catch (ParseException e) {
            // Handle parsing errors if necessary
            e.printStackTrace();
            return null; // Return null or an error message as needed
        }
    }

}
