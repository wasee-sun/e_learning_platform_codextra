document.querySelectorAll('.dropdown-btn').forEach(button => {
    button.addEventListener('click', () => {
        const dropdownContent = button.nextElementSibling;
        const arrow = button.querySelector('.arrow');

        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
            arrow.textContent = '▼';
        } else {
            dropdownContent.style.display = "block";
            arrow.textContent = '▲';
        }
    });
});