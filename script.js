// Contact form handler with EmailJS
const contactForm = document.getElementById('contact-form');
if (contactForm) {
  // Initialize EmailJS if available
  if (window.emailjs && typeof window.emailjs.init === 'function') {
    try {
      // TODO: Replace with your actual public key from EmailJS dashboard
      window.emailjs.init('service_1fllq48');
    } catch (_err) {
      // ignore init error; will fallback
    }
  }

  contactForm.addEventListener('submit', async function(e) {
    e.preventDefault();

    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const subject = document.getElementById('subject').value.trim();
    const message = document.getElementById('message').value.trim();

    const payload = { name, email, subject, message };

    // Prefer EmailJS if configured
    const hasEmailJs = window.emailjs && typeof window.emailjs.send === 'function';
    const hasPublicKey = !!(window.emailjs && window.emailjs.__publicKey);

    try {
      if (hasEmailJs) {
        // TODO: Replace with your service ID and template ID
        const SERVICE_ID = 'YOUR_SERVICE_ID';
        const TEMPLATE_ID = 'YOUR_TEMPLATE_ID';
        await window.emailjs.send(SERVICE_ID, TEMPLATE_ID, payload);
        alert('Thank you! Your message has been sent.');
        this.reset();
        return;
      }
      // Fallback: open mailto (pre-fills email client)
      const mailto = `mailto:bhaggubaba1@gmail.com?subject=${encodeURIComponent(subject || 'Contact from Portfolio')}&body=${encodeURIComponent(`From: ${name} <${email}>\n+
${message}`)}`;
      window.location.href = mailto;
    } catch (_err) {
      alert('Sorry, something went wrong. Please email me directly at: bhaggubaba1@gmail.com');
    }
  });
}

// Smooth scroll for nav links
const navLinks = document.querySelectorAll('.nav-links a');
navLinks.forEach(link => {
  link.addEventListener('click', function(e) {
    const href = this.getAttribute('href');
    if (href.startsWith('#')) {
      e.preventDefault();
      const target = document.querySelector(href);
      if (target) {
        window.scrollTo({
          top: target.offsetTop - 60,
          behavior: 'smooth'
        });
      }
    }
  });
}); 