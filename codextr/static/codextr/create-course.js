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

let sectionCount = 1;

function addSection() {
  sectionCount++;
  
  // Create a new section div
  const sectionDiv = document.createElement('div');
  sectionDiv.classList.add('section');
  sectionDiv.id = `section-${sectionCount}`;
  
  // Add section input and buttons
  sectionDiv.innerHTML = `
    <label for="section${sectionCount}">Section ${sectionCount}</label>
    <input type="text" id="section${sectionCount}" name="section${sectionCount}" required>
    <button class="add-btn" onclick="addSection()">+</button>
    <button class="remove-btn" onclick="removeSection(${sectionCount})">-</button>
  `;
  
  // Append the new section before the "Create course" button
  const sectionContainer = document.getElementById('section-container');
  sectionContainer.appendChild(sectionDiv);

  // Move the Create Course button down
  const createCourseBtn = document.getElementById('create-course-btn');
  sectionContainer.insertAdjacentElement('afterend', createCourseBtn);
}

function removeSection(sectionId) {
  const sectionToRemove = document.getElementById(`section-${sectionId}`);
  
  if (sectionToRemove) {
    sectionToRemove.remove();
    sectionCount--;
  }
}
