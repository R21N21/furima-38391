function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1))
  })
 };
 
 window.addEventListener('load', price);
 