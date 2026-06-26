/**
 * Content carousel with extensive options to control behaviour and appearance
 * @requires https://github.com/nolimits4web/swiper
 */

import Swiper from 'swiper/bundle';

export default (() => {
  // forEach function
  let forEach = (array, callback, scope) => {
    for (let i = 0; i < array.length; i++) {
      callback.call(scope, i, array[i]); // passes back stuff we need
    }
  }

  // Carousel initialisation
  let carousels = document.querySelectorAll('.swiper')
  forEach(carousels, (index, value) => {
    let userOptions, pagerOptions;
    if (value.dataset.swiperOptions != undefined) {
        userOptions = JSON.parse(value.dataset.swiperOptions);
    }

    // Pager
    if (userOptions.pager) {
      pagerOptions = {
        modules: [ Navigation, Pagination ],
        pagination: {
          el: '.pagination .list-unstyled',
          clickable: true,
          bulletActiveClass: 'active',
          bulletClass: 'page-item',
          renderBullet: function (index, className) {
            return (
              '<li class="' +
              className +
              '"><a href="#" class="page-link btn-icon btn-sm">' +
              (index + 1) +
              '</a></li>'
            )
          },
        },
      }
    }

    // Slider init
    const options = { ...userOptions, ...pagerOptions }
    const swiper = new Swiper(value, options) // eslint-disable-line no-undef
    // Tabs (linked content)
    if (userOptions.tabs) {
      swiper.on('activeIndexChange', (e) => {
        let targetTab = document.querySelector(
            e.slides[e.activeIndex].dataset.swiperTab
          ),
          previousTab = document.querySelector(
            e.slides[e.previousIndex].dataset.swiperTab
          )

        previousTab.classList.remove('active');
        targetTab.classList.add('active');
      })
    }
  })
})()
