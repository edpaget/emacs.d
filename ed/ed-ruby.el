;; Ruby mode and customizations

(require-package 'rvm)

(global-set-key (kbd "C-x r") 'rvm-activate-corresponding-ruby)

(require-package 'rinari)

(add-hook 'ruby-mode-hook
          (lambda ()
            (defadvice ruby-mode-set-encoding
              (around ruby-mode-set-encoding-disable activate) nil)))

(require-package 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require-package 'rspec-mode)

(provide 'ed-ruby)
