/**
 * validation.js - Client side form validations using Bootstrap 5 states
 */

document.addEventListener('DOMContentLoaded', () => {
    initFormValidations();
    initImageUploadPreview();
});

// Setup event listeners for forms with 'needs-validation-custom' class
function initFormValidations() {
    const forms = document.querySelectorAll('.needs-validation-custom');
    forms.forEach(form => {
        form.addEventListener('submit', (e) => {
            let isValid = true;

            // Select all inputs that need validation
            const inputs = form.querySelectorAll('input, select, textarea');
            inputs.forEach(input => {
                if (!validateInput(input)) {
                    isValid = false;
                }
            });

            if (!isValid) {
                e.preventDefault();
                e.stopPropagation();
                
                // Scroll to first invalid element
                const firstInvalid = form.querySelector('.is-invalid');
                if (firstInvalid) {
                    firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    firstInvalid.focus();
                }
            }
        });

        // Add real-time validation on blur
        form.querySelectorAll('input, select, textarea').forEach(input => {
            input.addEventListener('blur', () => {
                validateInput(input);
            });
            input.addEventListener('input', () => {
                if (input.classList.contains('is-invalid')) {
                    validateInput(input);
                }
            });
        });
    });
}

function validateInput(input) {
    let isValid = true;
    let errorMessage = '';

    // 1. Required Check
    if (input.hasAttribute('required') && !input.value.trim()) {
        isValid = false;
        errorMessage = 'Trường thông tin này bắt buộc nhập.';
    }

    // 2. Email format check
    if (isValid && input.type === 'email' && input.value.trim()) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(input.value)) {
            isValid = false;
            errorMessage = 'Địa chỉ email không đúng định dạng.';
        }
    }

    // 3. Phone format check (Vietnam format)
    if (isValid && input.classList.contains('validate-phone') && input.value.trim()) {
        const phoneRegex = /^(0[3|5|7|8|9])+([0-9]{8})$/;
        if (!phoneRegex.test(input.value.replace(/\s+/g, ''))) {
            isValid = false;
            errorMessage = 'Số điện thoại gồm 10 chữ số (Ví dụ: 0987654321).';
        }
    }

    // 4. Minimum length check
    if (isValid && input.hasAttribute('minlength') && input.value.trim()) {
        const minLen = parseInt(input.getAttribute('minlength'));
        if (input.value.length < minLen) {
            isValid = false;
            errorMessage = `Yêu cầu tối thiểu ${minLen} ký tự.`;
        }
    }

    // 5. Password confirmation match
    if (isValid && input.id === 'confirmPassword') {
        const passwordInput = document.getElementById('password');
        if (passwordInput && input.value !== passwordInput.value) {
            isValid = false;
            errorMessage = 'Mật khẩu xác nhận không khớp.';
        }
    }

    // Apply classes and feedback messages
    if (!isValid) {
        input.classList.remove('is-valid');
        input.classList.add('is-invalid');
        
        let feedbackEl = input.parentElement.querySelector('.invalid-feedback');
        if (!feedbackEl) {
            feedbackEl = document.createElement('div');
            feedbackEl.className = 'invalid-feedback font-mono-data text-xs mt-1';
            input.parentElement.appendChild(feedbackEl);
        }
        feedbackEl.textContent = errorMessage;
    } else {
        input.classList.remove('is-invalid');
        // Only add is-valid if the field is not empty and has rules
        if (input.value.trim() && (input.hasAttribute('required') || input.type === 'email' || input.classList.contains('validate-phone'))) {
            input.classList.add('is-valid');
        }
    }

    return isValid;
}

// Image preview for file uploads
function initImageUploadPreview() {
    const fileInputs = document.querySelectorAll('.preview-image-input');
    fileInputs.forEach(input => {
        const targetPreviewId = input.getAttribute('data-preview-target');
        const targetPreview = document.getElementById(targetPreviewId);
        
        if (targetPreview) {
            input.addEventListener('change', (e) => {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(evt) {
                        targetPreview.src = evt.target.result;
                        targetPreview.classList.remove('d-none');
                    }
                    reader.readAsDataURL(file);
                } else {
                    targetPreview.classList.add('d-none');
                }
            });
        }
    });
}
