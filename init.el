;; Make sure encodings are correct
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; Backup files are annoying
(setq backup-directory-alist `(("." . "~/.saves")))

;; TABS SUCK
(setq-default indent-tabs-mode nil)

;; Remove extraneous UI elements
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(defun require-package (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg))
  (require pkg))

;;  fix the PATH variable
 (defun set-exec-path-from-shell-PATH ()
   (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
       (setenv "PATH" path-from-shell)
           (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; list the repositories containing them
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(setq dotfile-dir (file-name-directory
		   (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfile-dir "ed"))

;; list the packages you want
(setq ed-package-full
			'(ed-evil
				ed-magit
        ed-powerline
				ed-theme
				ed-projectile
				ed-ido
				ed-ruby
        ed-java))

(dolist (file ed-package-full)
  (require file))
