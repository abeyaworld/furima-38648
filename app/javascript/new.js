window.addEventListener('input', () => {

  const inputForm = document.getElementById("item-price")
  const outputTax = document.getElementById("add-tax-price")
  const outputProfit = document.getElementById("profit")

  const inputPrice = inputForm.value
  outputTax.innerHTML = (Math.floor(inputPrice * 0.1))
  const Tax = inputPrice * 0.1
  outputProfit.innerHTML = (Math.floor(inputPrice - Tax))
})