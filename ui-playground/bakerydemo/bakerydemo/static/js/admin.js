const themeTester = () => {
  const styles = document.createElement('style');
  const details = document.createElement('details');
  const summary = document.createElement('summary');
  const pre = document.createElement('pre');
  summary.innerHTML = '⚙️ CSS';
  summary.style.textDecoration = 'underline';
  details.appendChild(summary);
  details.appendChild(styles);
  details.appendChild(pre);
  const note = document.createTextNode('Avoid copy-pasting in here, it will break the styles');
  pre.appendChild(note);
  pre.appendChild(styles);
  styles.contentEditable = true;
  styles.style.display = 'block';
  styles.style.backgroundColor = '#ddd';
  styles.style.color = '#333';
  document.querySelector('.content').appendChild(details);
  styles.addEventListener("input", () => {
      sessionStorage.setItem("wagtailcss", styles.innerHTML || '/* Add styles here */');
  });
  styles.innerHTML = sessionStorage.getItem("wagtailcss") || `:root {
      /* Default */
--w-color-black: hsl(0 0% 0%);
--w-color-grey-600: hsl(0 0% 14.9%);
--w-color-grey-400: hsl(0 0% 36.1%);
--w-color-grey-200: hsl(0 0% 57.3%);
--w-color-grey-150: hsl(0 0% 78.4%);
--w-color-grey-100: hsl(0 0% 87.8%);
--w-color-grey-50: hsl(240 12.5% 96.9%);
--w-color-white: hsl(0 0% 100%);
--w-color-primary: hsl(254.3 50.4% 24.5%);
--w-color-primary-200: hsl(253.8 50% 20.4%);
--w-color-secondary: hsl(181.7 100% 13.5%);
--w-color-secondary-600: hsl(181.9 100% 18.4%);
--w-color-secondary-400: hsl(180.5 100% 24.7%);
--w-color-secondary-100: hsl(180.3 100% 34.7%);
--w-color-secondary-75: hsl(180.7 53% 67.5%);
--w-color-secondary-50: hsl(180 62.5% 96.9%);
--w-color-info-100: hsl(193.7 66.5% 36.3%);
--w-color-info-50: hsl(196.2 81.3% 93.7%);
--w-color-positive-100: hsl(162.1 66.5% 31.6%);
--w-color-positive-50: hsl(164.4 77.1% 93.1%);
--w-color-warning-100: hsl(39.6 100% 49%);
--w-color-warning-50: hsl(37.3 78.7% 90.8%);
--w-color-critical-200: hsl(0 57.8% 53.5%);
--w-color-critical-100: hsl(354.9 97.6% 66.7%);
--w-color-critical-50: hsl(0 83.3% 95.3%);

/* Dark theme - default reversed */

--w-color-black: hsl(0 0% calc(100% - 0%));
--w-color-grey-600: hsl(0 0% calc(100% - 14.9%));
--w-color-grey-400: hsl(0 0% calc(100% - 36.1%));
--w-color-grey-200: hsl(0 0% calc(100% - 57.3%));
--w-color-grey-150: hsl(0 0% calc(100% - 78.4%));
--w-color-grey-100: hsl(0 0% calc(100% - 87.8%));
--w-color-grey-50: hsl(240 12.5% calc(100% - 96.9%));
--w-color-white: hsl(0 0% calc(100% - 100%));
--w-color-primary: hsl(254.3 50.4% calc(100% - 24.5%));
--w-color-primary-200: hsl(253.8 50% calc(100% - 20.4%));
--w-color-secondary: hsl(181.7 100% calc(100% - 13.5%));
--w-color-secondary-600: hsl(181.9 100% calc(100% - 18.4%));
--w-color-secondary-400: hsl(180.5 100% calc(100% - 24.7%));
--w-color-secondary-100: hsl(180.3 100% calc(100% - 34.7%));
--w-color-secondary-75: hsl(180.7 53% calc(100% - 67.5%));
--w-color-secondary-50: hsl(180 62.5% calc(100% - 96.9%));
--w-color-info-100: hsl(193.7 66.5% calc(100% - 36.3%));
--w-color-info-50: hsl(196.2 81.3% calc(100% - 93.7%));
--w-color-positive-100: hsl(162.1 66.5% calc(100% - 31.6%));
--w-color-positive-50: hsl(164.4 77.1% calc(100% - 93.1%));
--w-color-warning-100: hsl(39.6 calc(100% - 100% 49%));
--w-color-warning-50: hsl(37.3 78.7% calc(100% - 90.8%));
--w-color-critical-200: hsl(0 57.8% calc(100% - 53.5%));
--w-color-critical-100: hsl(354.9 97.6% calc(100% - 66.7%));
--w-color-critical-50: hsl(0 83.3% calc(100% - 95.3%));
  }`;
};

const iconsTester = () => {
  const icons = document.createElement('textarea');
  const details = document.createElement('details');
  const summary = document.createElement('summary');
  const pre = document.createElement('pre');
  summary.innerHTML = '⚙️ Icons';
  summary.style.textDecoration = 'underline';
  details.appendChild(summary);
  details.appendChild(icons);
  details.appendChild(pre);
  const note = document.createTextNode('');
  pre.appendChild(note);
  pre.appendChild(icons);
  icons.style.backgroundColor = '#ddd';
  icons.style.color = '#333';
  icons.style.resize = 'both';
  icons.style.minHeight = '300px';
  icons.style.maxWidth = '60vw';
  document.querySelector('.content').appendChild(details);
  const savedIcons = sessionStorage.getItem("wagtailicons");
  const sprite = document.querySelector('[data-sprite] svg defs');
  const originalIcons = sprite.innerHTML;
  icons.value = savedIcons;
  if (savedIcons) {
    sprite.innerHTML = savedIcons + originalIcons;
  }
  icons.addEventListener("change", () => {
      const value = icons.value
        .replaceAll('<svg', '<symbol')
        .replaceAll('</svg>', '</symbol>')
        .replaceAll('xmlns="http://www.w3.org/2000/svg"', '')
        .replaceAll('<!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->', '')
        .replaceAll('<!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->', '');
      sessionStorage.setItem("wagtailicons", value);
      sprite.innerHTML = value + originalIcons;
  });
};

const iconsViewer = () => {
  const sprite = document.querySelector('[data-sprite] svg defs');
  const symbols = Array.from(sprite.querySelectorAll('symbol'));
  const icons = symbols.map((elt) => elt.id.replace('icon-', ''));
  const details = document.createElement('details');
  const summary = document.createElement('summary');
  const container = document.createElement('div');
  summary.innerHTML = '⚙️ Icons viewer';
  summary.style.textDecoration = 'underline';
  details.appendChild(summary);
  details.appendChild(container);
  const h = window.React.createElement;
  window.ReactDOM.render(h('table', {className: 'table'}, h('tbody', {}, icons.map((icon) => h('tr', {}, h('td', {}, h(window.wagtail.components.Icon, {name: icon, className: 'initial'}), h('code', {}, icon)))))), container);
  document.querySelector('.content').appendChild(details);
};

document.addEventListener('DOMContentLoaded', () => {
  themeTester();
  iconsTester();
  iconsViewer();
});
