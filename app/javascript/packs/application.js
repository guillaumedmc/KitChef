import "bootstrap";
import { calendar } from '../components/calendar';
import { price } from '../components/price';
import { removeBorderBottom } from '../components/removeBorderBottom';
import '../plugins/flatpickr';


if (document.querySelector("grid-calendar")) {
  calendar();
}

if (document.getElementById("show-page")) {
  price();
}

if (document.querySelector('message')) {
  removeBorderBottom();
}
