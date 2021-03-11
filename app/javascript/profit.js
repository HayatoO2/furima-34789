function post(){
  const price = document.getElementById('item-price')
  price.addEventListener('input',()=> {
    const tax = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');

    const inputValue = Math.floor(price.value * 0.1)

    const XHR = new XMLHttpRequest();
    price.textContent = XHR.responseText;

    XHR.open("GET", "/items/new", true);
    XHR.responseType = 'json';
    XHR.send(null);


    XHR.onload = () => {
      tax.innerHTML = inputValue;
      profit.innerHTML = price.value - inputValue;
    }


  });
}


window.addEventListener('load',post);