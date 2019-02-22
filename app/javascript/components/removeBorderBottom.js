const removeBorderBottom = () => {
  const meals = document.querySelectorAll('.message');
  if (meals) {
    meals[meals.length - 1].style.border = "none"
  }
}

export { removeBorderBottom };
