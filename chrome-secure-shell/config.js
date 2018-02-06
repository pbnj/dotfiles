// documentation: https://chromium.googlesource.com/apps/libapps/+/nassh-0.8.42/nassh/doc/FAQ.md

// set preference
// term_.prefs_.set('pref-name', 'pref-value')

// get preference
// term_.prefs_.get('pref-name')

// reset preference
// term_.prefs_.reset('pref-name')

// factory reset
// localStorage.clear()

// Use this for Solarized Dark
term_.prefs_.set('background-color', '#002b36')
term_.prefs_.set('foreground-color', '#839496')

term_.prefs_.set('color-palette-overrides', [
  '#073642',
  '#dc322f',
  '#859900',
  '#b58900',
  '#268bd2',
  '#d33682',
  '#2aa198',
  '#eee8d5',
  '#002b36',
  '#cb4b16',
  '#586e75',
  '#657b83',
  '#839496',
  '#6c71c4',
  '#93a1a1',
  '#fdf6e3',
])

// Fonts
term_.prefs_.set(
  'font-family',
  `Monoid, 'Fira Code', 'DejaVu Sans Mono', 'Everson Mono', FreeMono, 'Menlo', 'Terminal', monospace`
)

term_.prefs_.set('font-size', 13)

term_.prefs_.set(
  'user-css-text',
  `
/* Import FiraCode */
@import url(https://cdn.rawgit.com/tonsky/FiraCode/1.204/distr/fira_code.css);

/* Import Monoisome */
@font-face {
    font-family: "Monoisome";
    src: url("https://cdn.rawgit.com/larsenwork/monoid/0.61/Monoisome/Monoisome-Regular.ttf") format("truetype");
}

/* Import Monoid */
@font-face {
    font-family: "Monoid";
    src: url("https://larsenwork.com/monoid/css/Monoid-Regular.woff2") format("woff2");
}

/* Uncomment to enable ligatures */
/*
x-row {
  text-rendering: optimizeLegibility;
  font-variant-ligatures: normal;
}
*/
`
)

term_.prefs_.set('enable-bold', true)
term_.prefs_.set('enable-bold-as-bright', false)
term_.prefs_.set('font-smoothing', 'subpixel-antialiased')
term_.prefs_.set('alt-is-meta', true)
term_.prefs_.set('scrollbar-visible', false)
term_.prefs_.set('scroll-wheel-move-multiplier', '0')
