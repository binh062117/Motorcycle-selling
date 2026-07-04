/**
 * validation.js - Client side form validations using Bootstrap 5 states
 */

document.addEventListener('DOMContentLoaded', () => {
    initFormValidations();
    initImageUploadPreview();
});

function getValidationMessages() {
    const lang = (document.documentElement.lang || 'vi').toLowerCase();
    if (lang.startsWith('en')) {
        return {
            required: 'This field is required.',
            email: 'Please enter a valid email address.',
            phone: 'Phone number must contain 10 digits (Example: 0987654321).',
            minLength: (minLen) => `Please enter at least ${minLen} characters.`,
            passwordMatch: 'Password confirmation does not match.'
        };
    }

    return {
        required: 'Trường thông tin này bắt buộc nhập.',
        email: 'Địa chỉ email không đúng định dạng.',
        phone: 'Số điện thoại gồm 10 chữ số (Ví dụ: 0987654321).',
        minLength: (minLen) => `Yêu cầu tối thiểu ${minLen} ký tự.`,
        passwordMatch: 'Mật khẩu xác nhận không khớp.'
    };
}

// Setup event listeners for forms with 'needs-validation-custom' class
function initFormValidations() {
    const forms = document.querySelectorAll('.needs-validation-custom');
    forms.forEach(form => {
        form.addEventListener('submit', (e) => {
            let isValid = true;

            const inputs = form.querySelectorAll('input, select, textarea');
            inputs.forEach(input => {
                if (!validateInput(input)) {
                    isValid = false;
                }
            });

            if (!isValid) {
                e.preventDefault();
                e.stopPropagation();

                const firstInvalid = form.querySelector('.is-invalid');
                if (firstInvalid) {
                    firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    firstInvalid.focus();
                }
            }
        });

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
    const messages = getValidationMessages();

    if (input.hasAttribute('required') && !input.value.trim()) {
        isValid = false;
        errorMessage = messages.required;
    }

    if (isValid && input.type === 'email' && input.value.trim()) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(input.value)) {
            isValid = false;
            errorMessage = messages.email;
        }
    }

    if (isValid && input.classList.contains('validate-phone') && input.value.trim()) {
        const phoneRegex = /^(0[35789])([0-9]{8})$/;
        if (!phoneRegex.test(input.value.replace(/\s+/g, ''))) {
            isValid = false;
            errorMessage = messages.phone;
        }
    }

    if (isValid && input.hasAttribute('minlength') && input.value.trim()) {
        const minLen = parseInt(input.getAttribute('minlength'), 10);
        if (input.value.length < minLen) {
            isValid = false;
            errorMessage = messages.minLength(minLen);
        }
    }

    if (isValid && input.id === 'confirmPassword') {
        const passwordInput = document.getElementById('password');
        if (passwordInput && input.value !== passwordInput.value) {
            isValid = false;
            errorMessage = messages.passwordMatch;
        }
    }

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
        if (input.value.trim() && (input.hasAttribute('required') || input.type === 'email' || input.classList.contains('validate-phone'))) {
            input.classList.add('is-valid');
        }
    }

    return isValid;
}

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
                    };
                    reader.readAsDataURL(file);
                } else {
                    targetPreview.classList.add('d-none');
                }
            });
        }
    });
}
