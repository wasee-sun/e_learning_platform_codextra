// Open modal// Open the edit modal and populate with course data
let courseIdToDelete;

    function showDeleteModal(courseId) {
        courseIdToDelete = courseId; // Store the course ID
        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }

    document.getElementById('confirmDeleteBtn').onclick = function() {
        const username = '{{ user.username }}'; // Pass the username from your context
        window.location.href = `/codextr/instructor/${username}/delete-course/${courseIdToDelete}/`;
    };