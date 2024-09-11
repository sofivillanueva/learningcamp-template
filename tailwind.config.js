const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*.{erb,rb,haml,html,slim,css,js}'
  ],
  theme: {
    colors: {
      primary: colors.indigo,
      secondary: colors.yellow,
      neutral: colors.neutral,
      success: colors.green,
      error: colors.red,
      warning: colors.amber,
      info: colors.sky,
      white: colors.white
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
  ]
}
