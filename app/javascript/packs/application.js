import "bootstrap";
import { calendar } from '../components/calendar';
import { price } from '../components/price';
import '../plugins/flatpickr';


if (document.querySelector("grid-calendar")) {
  calendar();
}

if (document.getElementById("show-page")) {
  price();
}



const removeBorderBottom = () => {
  const meals = document.querySelectorAll('.message');
  if (meals) {
    meals[meals.length - 1].style.border = "none"
  }
}

removeBorderBottom()
