
document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  // NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows =[]
  //select all table rows >> sortedRows
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')

  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')

  }
  //почему-то стили не грузятся, либо грузятся но пропадает иконка
  //var sortedTable = document.createElement('table')
  //var tableClasses = table.classList
  //tableClasses.forEach(element => sortedTable.classList.add(element))
  //table.appendChild(rows[0])
  //так тоже работает
  for (var i = 1; i < sortedRows.length; i++) {
    //table.appendChild(sortedRows[i])
    table.append(sortedRows[i])
  }
  //table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
