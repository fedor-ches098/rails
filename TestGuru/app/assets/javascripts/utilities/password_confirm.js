document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password && password_confirmation) {
    password.addEventListener('input', validation)
    password_confirmation.addEventListener('input', validation)
  }
})

function validation() {
  var password_value = document.getElementById("user_password").value
  var password_confirmation_value = document.getElementById("user_password_confirmation").value
  
  if (password_confirmation_value.length == 0) {
    this.classList.remove('bg-danger')
    this.classList.remove('bg-success')
    this.classList.add('bg-light')
    return;
  }

  if (password_value != password_confirmation_value) {
    this.classList.remove('bg-success')
    this.classList.add('bg-danger')
  } else {
    this.classList.remove('bg-danger')
    this.classList.add('bg-success')
  }
}
