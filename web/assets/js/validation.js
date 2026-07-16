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
        required: 'Tr\u01b0\u1eddng th\u00f4ng tin n\u00e0y b\u1eaft bu\u1ed9c nh\u1eadp.',
        email: '\u0110\u1ecba ch\u1ec9 email kh\u00f4ng \u0111\u00fang \u0111\u1ecbnh d\u1ea1ng.',
        phone: 'S\u1ed1 \u0111i\u1ec7n tho\u1ea1i g\u1ed3m 10 ch\u1eef s\u1ed1 (V\u00ed d\u1ee5: 0987654321).',
        minLength: (minLen) => `Y\u00eau c\u1ea7u t\u1ed1i thi\u1ec3u ${minLen} k\u00fd t\u1ef1.`,
        passwordMatch: 'M\u1eadt kh\u1ea9u x\u00e1c nh\u1eadn kh\u00f4ng kh\u1edbp.'
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
