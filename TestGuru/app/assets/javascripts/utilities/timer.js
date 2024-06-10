document.addEventListener('turbolinks:load', function() {
  let timerElement = document.getElementById('timer')

  
  if (timerElement) { countDown(timerElement) }
})

function countDown(timerElement) {
  var timerInSeconds = timerElement.dataset.timeTest * 60
  
  setTime(timerElement, timerInSeconds)

  var timerId = setInterval(function() {
    timerInSeconds--
    
    setTime(timerElement, timerInSeconds)
    
    if (timerInSeconds == 0) {
      clearInterval(timerId)
      alert("Время вышло")
      window.location.replace(window.location + '/result')
    }
  }, 1000)
}

function setTime(timerElement, timerInSeconds) {
  var hours = Math.floor(timerInSeconds / 3600)
  var minutes = Math.floor((timerInSeconds / 60) % 60)
  var seconds = Math.floor(timerInSeconds % 60)

  if (seconds < 10) seconds = '0' + seconds
  if (minutes < 10) minutes = '0' + minutes
  if (hours < 10) hours = '0' + hours

  timerElement.textContent = hours + ':' + minutes + ':' + seconds
}
