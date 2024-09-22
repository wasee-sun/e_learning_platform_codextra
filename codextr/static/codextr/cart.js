document.querySelector('.apply-btn').addEventListener('click', function() {
    let couponInput = document.getElementById('coupon').value;
    let totalPriceElement = document.querySelector('.total-price');
    
    if (couponInput === 'DISCOUNT10') {
        totalPriceElement.textContent = '$67.49'; // Assuming a 10% discount
    } else {
        alert('Invalid Coupon');
    }
});