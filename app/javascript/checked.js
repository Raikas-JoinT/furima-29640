function price(){
  const priceInput = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    priceInput.addEventListener('keyup', () => {
        const value = priceInput.value;

    if (value >= 300 && value <= 9999999){
        let fee = value * 0.1
        let new_fee = Math.ceil(fee)
        let gains = value - fee
        let new_gains = Math.ceil(gains)
        add_tax.textContent = new_fee.toLocaleString();
        profit.textContent = new_gains.toLocaleString();
    } else {
      let fee = '---';
      let gains = '---';
      add_tax.textContent = fee;
      profit.textContent = gains;
    }
  });
}
window.addEventListener('load', price);