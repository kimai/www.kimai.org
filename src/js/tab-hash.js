/**
 * Keep Bootstrap tabs in sync with the URL hash
 * - selecting a tab writes its anchor into the URL (without adding a history entry)
 * - loading a page with a hash opens the matching tab, or the tab containing the hash target
 * @requires https://getbootstrap.com
 */
import { Tab } from 'bootstrap';

export default (() => {
  const triggers = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tab"][href^="#"]')
  );

  if (triggers.length === 0) {
    return;
  }

  const elementFromHash = () => {
    const hash = window.location.hash;
    if (hash.length < 2) {
      return null;
    }
    return document.getElementById(decodeURIComponent(hash.substring(1)));
  }

  triggers.forEach((trigger) => {
    trigger.addEventListener('shown.bs.tab', (event) => {
      const href = event.target.getAttribute('href');
      const current = elementFromHash();
      // keep a deep link that already points into this pane (e.g. a heading inside it)
      if (current !== null && current.closest('.tab-pane') === document.querySelector(href)) {
        return;
      }
      history.replaceState(null, '', href);
    })
  })

  const openTabFromHash = () => {
    const target = elementFromHash();
    if (target === null) {
      return;
    }

    const pane = target.closest('.tab-pane')
    if (pane === null) {
      return;
    }

    const trigger = triggers.find((el) => el.getAttribute('href') === '#' + pane.id);
    if (trigger === undefined) {
      return;
    }

    if (pane !== target) {
      // the target lives inside a hidden pane, scroll to it once the pane is visible
      trigger.addEventListener('shown.bs.tab', () => target.scrollIntoView(), { once: true });
    }

    Tab.getOrCreateInstance(trigger).show();
  }

  openTabFromHash();
  window.addEventListener('hashchange', openTabFromHash);
})()
