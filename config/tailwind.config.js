/** @type {import('tailwindcss').Config} */
const defaultTheme = require('tailwindcss/defaultTheme');
module.exports = {
  mode: 'jit',
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      fontFamily: {
        montserrat: ['Montserrat', ...defaultTheme.fontFamily.sans],
        sans: ['Poppins', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        bdgt: {
          DEFAULT: '#3778c2',
          green: '#5fb523',
          secondary: '#020024',
          danger: '#ff0000',
          white: '#ffffff',
          Text: '#434b54',
          TextLight: '#666666',
          borderLight: '#FAF7F7',
        },
      },
      keyframes: {
        bounce_to_right: {
          '0%, 100%': {
            transform: 'translateX(0)',
            animationTimingFunction: 'cubic-bezier(0.8, 0, 1, 1)',
          },
          '50%': {
            transform: 'translateX(10px)',
            animationTimingFunction: 'cubic-bezier(0, 0, 0.2, 1)',
          },
        }
      },
    },
  },
  plugins: [],
}