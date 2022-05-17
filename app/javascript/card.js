function pay(){
  Payjp.setPublicKey("pk_test_146c5c29d33ce21fd163b919");
  const submit = document.getElementById("button");
  
  submit.addEventListener("click", function(e){
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("buyer_order[card]"),
      exp_month: formData.get("buyer_order[card_exp_month]"),
      exp_year: `20${formData.get("buyer_order[card_exp_year]")}`,
      cvc: formData.get("buyer_order[card_cvc]")
    };

    Payjp.createToken(card, function(status, response){
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);