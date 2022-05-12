function price(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input', function(){
    const priceValue = price.value;
    tax.innerHTML = Math.floor( priceValue * 0.1 )
    profit.innerHTML = Math.floor( priceValue - tax.innerHTML )
  });
  };

window.addEventListener( 'load', price )