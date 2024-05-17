{{flutter_js}}
{{flutter_build_config}}

const splash = document.createElement('div');
document.body.appendChild(splash);

splash.className = 'splash';
splash.innerHTML = `<svg width="100" height="157.29" viewBox="0 0 377 593" fill="none" xmlns="http://www.w3.org/2000/svg" id="lines">
<path d="M5 374.5C5 374.5 5 274.546 5 210.5M182 374.5V210.5M182 374.5C182 374.5 314 402 349 374.5C384 347 373.5 230.001 349 210.5C324.5 191 247.218 172.06 182 210.5M182 374.5C182 374.5 190.5 532 158 590.5M182 374.5C238.283 453.954 273.645 494.598 349 554.5M182 210.5V46.5002C108.536 -5.86366 69.4908 -9.38475 5 46.5002C5 46.5002 5 146.454 5 210.5M182 210.5C112.877 239.302 74.1227 234.843 5 210.5" stroke="#ffafaf" stroke-width="20"/>
</svg>`;

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();
  }
});
