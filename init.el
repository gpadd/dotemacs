;;; init.el --- Summary:
;;; Commentary:

;;; Code:
(require 'cl)

(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

;;; Functions
(defun normalize-slashes (pathname)
  "Reverse Windows-backslashes to be Unix-slashes; Get rid of doubles"
  (replace-regexp-in-string "//" "/" (replace-regexp-in-string "\\\\" "/" pathname)))

(defun join-path (&rest args)
  ""
  (normalize-slashes
   (mapconcat 'identity args "/")))

(defun expand-site-lisp (dir)
  ""
  (let
      ((site-path (join-path emacs-root "bin/emacs25.1/share/emacs/site-lisp" dir))
       (local-path (join-path emacs-dot-d "site-lisp" dir)))
    (or
     (and (file-exists-p local-path) local-path)
     (and (file-exists-p site-path) site-path)
     (and t (error "site-lisp directory '%s' not found" dir)))))

(defun add-site-lisp-dir (dir)
  (add-to-list 'load-path (expand-site-lisp dir)))

;;; Variables
(defvar emacs-root
  (let ((candidates
	 (list (join-path (getenv "HOME") "emacs")
	       (getenv "HOME"))))
    (reduce (lambda (old-path new-path)
	      (or old-path
		  (and (file-exists-p (join-path new-path ".emacs.d"))
		       new-path)))
	    candidates
	    :initial-value nil))
  "Root folder for the emacs config")

(defvar emacs-dot-d (join-path emacs-root ".emacs.d"))

(setq windows-p (eq system-type 'windows-nt)
      linux-p (eq system-type 'gnu/linux))


;;; The rest
(add-to-list 'load-path (join-path emacs-dot-d "add")) ;; My config files
(add-site-lisp-dir "z80")

(use-package "addfunc")
(use-package "addkeys")
(use-package "setup")

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (column-enforce-mode flycheck-cask flycheck-pos-tip flycheck-color-mode-line slime zenburn-theme zenburn zen-mode zen-and-art-theme use-package s request paredit nasm-mode markdown-mode langdoc helm flycheck epc company-quickhelp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
