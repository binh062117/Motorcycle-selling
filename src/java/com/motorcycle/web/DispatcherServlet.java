package com.motorcycle.web;

import com.motorcycle.model.Brand;
import com.motorcycle.model.Notification;
import com.motorcycle.model.Product;
import com.motorcycle.model.User;
import com.motorcycle.service.AdminService;
import com.motorcycle.service.AuthService;
import com.motorcycle.service.CartService;
import com.motorcycle.service.CatalogService;
import com.motorcycle.service.GoogleOAuthService;
import com.motorcycle.service.OrderService;
import com.motorcycle.service.NotificationService;
import com.motorcycle.service.PaymentService;
import com.motorcycle.service.PaymentService.VnPayCallbackResult;
import com.motorcycle.util.RequestUtil;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    private final NotificationService notificationService = new NotificationService();
    private final AdminService adminService = new AdminService();
    private final PaymentService paymentService = new PaymentService();
    private final GoogleOAuthService googleOAuthService = new GoogleOAuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        route(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        route(request, response);
    }

    private void route(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("cartItemCount", cartService.itemCount(request.getSession()));
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
            if ("/home".equals(path)) {
                home(request, response);
            } else if ("/login".equals(path)) {
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
            } else if ("/google-callback".equals(path)) {
                googleCallback(request, response);
            } else if ("/products".equals(path)) {
                products(request, response);
            } else if ("/price-list".equals(path)) {
                priceList(request, response);
            } else if ("/dealers".equals(path)) {
                dealers(request, response);
            } else if ("/product-detail".equals(path)) {
                productDetail(request, response);
            } else if ("/cart".equals(path)) {
                cart(request, response);
            } else if ("/checkout".equals(path)) {
                checkout(request, response);
            } else if ("/order-history".equals(path) || "/order-history.jsp".equals(path)) {
                orderHistory(request, response);
            } else if ("/order-detail".equals(path)) {
                orderDetail(request, response);
            } else if (path.startsWith("/profile")) {
                profile(request, response, path);
            } else if ("/notifications".equals(path)) {
                notifications(request, response);
            } else if ("/notifications/read".equals(path)) {
                markNotificationsRead(request, response);
            } else if ("/admin/dashboard".equals(path)) {
                adminDashboard(request, response);
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
            Object loginError = request.getSession().getAttribute("loginErrorMessage");
            if (loginError != null) {
                request.setAttribute("errorMessage", loginError);
                request.getSession().removeAttribute("loginErrorMessage");
            }
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
        response.sendRedirect(request.getContextPath() + (user.get().isAdmin() ? "/admin/dashboard" : "/home"));
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/home");
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
        response.sendRedirect(request.getContextPath() + "/home");
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
        try {
            String state = java.util.UUID.randomUUID().toString();
            request.getSession().setAttribute("googleOAuthState", state);
            response.sendRedirect(googleOAuthService.buildAuthorizationUrl(googleRedirectUri(request), state));
        } catch (RuntimeException ex) {
            request.getSession().setAttribute("loginErrorMessage", googleLoginErrorMessage(ex));
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    private void googleCallback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String state = RequestUtil.param(request, "state");
        Object expected = request.getSession().getAttribute("googleOAuthState");
        if (expected == null || !expected.equals(state)) {
            request.getSession().setAttribute("loginErrorMessage", "Phiên đăng nhập Google đã hết hạn. Vui lòng thử lại.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        try {
            User user = googleOAuthService.loginWithCode(RequestUtil.param(request, "code"), googleRedirectUri(request));
            request.getSession().setAttribute("currentUser", user);
            response.sendRedirect(request.getContextPath() + "/home");
        } catch (RuntimeException ex) {
            request.getSession().setAttribute("loginErrorMessage", googleLoginErrorMessage(ex));
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    private String googleLoginErrorMessage(RuntimeException ex) {
        String message = ex.getMessage();
        if (message == null || message.trim().isEmpty()) {
            message = "Không thể đăng nhập bằng Google. Vui lòng kiểm tra cấu hình OAuth.";
        }
        if (message.contains("GOOGLE_CLIENT_ID") || message.contains("GOOGLE_CLIENT_SECRET")) {
            return "Chưa cấu hình Google OAuth cho Tomcat 9. Hãy thêm GOOGLE_CLIENT_ID và GOOGLE_CLIENT_SECRET vào bin\\setenv.bat rồi restart Tomcat.";
        }
        if (message.contains("redirect_uri_mismatch")) {
            return "Redirect URI trong Google Cloud chưa khớp. Cần thêm http://localhost:8080/web_b_n_xe_m_y/google-callback.";
        }
        return message;
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("featuredProducts", catalogService.featuredProducts(4));
        request.setAttribute("brands", catalogService.findBrands());
        forward(request, response, "/home.jsp");
    }

    private String googleRedirectUri(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName()
                + (request.getServerPort() == 80 || request.getServerPort() == 443 ? "" : ":" + request.getServerPort())
                + request.getContextPath() + "/google-callback";
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

    private void priceList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", catalogService.search("", "", "", ""));
        forward(request, response, "/price-list.jsp");
    }

    private void dealers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forward(request, response, "/dealers.jsp");
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
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        request.setAttribute("cartItems", cartService.getCart(session));
        request.setAttribute("cartSubtotal", cartService.subtotal(session));
        forward(request, response, "/cart.jsp");
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (isGet(request)) {
            request.setAttribute("cartItems", cartService.getCart(request.getSession()));
            request.setAttribute("cartSubtotal", cartService.subtotal(request.getSession()));
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
        com.motorcycle.model.Order order = orderService.createOrder(user,
                cartService.getCart(request.getSession()),
                RequestUtil.param(request, "txtShowroom"),
                RequestUtil.param(request, "txtAppointmentDate"),
                RequestUtil.param(request, "txtAppointmentTime"),
                RequestUtil.param(request, "txtPaymentMethod"));
        cartService.clear(request.getSession());
        request.getSession().setAttribute("latestOrder", order);
        if ("VNPay".equalsIgnoreCase(RequestUtil.param(request, "txtPaymentMethod"))) {
            String returnUrl = externalBaseUrl(request) + request.getContextPath() + "/payment/callback";
            response.sendRedirect(paymentService.createVnPayUrl(order, returnUrl, request.getRemoteAddr()));
            return;
        }
        response.sendRedirect(request.getContextPath() + "/order-history");
    }

    private void orderHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        request.setAttribute("orders", orderService.findOrdersFor(user));
        forward(request, response, "/order-history.jsp");
    }

    private void orderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = RequestUtil.intParam(request, "id", 0);
        request.setAttribute("order", orderService.findById(id).orElse(null));
        forward(request, response, "/order-detail.jsp");
    }

    private void profile(HttpServletRequest request, HttpServletResponse response, String path) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("currentUser");
        if ("/profile/update".equals(path)) {
            authService.updateProfile(user,
                    RequestUtil.param(request, "txtFirstName"),
                    RequestUtil.param(request, "txtLastName"),
                    RequestUtil.param(request, "txtPhone"),
                    RequestUtil.param(request, "txtAddress"));
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        } else if ("/profile/change-password".equals(path)) {
            boolean ok = authService.changePassword(user, RequestUtil.param(request, "txtOldPassword"), RequestUtil.param(request, "txtNewPassword"));
            request.getSession().setAttribute("profileMessage", ok ? "Đã đổi mật khẩu." : "Mật khẩu hiện tại không đúng.");
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }
        if (user != null && user.isAdmin()) {
            prepareAdminDashboardAttributes(request);
        }
        forward(request, response, "/profile.jsp");
    }

    private void notifications(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        if (user == null) {
            response.getWriter().write("{\"items\":[],\"unreadCount\":0}");
            return;
        }
        List<Notification> notifications = notificationService.recentFor(user);
        StringBuilder json = new StringBuilder();
        json.append("{\"items\":[");
        for (int i = 0; i < notifications.size(); i++) {
            if (i > 0) {
                json.append(',');
            }
            json.append(notificationJson(notifications.get(i)));
        }
        json.append("],\"unreadCount\":").append(notificationService.unreadCountFor(user)).append('}');
        response.getWriter().write(json.toString());
    }

    private void markNotificationsRead(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        if (user != null) {
            notificationService.markAllRead(user);
        }
        response.getWriter().write("{\"ok\":true,\"unreadCount\":0}");
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
            response.sendRedirect(request.getContextPath() + "/admin/manage-product");
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
            response.sendRedirect(request.getContextPath() + "/admin/manage-product");
            return;
        }
        request.setAttribute("products", catalogService.search("", "", "", ""));
        request.setAttribute("brands", catalogService.findBrands());
        request.setAttribute("categories", catalogService.findCategories());
        forward(request, response, "/admin/manage-product.jsp");
    }

    private void adminDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        prepareAdminDashboardAttributes(request);
        forward(request, response, "/admin/dashboard-view.jsp");
    }

    private void prepareAdminDashboardAttributes(HttpServletRequest request) {
        List<Product> products = catalogService.search("", "", "", "");
        List<com.motorcycle.model.Order> orders = orderService.findAllOrders();
        BigDecimal revenue = BigDecimal.ZERO;
        int pendingOrders = 0;
        int stockTotal = 0;
        Map<Integer, Integer> bookedByProduct = new HashMap<Integer, Integer>();

        for (Product product : products) {
            stockTotal += product.getStock();
            bookedByProduct.put(product.getId(), 0);
        }
        for (com.motorcycle.model.Order order : orders) {
            if (isPendingOrderStatus(order.getStatus())) {
                pendingOrders++;
            }
            if (order.getTotal() != null) {
                revenue = revenue.add(order.getTotal());
            }
            for (com.motorcycle.model.OrderDetail detail : order.getDetails()) {
                if (detail.getProduct() != null) {
                    int productId = detail.getProduct().getId();
                    Integer current = bookedByProduct.get(productId);
                    bookedByProduct.put(productId, (current == null ? 0 : current) + detail.getQuantity());
                }
            }
        }

        request.setAttribute("productCount", products.size());
        request.setAttribute("adminProductCount", products.size());
        request.setAttribute("stockTotal", stockTotal);
        request.setAttribute("pendingOrders", pendingOrders);
        request.setAttribute("adminPendingOrders", pendingOrders);
        request.setAttribute("orderCount", orders.size());
        request.setAttribute("adminOrderCount", orders.size());
        request.setAttribute("dashboardRevenue", revenue);
        request.setAttribute("adminDashboardRevenue", revenue);
        request.setAttribute("topProducts", products.size() > 6 ? products.subList(0, 6) : products);
        request.setAttribute("recentOrders", orders.size() > 8 ? orders.subList(0, 8) : orders);
        request.setAttribute("bookedByProduct", bookedByProduct);
    }

    private boolean isPendingOrderStatus(String status) {
        if (status == null) {
            return false;
        }
        String normalized = status.toLowerCase();
        return normalized.contains("pending")
                || normalized.contains("new")
                || normalized.contains("chờ")
                || normalized.contains("cho duyet")
                || normalized.contains("duyệt")
                || normalized.contains("duyá");
    }

    private void manageBrand(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!isGet(request)) {
            Brand brand = new Brand();
            brand.setId(RequestUtil.intParam(request, "txtBrandId", 0));
            brand.setName(RequestUtil.param(request, "txtBrandName"));
            brand.setOrigin(RequestUtil.param(request, "txtBrandOrigin"));
            brand.setLogoUrl(RequestUtil.param(request, "txtBrandLogoUrl"));
            catalogService.saveBrand(brand);
            response.sendRedirect(request.getContextPath() + "/admin/manage-brand");
            return;
        } else if ("delete".equals(RequestUtil.param(request, "action"))) {
            catalogService.deleteBrand(RequestUtil.intParam(request, "id", 0));
            response.sendRedirect(request.getContextPath() + "/admin/manage-brand");
            return;
        }
        request.setAttribute("brands", catalogService.findBrands());
        forward(request, response, "/admin/manage-brand.jsp");
    }

    private void manageOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!isGet(request)) {
            orderService.updateStatus(RequestUtil.intParam(request, "orderId", 0), RequestUtil.param(request, "txtOrderStatus"));
            response.sendRedirect(request.getContextPath() + "/admin/manage-order");
            return;
        }
        request.setAttribute("orders", orderService.findAllOrders());
        forward(request, response, "/admin/manage-order.jsp");
    }

    private void manageUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!isGet(request)) {
            adminService.updateRole(RequestUtil.intParam(request, "accountId", 0), RequestUtil.param(request, "txtRole"));
            response.sendRedirect(request.getContextPath() + "/admin/manage-user");
            return;
        }
        request.setAttribute("users", adminService.findUsers());
        forward(request, response, "/admin/manage-user.jsp");
    }

    private void payment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String paymentPath = request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo());
        if (paymentPath.contains("callback")) {
            VnPayCallbackResult result = paymentService.processVnPayCallback(request.getParameterMap());
            response.sendRedirect(request.getContextPath() + "/payment-result.jsp?status=" + result.getStatus());
            return;
        }
        response.sendRedirect(request.getContextPath() + "/payment-result.jsp");
    }

    private String externalBaseUrl(HttpServletRequest request) {
        String configured = runtimeValue("APP_BASE_URL");
        if (!configured.isEmpty()) {
            return validateBaseUrl(configured);
        }
        String scheme = firstForwardedValue(request.getHeader("X-Forwarded-Proto"));
        if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) {
            scheme = request.getScheme();
        }
        String host = firstForwardedValue(request.getHeader("X-Forwarded-Host"));
        if (host.isEmpty()) {
            host = request.getHeader("Host");
        }
        if (host == null || !host.matches("^[A-Za-z0-9.-]+(?::[0-9]{1,5})?$")) {
            host = request.getServerName() + ((request.getServerPort() == 80 || request.getServerPort() == 443)
                    ? "" : ":" + request.getServerPort());
        }
        return scheme.toLowerCase(java.util.Locale.ROOT) + "://" + host;
    }

    private String validateBaseUrl(String value) {
        try {
            URI uri = new URI(value);
            if (uri.getUserInfo() != null || uri.getHost() == null
                    || !("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))) {
                throw new IllegalStateException("APP_BASE_URL không hợp lệ.");
            }
            String normalized = uri.getScheme().toLowerCase(java.util.Locale.ROOT) + "://" + uri.getAuthority();
            return normalized.endsWith("/") ? normalized.substring(0, normalized.length() - 1) : normalized;
        } catch (URISyntaxException ex) {
            throw new IllegalStateException("APP_BASE_URL không hợp lệ.", ex);
        }
    }

    private String firstForwardedValue(String value) {
        return value == null ? "" : value.split(",", 2)[0].trim();
    }

    private String runtimeValue(String key) {
        String property = System.getProperty(key);
        if (property != null && !property.trim().isEmpty()) {
            return property.trim();
        }
        String environment = System.getenv(key);
        return environment == null ? "" : environment.trim();
    }

    private boolean isGet(HttpServletRequest request) {
        return "GET".equalsIgnoreCase(request.getMethod());
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String jsp) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
        dispatcher.forward(request, response);
    }

    private String notificationJson(Notification notification) {
        String createdAt = notification.getCreatedAt() == null ? "" : notification.getCreatedAt().toString();
        return "{"
                + "\"id\":" + notification.getId() + ","
                + "\"title\":\"" + jsonEscape(notification.getTitle()) + "\","
                + "\"message\":\"" + jsonEscape(notification.getMessage()) + "\","
                + "\"read\":" + notification.isRead() + ","
                + "\"createdAt\":\"" + jsonEscape(createdAt) + "\""
                + "}";
    }

    private String jsonEscape(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n");
    }
}
