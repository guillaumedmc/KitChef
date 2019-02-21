function calendar() {
  document.querySelectorAll(".grid-cell").forEach((element) => {
  element.addEventListener("click", (event) => {
    element.classList.add("calendar-select");
  });
});

}
export { calendar };
