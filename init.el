;;; init.el --- Summary:
;;; Commentary:

;;; Code:
(require 'cl)

(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(eval-when-compile
  (defun normalize-slashes (pathname)
    (replace-regexp-in-string "//" "/"
			      (replace-regexp-in-string "\\\\" "/" pathname)))
  (defun join-path (&rest args)
    ""
    (normalize-slashes
     (mapconcat 'identity args "/")))

  (add-to-list 'load-path (join-path (getenv "HOME") ".emacs.d/site-lisp/use-package"))
  (require 'use-package))


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)
;;; Functions
(defun expand-site-lisp (dir)
  (let ((site-path (join-path emacs-root
			      "C:/Program Files/emacs-25.3/share/emacs/site-lisp"
			      dir))
	(local-path (join-path emacs-dot-d
			       "site-lisp"
			       dir)))
    (or
     (and (file-exists-p local-path) local-path)
     (and (file-exists-p site-path) site-path)
     (and t (error "Site-lisp directory '%s' not found" dir)))))

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
  "Root folder for the Emacs config.")

(defvar emacs-dot-d (join-path emacs-root ".emacs.d"))

(setq windows-p (eq system-type 'windows-nt)
      linux-p (eq system-type 'gnu/linux))

(defvar personal-lisp-configurations (join-path emacs-dot-d "lisp"))

(add-to-list 'load-path (join-path personal-lisp-configurations))
(add-site-lisp-dir "z80")

(use-package "funct")
(use-package "keys")
(use-package "cstyle")
(use-package "setup-packages")
(use-package "customized"
  :init
  (setq custom-file (join-path personal-lisp-configurations
			       "customized.el"))
  :config
  (load custom-file))

;;; init.el ends here
