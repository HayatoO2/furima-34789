function post(){
  const price = document.getElementById('item-price');


  
  price.addEventListener('input',()=> {
    const tax = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');

    const inputValue = Math.floor(price.value * 0.1)

    

    
      tax.innerHTML = inputValue;
      profit.innerHTML = price.value - inputValue;
    


  });
};


window.addEventListener('load',post);