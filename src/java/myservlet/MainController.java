/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.ir.BreakNode;

/**
 *
 * @author LENOVO
 */
public class MainController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String a = request.getParameter("action");
            String url = "login.jsp";
            switch (a) {
                case "Login":
                    url = "loginServlet";
                    break;
                case "Sign Up":
                    url = "registratePage.jsp";
                    break;
                case "Create Account":
                    url = "RegistrateServlet";
                    break;
                case "showPlant":
                    url = "showPlants.jsp";
                    break;
                case "Search Plant":
                    url = "SearchServlet";
                    break;
                case "Add":
                    url = "AddServlet";
                    break;
                case "View":
                    url = "viewcart.jsp";
                    break;
                case "UpdateCart":
                    url = "UpdateCartServlet";
                    break;
                case "DeleteCart":
                    url = "DeleteCartServlet";
                    break;
                case "Buy":
                    url = "BuyPlantsServlet";
                    break;
                case "Add more book":
                    url = "showPlants.jsp";
                    break;
                case "Search Account":
                    url = "SearchAccountServlet";
                    break;
                case "logout":
                    url = "LogoutServlet";
                    break;
                case "Ban":
                    url = "DeleteAccountServlet";
                    break;
                case "Unban":
                    url = "UpdateAccountServlet";
                    break;
                case "userHome":
                    url = "header_loginedUser.jsp";
                    break;
                case "userSearchPlant":
                    url = "showPlants.jsp";
                    break;
                case "userViewOrder":
                    url = "viewOrder.jsp";
                    break;
                case "adminHome":
                    url = "header_loginedAdmin.jsp";
                    break;
                case "adminManageAccount":
                    url = "searchAccount.jsp";
                    break;
                case "Cancel":
                    url = "OrderProcessingServlet";
                    break;
                case "OrderAgain":
                    url = "OrderProcessingServlet";
                    break;
                case "changeProfile":
                    url = "changeProfileCustomer.jsp";
                    break;
                case "Changed Profile":
                    url = "ChangeProfileServlet";
                    break;
                case "adminManageOrder":
                    url = "viewOrderadmin.jsp";
                    break;
                case "adminManagePlant":
                    url = "manageplant.jsp";
                    break;
                case "Plant Updated":
                    url = "UpdatePlantServlet";
                    break;
                case "Edit":
                    url = "EditPlantServlet";
                    break;
                case "Create Plant":
                    url = "CreatePlant.jsp";
                    break;
                case "Plant Created":
                    url = "CreatePlantServlet";
                    break;
                case "adminManageCategories":
                    url = "manageCategories.jsp";
                    break;
                case "Create Categories":
                    url = "createCategories.jsp";
                    break;
                case "Create New Categories":
                    url = "CreateCategoriesServlet";
                    break;
                case "Categories Updated":
                    url = "CategoriesUpdateServlet";
                    break;
                case "UpdatingCate":
                    url = "UpdateCategoriesServlet";
                    break;

            }
            request.getRequestDispatcher(url).forward(request, response);
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
