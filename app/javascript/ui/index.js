const ui = require.context('.', true, /_ui\.js$/)
ui.keys().forEach(ui)