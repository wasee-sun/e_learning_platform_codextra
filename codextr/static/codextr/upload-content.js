// // Handle file preview
// document.getElementById('file_upload').addEventListener('change', function (event) {
//     const file = event.target.files[0];
//     const previewContainer = document.getElementById('file-preview');

//     if (file) {
//         const fileType = file.type;

//         if (fileType.includes('video')) {
//             const video = document.createElement('video');
//             video.src = URL.createObjectURL(file);
//             video.controls = true;
//             video.width = 300;

//             previewContainer.innerHTML = '';  // Clear previous content
//             previewContainer.appendChild(video);
//         } else if (fileType.includes('pdf')) {
//             const pdfPreview = document.createElement('p');
//             pdfPreview.innerText = 'PDF selected: ' + file.name;

//             previewContainer.innerHTML = '';  // Clear previous content
//             previewContainer.appendChild(pdfPreview);
//         } else {
//             previewContainer.innerHTML = 'File preview is not available for this type.';
//         }
//     }
// });

// // Handle form submission (you can expand this for backend integration)
// document.getElementById('upload-form').addEventListener('submit', function (event) {
//     event.preventDefault();  // Prevent the default form submission
//     alert('File uploaded successfully!');

//     // Here you can add code to send the form data to the server
// });
