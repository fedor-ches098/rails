document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')
  
  if (progressBar) {
    var progress = 100/progressBar.dataset.questions * (progressBar.dataset.currentQuestion - 1) + "%"
    progressBar.style.width = progress
    progressBar.textContent = progress
  }
})
