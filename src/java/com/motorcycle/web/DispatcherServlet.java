package com.motorcycle.web;

import com.motorcycle.model.Brand;
import com.motorcycle.model.Product;
import com.motorcycle.model.User;
import com.motorcycle.service.AdminService;
import com.motorcycle.service.AuthService;
import com.motorcycle.service.CartService;
import com.motorcycle.service.CatalogService;
import com.motorcycle.service.OrderService;
import com.motorcycle.service.PaymentService;
import com.motorcycle.util.RequestUtil;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Optional;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DispatcherServlet extends HttpServlet {
    private final AuthService authService = new AuthService();
    private final CatalogService catalogService = new CatalogService();
    private final CartService cartService = new CartService();
    private final OrderService orderService = new OrderService();
    private final AdminService adminService = new AdminService();
    private final PaymentService paymentService = new PaymentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        route(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        route(request, response);
    }

    private void route(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if (request.getPathInfo() != null) {
            path = (path == null ? "" : path) + request.getPathInfo();
        }
        if (path == null || path.isEmpty()) {
            path = "/";
        }
        if (path == null) {
            path = "/";
        }

        try {
            if ("/login".equals(path)) {
                login(request, response);
            } else if ("/logout".equals(path)) {
                logout(request, response);
            } else if ("/register".equals(path)) {
                register(request, response);
            } else if ("/forgot-password".equals(path)) {
                forgotPassword(request, response);
            } else if ("/reset-password".equals(path)) {
                resetPassword(request, response);
            } else if ("/google-login".equals(path)) {
                googleLogin(request, response);
            } else if ("/products".equals(path)) {
                products(request, response);
            } else if ("/product-detail".equals(path)) {
                productDetail(request, response);
            } else if ("/cart".equals(path)) {
                cart(request, response);
            } else if ("/checkout".equals(path)) {
                checkout(request, response);
            } else if (path.startsWith("/profile")) {
                profile(request, response, path);
            } else if (path.startsWith("/admin/manage-product")) {
                manageProduct(request, response);
            } else if (path.startsWith("/admin/manage-brand")) {
                manageBrand(request, response);
            } else if (path.startsWith("/admin/manage-order")) {
                manageOrder(request, response);
            } else if (path.startsWith("/admin/manage-user")) {
                manageUser(request, response);
            } else if (path.startsWith("/payment")) {
                payment(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (IllegalArgumentException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            forward(request, response, "/error-500.jsp");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request)) {
            forward(request, response, "/login.jsp");
            return;
        }
        Optional<User> user = authService.login(RequestUtil.param(request, "txtEmail"), RequestUtil.param(request, "txtPassword"));
        if (!user.isPresent()) {
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng.");
            forward(request, response, "/login.jsp");
            return;
        }
        request.getSession().setAttribute("currentUser", user.get());
        response.sendRedirect(request.getContextPath() + (user.get().isAdmin() ? "/admin/dashboard.jsp" : "/index.jsp"));
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request)) {
            forward(request, response, "/register.jsp");
            return;
        }
        User user = authService.register(
                RequestUtil.param(request, "txtFirstName"),
                RequestUtil.param(request, "txtLastName"),
                RequestUtil.param(request, "txtEmail"),
                RequestUtil.param(request, "txtPhone"),
                RequestUtil.param(request, "txtPassword"));
        request.getSession().setAttribute("currentUser", user);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private void forgotPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request)) {
            forward(request, response, "/forgot-password.jsp");
            return;
        }
        String token = authService.createResetToken(RequestUtil.param(request, "txtEmail"));
        response.sendRedirect(request.getContextPath() + "/reset-password.jsp?token=" + URLEncoder.encode(token, "UTF-8"));
    }

    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request)) {
            forward(request, response, "/reset-password.jsp");
            return;
        }
        boolean ok = authService.resetPassword(RequestUtil.param(request, "token"), RequestUtil.param(request, "txtPassword"));
        response.sendRedirect(request.getContextPath() + (ok ? "/login.jsp" : "/forgot-password.jsp"));
    }

    private void googleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().setAttribute("oauthMessage", "Google OAuth2 sandbox placeholder. Configure client id/secret to enable real callback.");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    private void products(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", catalogService.search(
                RequestUtil.param(request, "searchQuery"),
                RequestUtil.param(request, "brand"),
                RequestUtil.param(request, "category"),
                RequestUtil.param(request, "priceFilter")));
        request.setAttribute("brands", catalogService.findBrands());
        request.setAttribute("categories", catalogService.findCategories());
        forward(request, response, "/products.jsp");
    }

    private void productDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = RequestUtil.intParam(request, "id", 1);
        request.setAttribute("product", catalogService.findProduct(id).orElse(null));
        forward(request, response, "/product-detail.jsp");
    }

    private void cart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if (!isGet(request)) {
            String action = RequestUtil.param(request, "action");
            if ("clear".equals(action)) {
                cartService.clear(session);
            } else {
                cartService.addItem(session,
                        RequestUtil.intParam(request, "productId", 1),
                        RequestUtil.param(request, "selectedColor"),
                        RequestUtil.intParam(request, "quantity", 1));
            }
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
            return;
        }
        request.setAttribute("cartItems", cartService.getCart(session));
        request.setAttribute("cartSubtotal", cartService.subtotal(session));
        forward(request, response, "/cart.jsp");
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request)) {
            forward(request, response, "/checkout.jsp");
            return;
        }
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user == null) {
            user = authService.register(
                    RequestUtil.param(request, "txtFullName"),
                    "",
                    RequestUtil.param(request, "txtEmail"),
                    RequestUtil.param(request, "txtPhone"),
                    "123456");
            request.getSession().setAttribute("currentUser", user);
        }
        orderService.createOrder(user,
                cartService.getCart(request.getSession()),
                RequestUtil.param(request, "txtShowroom"),
                RequestUtil.param(request, "txtAppointmentDate"),
                RequestUtil.param(request, "txtAppointmentTime"),
                RequestUtil.param(request, "txtPaymentMethod"));
        cartService.clear(request.getSession());
        response.sendRedirect(request.getContextPath() + "/order-history.jsp");
    }

    private void profile(HttpServletRequest request, HttpServletResponse response, String path) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("currentUser");
        if ("/profile/update".equals(path)) {
            authService.updateProfile(user,
                    RequestUtil.param(request, "txtFirstName"),
                    RequestUtil.param(request, "txtLastName"),
                    RequestUtil.param(request, "txtPhone"),
                    RequestUtil.param(request, "txtAddress"));
        } else if ("/profile/change-password".equals(path)) {
            boolean ok = authService.changePassword(user, RequestUtil.param(request, "txtOldPassword"), RequestUtil.param(request, "txtNewPassword"));
            request.getSession().setAttribute("profileMessage", ok ? "Đã đổi mật khẩu." : "Mật khẩu hiện tại không đúng.");
        }
        response.sendRedirect(request.getContextPath() + "/profile.jsp");
    }

    private void manageProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request) && "delete".equals(RequestUtil.param(request, "action"))) {
            int id = RequestUtil.intParam(request, "id", 0);
            if (id > 0) {
                catalogService.deleteProduct(id);
            } else {
                String name = RequestUtil.param(request, "name");
                catalogService.search(name, "", "", "").stream()
                        .filter(p -> p.getName().equalsIgnoreCase(name))
                        .findFirst()
                        .ifPresent(p -> catalogService.deleteProduct(p.getId()));
            }
            response.sendRedirect(request.getContextPath() + "/admin/manage-product.jsp");
            return;
        }
        if (!isGet(request)) {
            Product product = new Product();
            product.setId(RequestUtil.intParam(request, "txtProductId", 0));
            product.setName(RequestUtil.param(request, "txtProductName"));
            product.setSku(RequestUtil.param(request, "txtSku"));
            product.setBrand(catalogService.findBrand(RequestUtil.intParam(request, "txtBrandId", 1)).orElse(null));
            product.setCategory(catalogService.findCategory(RequestUtil.intParam(request, "txtCategoryId", 1)).orElse(null));
            product.setPrice(new BigDecimal(RequestUtil.param(request, "txtPrice")));
            product.setStock(RequestUtil.intParam(request, "txtStock", 0));
            product.setDisplacement(RequestUtil.param(request, "txtDisplacement"));
            product.setHorsepower(RequestUtil.param(request, "txtHorsepower"));
            product.setWeight(RequestUtil.param(request, "txtWeight"));
            catalogService.saveProduct(product);
        }
        response.sendRedirect(request.getContextPath() + "/admin/manage-product.jsp");
    }

    private void manageBrand(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isGet(request)) {
            Brand brand = new Brand();
            brand.setId(RequestUtil.intParam(request, "txtBrandId", 0));
            brand.setName(RequestUtil.param(request, "txtBrandName"));
            brand.setOrigin(RequestUtil.param(request, "txtBrandOrigin"));
            catalogService.saveBrand(brand);
        } else if ("delete".equals(RequestUtil.param(request, "action"))) {
            catalogService.deleteBrand(RequestUtil.intParam(request, "id", 0));
        }
        response.sendRedirect(request.getContextPath() + "/admin/manage-brand.jsp");
    }

    private void manageOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isGet(request)) {
            orderService.updateStatus(RequestUtil.intParam(request, "orderId", 0), RequestUtil.param(request, "txtOrderStatus"));
        }
        response.sendRedirect(request.getContextPath() + "/admin/manage-order.jsp");
    }

    private void manageUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isGet(request)) {
            adminService.updateRole(RequestUtil.intParam(request, "accountId", 0), RequestUtil.param(request, "txtRole"));
        }
        response.sendRedirect(request.getContextPath() + "/admin/manage-user.jsp");
    }

    private void payment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int orderId = RequestUtil.intParam(request, "orderId", 0);
        if (request.getServletPath().contains("callback")) {
            paymentService.recordCallback(orderId, "VNPay", RequestUtil.param(request, "transactionCode"), RequestUtil.param(request, "status"));
            response.sendRedirect(request.getContextPath() + "/payment-result.jsp");
            return;
        }
        response.sendRedirect(request.getContextPath() + "/payment-result.jsp");
    }

    private boolean isGet(HttpServletRequest request) {
        return "GET".equalsIgnoreCase(request.getMethod());
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String jsp) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
        dispatcher.forward(request, response);
    }
}
