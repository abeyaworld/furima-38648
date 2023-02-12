const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  console.log(process.env.PAYJP_PUBLIC_KEY)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber')
  const expiryElement = elements.create('cardExpiry')
  const cvcElement = elements.create('cardCvc')
  
  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(expiryElement).then((response) => {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);