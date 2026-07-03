<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    
    <!-- Footer Section -->
    <footer class="w-100 py-5 bg-dark border-top border-secondary position-relative" style="border-color: var(--border-color) !important; z-index: 10;">
        <div class="container-fluid px-4 max-w-container-max mx-auto">
            <div class="row g-4 justify-content-between">
                
                <!-- Column 1: Brand Info -->
                <div class="col-12 col-md-5 col-lg-6 mb-4 mb-md-0">
                    <div class="d-flex flex-column align-items-start mb-3">
                        <span class="font-heading fs-4 fw-black text-danger tracking-tighter uppercase leading-none m-0" style="font-weight:900;">DUCATI CORSE</span>
                        <span class="font-mono-data text-muted uppercase leading-none mt-1" style="font-size:10px; letter-spacing: 0.3em;">Borgo Panigale — Italy</span>
                    </div>
                    <p class="text-muted small max-w-sm mb-4" style="max-width: 400px; line-height: 1.6;">
                        <fmt:message key="footer.description" />
                    </p>
                    <div class="d-flex gap-2">
                        <a class="btn btn-outline-secondary d-flex align-items-center justify-content-center p-2 rounded-0 hover:border-danger hover:text-danger text-white text-decoration-none" style="width: 40px; height: 40px;" href="#">
                            <span class="material-symbols-outlined fs-5">language</span>
                        </a>
                        <a class="btn btn-outline-secondary d-flex align-items-center justify-content-center p-2 rounded-0 hover:border-danger hover:text-danger text-white text-decoration-none" style="width: 40px; height: 40px;" href="#">
                            <span class="material-symbols-outlined fs-5">share</span>
                        </a>
                        <a class="btn btn-outline-secondary d-flex align-items-center justify-content-center p-2 rounded-0 hover:border-danger hover:text-danger text-white text-decoration-none" style="width: 40px; height: 40px;" href="#">
                            <span class="material-symbols-outlined fs-5">mail</span>
                        </a>
                    </div>
                </div>
                
                <!-- Column 2: Quick Links -->
                <div class="col-12 col-sm-6 col-md-3 mb-4 mb-sm-0">
                    <span class="font-heading text-danger text-uppercase tracking-wider small fw-bold d-block mb-3"><fmt:message key="footer.quickTitle" /></span>
                    <ul class="list-unstyled d-flex flex-column gap-2 m-0 small">
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="${pageContext.request.contextPath}/products"><fmt:message key="footer.collection" /></a></li>
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="#"><fmt:message key="footer.price" /></a></li>
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="#"><fmt:message key="footer.dealers" /></a></li>
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="#"><fmt:message key="footer.testRide" /></a></li>
                    </ul>
                </div>
                
                <!-- Column 3: Contact & Legal -->
                <div class="col-12 col-sm-6 col-md-3">
                    <span class="font-heading text-danger text-uppercase tracking-wider small fw-bold d-block mb-3"><fmt:message key="footer.contactTitle" /></span>
                    <p class="text-muted small leading-relaxed mb-3">
                        <fmt:message key="footer.contact" />
                    </p>
                    <p class="font-mono-data text-danger font-semibold m-0" style="font-size:14px;">+84 24 6413 1111</p>
                </div>
            </div>
            
            <!-- Bottom Footer -->
            <div class="mt-5 pt-4 border-top border-secondary d-flex flex-col flex-md-row justify-content-between align-items-center gap-3" style="border-color: rgba(51, 53, 53, 0.3) !important;">
                <span class="text-muted small text-uppercase tracking-wider" style="font-size: 11px;">
                    © 2026 DUCATI MOTOR HOLDING S.P.A. ALL RIGHTS RESERVED.
                </span>
                <div class="d-flex gap-4 font-mono-data text-muted" style="font-size: 10px;">
                    <span>MST: 05113870967</span>
                    <span><fmt:message key="footer.license" /></span>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5 Bundle JS (with Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom validation module -->
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
    
    <!-- Main interactive scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script>
        document.querySelectorAll('.js-lang-switch').forEach((link) => {
            link.addEventListener('click', (event) => {
                event.preventDefault();
                const url = new URL(window.location.href);
                url.searchParams.set('lang', link.dataset.lang);
                window.location.href = url.toString();
            });
        });
    </script>
</body>
</html>

