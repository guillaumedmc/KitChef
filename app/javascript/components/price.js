function price() {
  const keyupSelect = document.getElementById("booking_number_of_covers")
  keyupSelect.addEventListener("keyup", (event) => {
    const numberOfCover = parseInt(document.getElementById("booking_number_of_covers").value);
    const prodPrice = parseInt(document.getElementById("prod-price").innerText);
    const dynamicPrice = document.querySelector("#dynamic-price"); // CSS id selector
    dynamicPrice.innerText = `Total: ${numberOfCover * prodPrice}€`;
  });
};

export { price };


