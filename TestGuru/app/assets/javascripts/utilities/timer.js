document.addEventListener('turbolinks:load', function() {
  let timerElement = document.getElementById('timer')

  
  if (timerElement) { countDown(timerElement) }
})

function countDown(timerElement) {
  var timeTest = timerElement.dataset.timeTest * 60
  var testCreated = new Date((timerElement.dataset.createdAt) * 1000)
  
  var endTime = (testCreated.getTime() / 1000) + timeTest
  var timeNow = Math.floor(Date.now() / 1000)

  var passedTime = endTime - timeNow
  
  if (passedTime < 0) {
    document.querySelector('.passage-form').submit()
    return
  }

  var hours   = Math.trunc(passedTime / 3600)
  var minutes = Math.trunc((passedTime - (hours * 3600)) / 60)
  var seconds = passedTime - (hours * 3600) - (minutes * 60)

  if (seconds < 10) { seconds = '0' + seconds }

  if (minutes < 10) { minutes = '0' + minutes }

  if (hours < 10) { hours = '0' + hours }

  timer.textContent = hours + ':' + minutes + ':' + seconds

  setTimeout(countDown, 1000, timerElement)
}
