module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex'
  ],

  theme: {
    fontFamily: {},
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
  // ...
};