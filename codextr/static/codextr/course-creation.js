let sectionCount = 1;

function addSection() {
    sectionCount++;
    const sectionsDiv = document.getElementById('sections');
    
    // Create new section
    const newSection = document.createElement('div');
    newSection.className = 'section';
    newSection.id = `section${sectionCount}`;

    // Create label
    const newLabel = document.createElement('label');
    newLabel.setAttribute('for', `section${sectionCount}Name`);
    newLabel.textContent = `Section ${sectionCount} name`;

    // Create input
    const newInput = document.createElement('input');
    newInput.type = 'text';
    newInput.id = `section${sectionCount}Name`;
    newInput.name = `section${sectionCount}Name`;
    newInput.required = true;

    // Create add button
    const addButton = document.createElement('button');
    addButton.type = 'button';
    addButton.className = 'add';
    addButton.textContent = '+';
    addButton.onclick = addSection;

    // Create remove button
    const removeButton = document.createElement('button');
    removeButton.type = 'button';
    removeButton.className = 'remove';
    removeButton.textContent = '−';
    removeButton.onclick = () => removeSection(sectionCount);

    // Append elements to the new section div
    newSection.appendChild(newLabel);
    newSection.appendChild(newInput);
    newSection.appendChild(addButton);
    newSection.appendChild(removeButton);

    // Add the new section to the form
    sectionsDiv.appendChild(newSection);
}

function removeSection(sectionId) {
    const section = document.getElementById(`section${sectionId}`);
    section.remove();
}
