/**
 * Popover
 * @requires https://getbootstrap.com
 * @requires https://popper.js.org/
 */
import { Popover } from 'bootstrap';

export default (() => {
  const popoverTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="popover"]')
  )

  /* eslint-disable no-unused-vars, no-undef */
  const popoverList = popoverTriggerList.map(
    (popoverTriggerEl) => new Popover(popoverTriggerEl)
  )
  /* eslint-enable no-unused-vars, no-undef */
})()
