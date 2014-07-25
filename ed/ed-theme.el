;; Theme settings

(require-package 'solarized-theme)

(load-theme 'solarized-light t)
(set-default-font "Monospace-9")

; General UI stuff
(global-linum-mode t)
(global-hl-line-mode t)
(setq default-tab-width 2)
(setq inhibit-startup-message t)
(setq visible-bell 'top-bottom)
(setq x-underline-at-descent-line t)
(unless (display-graphic-p) (menu-bar-mode -1))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; Automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'ed-theme)
