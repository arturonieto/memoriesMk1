# Pin npm packages by running ./bin/importmap

pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"
pin "application"
pin_all_from 'app/javascript/controllers', under: 'controllers', to: 'controllers'
