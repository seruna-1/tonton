# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "default", to: "default.js"
pin "enumerate_titles", to: "enumerate_titles.js"

pin "codemirror" # @6.0.2
pin "@codemirror/autocomplete", to: "@codemirror--autocomplete.js" # @6.18.7
pin "@codemirror/commands", to: "@codemirror--commands.js" # @6.8.1
pin "@codemirror/language", to: "@codemirror--language.js" # @6.11.3
pin "@codemirror/lint", to: "@codemirror--lint.js" # @6.8.5
pin "@codemirror/search", to: "@codemirror--search.js" # @6.5.11
pin "@codemirror/state", to: "@codemirror--state.js" # @6.5.2
pin "@codemirror/view", to: "@codemirror--view.js" # @6.38.2
pin "@lezer/common", to: "@lezer--common.js" # @1.2.3
pin "@lezer/highlight", to: "@lezer--highlight.js" # @1.2.1
pin "@marijn/find-cluster-break", to: "@marijn--find-cluster-break.js" # @1.0.2
pin "crelt" # @1.0.6
pin "style-mod" # @4.1.2
pin "w3c-keyname" # @2.2.8
