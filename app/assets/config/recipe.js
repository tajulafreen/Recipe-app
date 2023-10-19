// Wrap your code in a function to create a scope
(function() {

  const modifyButtons = document.querySelectorAll('.modify-button');
  const modifyForms = document.querySelectorAll('.modify-form');

  modifyButtons.forEach((button, index) => {
    button.addEventListener('click', function () {
      if (modifyForms[index].style.display === 'none') {
        modifyForms[index].style.display = 'block';
      } else {
        modifyForms[index].style.display = 'none';
      }
    });
  });
})();
