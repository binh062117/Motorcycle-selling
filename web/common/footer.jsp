<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:message key="footer.shareAria" var="shareAria" />
<fmt:message key="common.close" var="closeLabel" />
    
    <!-- Footer Section -->
    <footer class="w-100 py-5 bg-dark border-top border-secondary position-relative" style="border-color: var(--border-color) !important; z-index: 10;">
        <div class="container-fluid px-4 max-w-container-max mx-auto">
            <div class="row g-4 justify-content-between">
                
                <!-- Column 1: Brand Info -->
                <div class="col-12 col-md-5 col-lg-6 mb-4 mb-md-0">
                    <div class="d-flex flex-column align-items-start mb-3">
                        <span class="font-heading fs-4 fw-black text-danger tracking-tighter uppercase leading-none m-0" style="font-weight:900;">DUCATI SHOWROOM</span>
                        <span class="font-mono-data text-muted uppercase leading-none mt-1" style="font-size:10px; letter-spacing: 0.3em;">Borgo Panigale — Italy</span>
                    </div>
                    <p class="text-muted small max-w-sm mb-4" style="max-width: 400px; line-height: 1.6;">
                        <fmt:message key="footer.description" />
                    </p>
                    <div class="d-flex gap-2">
                        <button type="button" class="btn btn-outline-secondary d-flex align-items-center justify-content-center p-2 rounded-0 hover:border-danger hover:text-danger text-white" style="width: 40px; height: 40px;" data-bs-toggle="modal" data-bs-target="#shareSiteModal" aria-label="${shareAria}">
                            <span class="material-symbols-outlined fs-5">share</span>
                        </button>
                    </div>
                </div>
                
                <!-- Column 2: Quick Links -->
                <div class="col-12 col-sm-6 col-md-3 mb-4 mb-sm-0">
                    <span class="font-heading text-danger text-uppercase tracking-wider small fw-bold d-block mb-3"><fmt:message key="footer.quickTitle" /></span>
                    <ul class="list-unstyled d-flex flex-column gap-2 m-0 small">
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="${pageContext.request.contextPath}/products"><fmt:message key="footer.collection" /></a></li>
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="${pageContext.request.contextPath}/price-list"><fmt:message key="footer.price" /></a></li>
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="${pageContext.request.contextPath}/dealers"><fmt:message key="footer.dealers" /></a></li>
                        <li><a class="text-muted hover:text-white text-decoration-none transition-colors" href="${pageContext.request.contextPath}/order-history"><fmt:message key="footer.testRide" /></a></li>
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

    <div class="modal fade" id="shareSiteModal" tabindex="-1" aria-labelledby="shareSiteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border border-secondary rounded-0">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title font-heading text-uppercase text-danger" id="shareSiteModalLabel"><fmt:message key="footer.shareTitle" /></h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="${closeLabel}"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted small mb-3"><fmt:message key="footer.shareBody" /></p>
                    <div class="row g-2">
                        <div class="col-6">
                            <a class="btn btn-outline-ducati w-100 rounded-0 py-3 js-share-link" data-share-platform="facebook" target="_blank" rel="noopener">Facebook</a>
                        </div>
                        <div class="col-6">
                            <a class="btn btn-outline-ducati w-100 rounded-0 py-3 js-share-link" data-share-platform="zalo" target="_blank" rel="noopener">Zalo</a>
                        </div>
                        <div class="col-6">
                            <a class="btn btn-outline-ducati w-100 rounded-0 py-3 js-share-link" data-share-platform="x" target="_blank" rel="noopener">X</a>
                        </div>
                        <div class="col-6">
                            <a class="btn btn-outline-ducati w-100 rounded-0 py-3 js-share-link" data-share-platform="linkedin" target="_blank" rel="noopener">LinkedIn</a>
                        </div>
                    </div>
                    <button type="button" class="btn btn-ducati w-100 rounded-0 mt-3 py-3" id="copyShareLink">
                        <fmt:message key="footer.copyLink" />
                    </button>
                    <div id="shareCopyFeedback" class="text-danger font-mono-data small mt-2 d-none"><fmt:message key="footer.copied" /></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 Bundle JS (with Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom validation module -->
    <script src="${pageContext.request.contextPath}/assets/js/validation.js?v=20260713"></script>
    
    <!-- Main interactive scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js?v=20260713"></script>
    <script>
        document.querySelectorAll('.js-lang-switch').forEach((link) => {
            link.addEventListener('click', (event) => {
                event.preventDefault();
                const url = new URL(window.location.href);
                url.searchParams.set('lang', link.dataset.lang);
                window.location.href = url.toString();
            });
        });

        const shareModal = document.getElementById('shareSiteModal');
        if (shareModal) {
            shareModal.addEventListener('show.bs.modal', () => {
                const pageUrl = window.location.href;
                const pageTitle = document.title || 'Ducati Showroom';
                const encodedUrl = encodeURIComponent(pageUrl);
                const encodedTitle = encodeURIComponent(pageTitle);
                const targets = {
                    facebook: `https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`,
                    zalo: `https://zalo.me/share?u=${encodedUrl}`,
                    x: `https://twitter.com/intent/tweet?url=${encodedUrl}&text=${encodedTitle}`,
                    linkedin: `https://www.linkedin.com/sharing/share-offsite/?url=${encodedUrl}`
                };
                document.querySelectorAll('.js-share-link').forEach((link) => {
                    link.href = targets[link.dataset.sharePlatform] || pageUrl;
                });
            });

            const copyButton = document.getElementById('copyShareLink');
            const feedback = document.getElementById('shareCopyFeedback');
            if (copyButton) {
                copyButton.addEventListener('click', async () => {
                    const text = window.location.href;
                    if (navigator.clipboard && navigator.clipboard.writeText) {
                        await navigator.clipboard.writeText(text);
                    } else {
                        const input = document.createElement('input');
                        input.value = text;
                        document.body.appendChild(input);
                        input.select();
                        document.execCommand('copy');
                        input.remove();
                    }
                    if (feedback) feedback.classList.remove('d-none');
                });
            }
        }
    </script>
</body>
</html>


