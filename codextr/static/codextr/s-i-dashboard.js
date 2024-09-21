
function scrollCoursesLeft() {
  let courseList = document.querySelector('.course-list');
  courseList.scrollBy({
    top: 0,
    left: -courseList.offsetWidth / 2, 
    behavior: 'smooth'
  });
}

function scrollRight() {
  let courseList = document.querySelector('.course-list');
  courseList.scrollBy({
    top: 0,
    left: courseList.offsetWidth / 2,
    behavior: 'smooth'
  });
}
