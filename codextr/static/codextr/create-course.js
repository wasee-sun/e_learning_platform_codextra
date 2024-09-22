const paidRadio = document.getElementById('paid');
const unpaidRadio = document.getElementById('unpaid');
const priceInput = document.getElementById('price');

paidRadio.addEventListener('change', () => {
    if (paidRadio.checked) {
        priceInput.style.display = 'block';
    }
});

unpaidRadio.addEventListener('change', () => {
    if (unpaidRadio.checked) {
        priceInput.style.display = 'none';
    }
});

function previewImage(event) {
  var reader = new FileReader();
  reader.onload = function() {
    var output = document.getElementById('imagePreview');
    output.src = reader.result;
    output.style.display = 'block';
  };
  reader.readAsDataURL(event.target.files[0]);
}