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
(setq initial-scratch-message nil)
;;; Functions
(defun normalize-slashes (pathname)
  (replace-regexp-in-string "//"
			    "/"
			    (replace-regexp-in-string "\\\\"
						      "/"
						      pathname)))

(defun join-path (&rest args)
  ""
  (normalize-slashes
   (mapconcat 'identity args "/")))

(defun expand-site-lisp (dir)
  (let
      ((site-path (join-path emacs-root
			     "bin/emacs25.1/share/emacs/site-lisp"
			     dir))
       (local-path (join-path emacs-dot-d
			      "site-lisp"
			      dir)))
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

(defvar personal-lisp-configurations (join-path emacs-dot-d "lisp"))

;;; The rest
					; My config files
(add-to-list 'load-path (join-path personal-lisp-configurations))
(add-site-lisp-dir "z80")

(use-package "addfunc")
(use-package "addkeys")
(use-package "setup")
(use-package "customized"
  :init
  (setq custom-file (join-path personal-lisp-configurations
			       "customized.el"))
  :config
  (load custom-file))

;;(setq exec-path (append exec-path '("/home/add/.rbenv/bin")))


;;; init.el ends here
