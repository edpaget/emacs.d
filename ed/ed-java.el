;; Java Configuration

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))

(semantic-mode 1)
(require-package 'malabar-mode)
(setq malabar-groovy-lib-dir "/path/to/malabar/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(evil-leader/set-key-for-mode 'malabar-mode
  "c" 'malabar-compile-file
  "e" 'malabar-extend-class
  "i" 'malabar-implement-interface
  "z" 'malabar-import-all
  "v" 'malabar-run-test
  "a" 'malabar-run-all-tests)

(provide 'ed-java)
