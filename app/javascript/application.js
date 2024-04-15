// Entry point for the build script in your package.json
import '@hotwired/turbo-rails';
import './controllers';
import 'flowbite';
import 'flowbite/dist/flowbite.turbo.js';

addEventListener('turbo:before-frame-render', (event) => {
  if (document.startViewTransition) {
    const originalRender = event.detail.render;
    event.detail.render = (currentElement, newElement) => {
      document.startViewTransition(() => originalRender(currentElement, newElement));
    };
  }
});
