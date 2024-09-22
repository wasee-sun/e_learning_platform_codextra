// Toggle accordion
document.querySelectorAll('.accordion-header').forEach(header => {
    header.addEventListener('click', function () {
        const accordionItem = this.parentElement;
        accordionItem.classList.toggle('active');
    });
});

