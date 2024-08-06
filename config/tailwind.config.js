const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./node_modules/flowbite/**/*.js",
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  safelist: [
    'datatable-header',
    'datatable-body',
    // Adicione outras classes específicas que você usa
  ],
  theme: {
    extend: {
      colors: {
        'purple': {
          100: '#f5e3e3',
          200: '#e3b6b6',
          300: '#d08787',
          400: '#b84f4f',
          500: '#a62a2a',
          600: '#8a1d1d',
          700: '#6e1414',
          800: '#541010',
          900: '#3e0a0a',
        },
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("flowbite/plugin")({
      charts: true,
    }),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
