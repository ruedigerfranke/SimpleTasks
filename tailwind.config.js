module.exports = {
  mode: 'jit',
  purge: {
    content: [
      './app/views/**/*.html.erb',
      './app/helpers/**/*.rb',
      './javascript/**/*.js',
    ],
    safelist: ['input-error', 'text-red-400'],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [require('daisyui')],
}
