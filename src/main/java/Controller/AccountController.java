/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.AccountDAO;
import DAOs.DishDAO;
import Models.Account;
import Models.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MY LAPTOP
 */
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
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
        try {
            DishDAO dDAO = new DishDAO();
            List<Dish> list = dDAO.getAllProduct();
            AccountDAO cusDAO = new AccountDAO();
            String path = request.getRequestURI(); //lay duong dan
            if (path.endsWith("/customer/login")) { //neu la dang nhap chuyen sang trang index.jsp
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else if (path.endsWith("/customer/logout")) { //neu la dang xuat thi xoa thuoc tinh session role, cookie va tro ve trang dang nhap
                Cookie[] cookies = request.getCookies();
                for (Cookie cooky : cookies) {
                    if (cooky.getName().equals("customer")) {
                        cooky.setMaxAge(0);
                        cooky.setPath("/");
                        response.addCookie(cooky);
                        break;
                    }
                }
                request.getSession().removeAttribute("role"); //xoa session
                request.getSession().invalidate();

                response.sendRedirect("/customer/login");
            } else if (path.endsWith("/customer/update")) { //neu cap nhat profile thi chuyen sang trang updateAccount.jsp
                Account role = (Account) request.getSession().getAttribute("role");
                request.getSession().setAttribute("roleToUpdate", role);
                request.getRequestDispatcher("/updateAccount.jsp").forward(request, response);
            } else if (path.endsWith("/customer/delete")) { //neu xoa thi lay thong tin tu role, xoa thanh cong chuyen sang trang dang nhap, that bai chuyen ve trang danh sach san pham
                try {
                    HttpSession session = request.getSession();
                    Account cus = (Account) session.getAttribute("role"); //lay thong tin cus dua tren session
                    cusDAO = new AccountDAO();
                    int kq = cusDAO.deleteCus(0, cus.getId());
                    if (kq != 0) {
                        request.getSession().removeAttribute("role"); //xoa session
                        request.getSession().invalidate();

                        Cookie[] cookies = request.getCookies();
                        for (Cookie cooky : cookies) {
                            if (cooky.getName().equals("customer")) {
                                cooky.setMaxAge(0);
                                cooky.setPath("/");
                                response.addCookie(cooky);
                                break;
                            }
                        }
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (path.startsWith("/customer/delete")) {
                String[] data = path.split("/");
                int id = Integer.parseInt(data[data.length - 1]);
                cusDAO = new AccountDAO();
                int kq = cusDAO.deleteCus(0, id);
                Account role = (Account) request.getSession().getAttribute("role");
                if (kq != 0 && id == role.getId()) {
                    request.getSession().removeAttribute("role"); //xoa session
                    request.getSession().invalidate();

                    Cookie[] cookies = request.getCookies();
                    for (Cookie cooky : cookies) {
                        if (cooky.getName().equals("customer")) {
                            cooky.setMaxAge(0);
                            cooky.setPath("/");
                            response.addCookie(cooky);
                            break;
                        }
                    }
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/listAccountUpdate.jsp").forward(request, response);
                }
            } else if (path.endsWith("/customer/list")) {
                request.getSession().setAttribute("listP", list);
                request.getRequestDispatcher("/list.jsp").forward(request, response);
            } else if (path.endsWith("/customer/updateAccount")) {
                try {
                    cusDAO = new AccountDAO();
                    List<Account> listCus = cusDAO.getAllCustomer();
                    request.getSession().setAttribute("listCus", listCus);
                    request.getRequestDispatcher("/listAccountUpdate.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (path.startsWith("/customer/update")) {
                try {
                    String[] data = path.split("/");
                    String username = data[data.length - 1];
                    Account cus = cusDAO.getCus(username);
                    request.getSession().setAttribute("roleToUpdate", cus);
                    request.getRequestDispatcher("/updateAccount.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (path.startsWith("/customer/admin")) {
                String[] data = path.split("/");
                String username = data[data.length - 1];
                int kq = cusDAO.updateAdmin(username);

                cusDAO = new AccountDAO();
                List<Account> listCus = cusDAO.getAllCustomer();
                request.getSession().setAttribute("listCus", listCus);
                request.getRequestDispatcher("/listAccountUpdate.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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
        String login = request.getParameter("btnLogin"); //khi nguoi dung nhan nut dang nhap
        String signup = request.getParameter("btnSignup"); //khi nguoi dung nhan nut dang ki
        String update = request.getParameter("btnUpdate"); //khi nguoi dung nhan nut cap nhat

        if (login != null && login.equals("Log In")) { //khi nguoi dung nhan nut
            try {
                String username = request.getParameter("username"); //lay usernam nguoi dung nhap
                String password = request.getParameter("password"); //lay password nguoi dung nhap
                AccountDAO cusDAO = new AccountDAO(); //khoi tao Customer DAO
                DishDAO dishdao = new DishDAO();
                Account cus = cusDAO.login(username, password); //kiem tra co tai khoan nay chua, co thi tra ve 1 doi tuong customer
                if (cus != null && cus.getStatus() == 1) { //khi co tai khoan
                    Cookie cUser = new Cookie("customer", cus.getUserName()); //dat cookie customer voi gia tri username - tương tự username
                    request.getSession().setAttribute("role", cus); //đưa cus lên session
//                    if (cus.isAdmin()) { //neu la admin thi doi ten thanh admin
//                        cUser = new Cookie("admin", cus.getUserName());                       
//                    }
                    String remember = request.getParameter("remember"); //kiem tra nguoi dung co an nut remember me khong
                    if (remember != null && remember.equals("me")) { //neu nguoi dung an
                        cUser.setMaxAge(60 * 60 * 24); //dat tuoi tho cookie la 1 ngay

                    } else {
                        cUser.setMaxAge(0); //xoa cookie khi nguoi dung khong an remember
                    }
                    cUser.setPath("/");  //gửi cookie đến tất cả các đường dẫn trên máy chủ.
                    response.addCookie(cUser);//them cookie
                    List<Dish> listCake = dishdao.listCake();
                    request.getSession().setAttribute("listCake", listCake); //mục đích lấy danh sách bánh
                    response.sendRedirect("/product/home"); //tro ve trang show san pham
                } else {
                    request.getSession().invalidate();//mục đích để hủy session ở signup
                    request.getSession().setAttribute("loginErr", "Username or Password is wrong!");
                    response.sendRedirect("/customer/login"); //tro ve trang dang nhap
                }

            } catch (SQLException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        if (signup != null && signup.equals("Register Now")) {
            try {
                request.getSession().invalidate();//xóa session hiện hành mục đích để hủy các lỗi đã bị 

                String fullname = request.getParameter("fullname");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String repeat_pwd = request.getParameter("confirm-password");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
//                Boolean isAdmin = Boolean.parseBoolean(request.getParameter("role"));
                AccountDAO cusDAO = new AccountDAO();
                Boolean err = false;
                if (cusDAO.checkUserNameExist(username)) { //kiem tra username dang ki chua
                    request.getSession().setAttribute("usernameErr", "this username have been registed");
                    err = true;
                }
                if (cusDAO.checkPassExist(cusDAO.getMd5(password))) {
                    request.getSession().setAttribute("passErrExit", "this password have been registed");
                    err = true;
                }
                if (!password.equals(repeat_pwd)) {
                    request.getSession().setAttribute("passErrRepeat", "password does not match");
                    err = true;
                }
                if (cusDAO.checkPhoneExist(phone)) { //kiem tra so dien thoai dang ki chua
                    request.getSession().setAttribute("phoneErr", "this phone number have been registed");
                    err = true;
                }
                if (cusDAO.checkEmailExist(email)) { //kiem tra email dang ki chua
                    request.getSession().setAttribute("emailErr", "this email have been registed");
                    err = true;
                }
                if (err) { //neu có loi nào thi bat dang ki lai kèm thông báo lõi
                    request.getSession().setAttribute("signupErr", "Signup Fail!");
                    response.sendRedirect("/customer/login");
                } else {
                    Account newCus = cusDAO.addCus(fullname, username, password, phone, email, gender, address, false, 1);
                    if (newCus == null) { //nêu thêm mói thát bai thi dang kí la
                        request.getSession().invalidate(); // xóa toàn bộ session hiện hành
                        request.getSession().setAttribute("signupErr", "Signup Fail!");
                        response.sendRedirect("/customer/login");
                    } else { //dang kí thành công thì chuyen sang trang dang nhâp
                        request.getSession().invalidate(); // xóa toàn bộ session hiện hành
                        request.getSession().setAttribute("signupSuccess", "Signup Successfully!");
                        response.sendRedirect("/customer/login");
                    }
                }

            } catch (SQLException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        if (update != null && update.equals("Update")) {
            try {
                String fullname = request.getParameter("fullname");
                String username = request.getParameter("username");
                String new_password = request.getParameter("new_password");
                String confirm_pass = request.getParameter("comfirm_password");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                Boolean isAdmin = Boolean.parseBoolean(request.getParameter("role"));
                AccountDAO cusDAO = new AccountDAO();
                HttpSession session = request.getSession();
                Account cus = (Account) session.getAttribute("roleToUpdate"); //lay thong tin cus dua tren session
                Boolean err = false;

                if (!cus.getUserName().equals(username)) {// neu thay doi username thi kiem tra co trung voi username khac khong
                    if (cusDAO.checkUserNameExist(username)) {
                        request.setAttribute("usernameErr", "This username have been registed");//bao trung
                        err = true;
                    }
                }
                if (!cus.getPhone().equals(phone)) {// neu thay doi phone thi kiem tra co trung voi phone khac khong
                    if (cusDAO.checkPhoneExist(phone)) {
                        request.setAttribute("phoneErr", "This phone number have been registed");//bao trung
                        err = true;
                    }
                }

                if (!cus.getEmail().equals(email)) {// neu thay doi email thi kiem tra co trung voi email khac khong
                    if (cusDAO.checkEmailExist(email)) {
                        request.setAttribute("emailErr", "This email have been registed");//bao trung
                        err = true;
                    }
                }
                if (!cus.getPassword().equals(new_password)) {// neu thay doi password thi kiem tra co trung voi password khac khong
                    if (cusDAO.checkPassExist(new_password)) {
                        request.setAttribute("passErrExit", "This password have been registed");//bao trung
                        err = true;
                    }
                    if (!new_password.equals(confirm_pass)) {
                        request.setAttribute("passErrRepeat", "password does not match");
                        err = true;
                    }
                }
                if (err) {
//                    response.sendRedirect("/updateAccount.jsp");
                    request.getRequestDispatcher("/updateAccount.jsp").forward(request, response);
                } else {
                    String oldPassFromKey = request.getParameter("oldPassword"); //lay password cu tu nguoi dung nhap de update
                    String oldPassInDB = cus.getPassword(); //pass cu khi nguoi dung dang ki
                    if (getMd5(oldPassFromKey).equals(oldPassInDB)) { //khi nhap pass cu dung moi update
                        Account newCus = null;
                        if (new_password.equals("")) {
                            newCus = cusDAO.updateCus(cus.getId(), fullname, username, oldPassFromKey, phone, email, gender, address, isAdmin, 1);
                        } else {
                            newCus = cusDAO.updateCus(cus.getId(), fullname, username, new_password, phone, email, gender, address, isAdmin, 1);
                        }

                        if (newCus == null) {
                            response.sendRedirect("/customer/update");//bat update lai neu qua trinh update loi
                        } else {
                            Account role = (Account) request.getSession().getAttribute("role");
                            if (role.getUserName().equals(cus.getUserName())) {// neu update in4 cua nguoi dang cap nhat thi set lai thong tin hien thi
                                request.getSession().setAttribute("role", newCus); //tao lai session moi
                            }
                            response.sendRedirect("/product/list"); //tro ve trang dang nhap
                        }
                    } else {
                        request.setAttribute("passwordErr", "This old password is not correct");
                        request.getRequestDispatcher("/updateAccount.jsp").forward(request, response);//update lai khi nhap mat khau cu sai
                    }
                }

            } catch (SQLException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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

    public String getMd5(String input) { //dung de ma hoa theo md5
        try {
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
