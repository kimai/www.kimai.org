/**
 * Price switch
 */

export default (() => {
  let switcherWrapper = document.querySelectorAll('.price-switch-wrapper')

  if (switcherWrapper.length <= 0) return

  for (let i = 0; i < switcherWrapper.length; i++) {
    let switcher = switcherWrapper[i].querySelector('[data-bs-toggle="price"]')

    switcher.addEventListener('change', (e) => {
      let checkbox = e.currentTarget.querySelector('input[type="checkbox"]'),
        monthlyPrice = e.currentTarget
          .closest('.price-switch-wrapper')
          .querySelectorAll('[data-monthly-price]'),
        annualPrice = e.currentTarget
          .closest('.price-switch-wrapper')
          .querySelectorAll('[data-annual-price]')

      for (let n = 0; n < monthlyPrice.length; n++) {
        if (checkbox.checked == true) {
          monthlyPrice[n].classList.add('d-none')
        } else {
          monthlyPrice[n].classList.remove('d-none')
        }
      }

      for (let m = 0; m < monthlyPrice.length; m++) {
        if (checkbox.checked == true) {
          annualPrice[m].classList.remove('d-none')
        } else {
          annualPrice[m].classList.add('d-none')
        }
      }
    })
  }
})()
