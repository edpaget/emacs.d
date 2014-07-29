;; Ruby mode and customizations

(require-package 'rvm)

(add-hook 'ruby-mode-hook 'rvm-activate-corresponding-ruby)
(setenv "JRUBY_OPTS" "--2.0")

(require-package 'rinari)

(add-hook 'ruby-mode-hook
          (lambda ()
            (defadvice ruby-mode-set-encoding
              (around ruby-mode-set-encoding-disable activate) nil)))

(require-package 'rspec-mode)
(add-hook 'ruby-mode-hook 'rspec-mode)

(evil-leader/set-key-for-mode 'ruby-mode
  "v" 'rspec-verify
  "a" 'rspec-verify-all
  "s" 'rspec-toggle-spec-and-target
  "i" 'rspec-rerun
  "m" 'rspec-verify-matching
  "c" 'rspec-verify-continue)

(provide 'ed-ruby)
