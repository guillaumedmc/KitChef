import "bootstrap";
import { calendar } from '../components/calendar';
import { price } from '../components/price';


if (document.querySelector("grid-calendar")) {
  calendar();
}

if (document.getElementById("show-page")) {
  price();
}
