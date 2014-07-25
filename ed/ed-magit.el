;;; git integration

(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'ed-magit)
