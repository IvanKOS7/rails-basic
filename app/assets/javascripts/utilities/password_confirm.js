

document.addEventListener('turbolinks:load', function() {
  var passwordFields = document.querySelector('.confirm_checker')
  if (passwordFields) { passwordFields.addEventListener('input', compareInput) }
})


function compareInput() {

  var userPasswordContainer = document.querySelector('.user_password')
  var userPasswordContainerConfirmation = document.querySelector('.user_password_confirmation')
  var userPassword = userPasswordContainer.querySelector('#user_password')
  var userPasswordConfirmation = document.querySelector('#user_password_confirmation')

  if (userPasswordConfirmation.value) {
    if (userPassword.value === userPasswordConfirmation.value) {
      userPasswordContainer.querySelector('.text-success').classList.remove('hide')
      userPasswordContainerConfirmation.querySelector('.text-success').classList.remove('hide')
      userPasswordContainer.querySelector('.text-danger').classList.add('hide')
      userPasswordContainerConfirmation.querySelector('.text-danger').classList.add('hide')
    } else {
      userPasswordContainer.querySelector('.text-danger').classList.remove('hide')
      userPasswordContainerConfirmation.querySelector('.text-danger').classList.remove('hide')
      userPasswordContainer.querySelector('.text-success').classList.add('hide')
      userPasswordContainerConfirmation.querySelector('.text-success').classList.add('hide')
    }

  } else {
    userPasswordContainer.querySelector('.text-danger').classList.add('hide')
    userPasswordContainerConfirmation.querySelector('.text-danger').classList.add('hide')
    userPasswordContainer.querySelector('.text-success').classList.add('hide')
    userPasswordContainerConfirmation.querySelector('.text-success').classList.add('hide')
  }






}
