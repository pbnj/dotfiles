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
  'user-css',
  'https://cdn.rawgit.com/petermbenjamin/dotfiles/fa36a079534d3adef07a0109426eeba32e5a5f7b/fonts/Fonts.css'
)

term_.prefs_.set(
  'user-css-text',
  `
/* Import FiraCode */
@import url(https://cdn.rawgit.com/tonsky/FiraCode/1.204/distr/fira_code.css);

/* Import Monoisome */
@font-face {
    font-family: "Monoisome";
    src: url("https://cdn.rawgit.com/petermbenjamin/dotfiles/fa36a079534d3adef07a0109426eeba32e5a5f7b/fonts/Monoid/Monoisome-Regular.ttf") format("truetype");
}

/* Import Monoid */
@font-face {
    font-family: "Monoid";
    src: url("hhttps://cdn.rawgit.com/petermbenjamin/dotfiles/fa36a079534d3adef07a0109426eeba32e5a5f7b/fonts/Monoid/Monoid-Regular.ttf") format("truetype");
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
term_.prefs_.set('alt-backspace-is-meta-backspace':  true)
term_.prefs_.set('alt-is-meta':  true)
term_.prefs_.set('environment', {
    NCURSES_NO_UTF8_ACS: "1",
    TERM: "xterm-256color",
    LANG: "en_US.UTF-8",
    LC_COLLATE: "en_US.UTF-8",
    LC_CTYPE: "en_US.UTF-8",
    LC_MESSAGES: "en_US.UTF-8",
    LC_MONETARY: "en_US.UTF-8",
    LC_NUMERIC: "en_US.UTF-8",
    LC_TIME: "en_US.UTF-8",
    LC_ALL: "en_US.UTF-8"
    })
