/**
 * Tooltip
 * @requires https://getbootstrap.com
 * @requires https://popper.js.org/
 */
import { Tooltip } from 'bootstrap';

export default (() => {
  const tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  )

  /* eslint-disable no-unused-vars, no-undef */
  const tooltipList = tooltipTriggerList.map(
    (tooltipTriggerEl) =>
      new Tooltip(tooltipTriggerEl, { trigger: 'hover' })
  )
  /* eslint-enable no-unused-vars, no-undef */
})()
