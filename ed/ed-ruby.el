;; Ruby mode and customizations

(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line)) 

(require-package 'rvm)
(require-package 'rinari)
(require-package 'rspec-mode)
(require-package 'enh-ruby-mode)
(require-package 'ruby-electric)
(setenv "JRUBY_OPTS" "--2.0")

(add-hook 'enh-ruby-mode-hook 'rvm-activate-corresponding-ruby)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-electric-mode)

(evil-leader/set-key-for-mode 'enh-ruby-mode
  "v" 'rspec-verify
  "a" 'rspec-verify-all
  "s" 'rspec-toggle-spec-and-target
  "i" 'rspec-rerun
  "m" 'rspec-verify-matching
  "c" 'rspec-verify-continue)

(evil-define-key 'insert enh-ruby-mode-map (kbd "RET") 'evil-ret-and-indent)

(provide 'ed-ruby)
