;; evil-mode settings

(require-package 'evil)
(require-package 'evil-leader)

;; Making Emacs better
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "r" 'recentf-ido-find-file
  "," 'projectile-find-file
  "c" 'comment-or-uncomment-region
  "w" 'save-buffer
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(setq evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(evil-mode t)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
                           nil 0.5)))
      (cond
        ((null evt) (message ""))
        ((and (integerp evt) (char-equal evt ?j))
         (delete-char -1)
         (set-buffer-modified-p modified)
         (push 'escape unread-command-events))
        (t (setq unread-command-events (append unread-command-events
                                               (list evt))))))))

(define-key evil-insert-state-map "k" #'cofi/maybe-exit)

(provide 'ed-evil)
