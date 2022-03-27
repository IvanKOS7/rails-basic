
// content_tag :div, class: 'progress-bar progress-bar-striped bg-warning',
//                   role="progressbar",
//                   style="width: 75%",
//                   aria-valuenow="75",
//                   aria-valuemin="0",
//                   aria-valuemax="100"

document.addEventListener('turbolinks:load', function(){
  const progressContainer = document.querySelector('.progress')
  if (progressContainer) {
    countProgress()
  }
})

function countProgress() {
  const progressBar = document.querySelector('.progress-bar')
  const questionsContainer = document.querySelector('.questions_counter')
  let questionsAmount = questionsContainer.dataset.questionsAmount
  let questionNumber = questionsContainer.dataset.questionNumber
  console.log(questionNumber)
  progressBar.setAttribute('style', `width: ${percent(questionNumber, questionsAmount)}%`)
  progressBar.textContent = `${percent(questionNumber, questionsAmount)}%`
}

function percent(arg1, arg2) {
  return (arg1/arg2) * 100
}
