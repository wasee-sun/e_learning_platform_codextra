function scrollLeft() {
    document.querySelector('.course-list').scrollBy({
      top: 0,
      left: -200,
      behavior: 'smooth'
    });
  }
  
  function scrollRight() {
    document.querySelector('.course-list').scrollBy({
      top: 0,
      left: 200,
      behavior: 'smooth'
    });
  }
  