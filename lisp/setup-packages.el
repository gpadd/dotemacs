;;; setup-packages.el --- Summary
;;; Commentary:
;;; Code:

(setq windows-p (eq system-type 'windows-nt)
      linux-p (eq system-type 'gnu/linux))

(load-theme 'wombat t)

(setq c-default-style "add")

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'c-mode-hook 'development-mode)


(setq browse-url-browser-function 'eww-browse-url)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

(setq confirm-nonexistent-file-or-buffer nil)

;; Disable middle-mouseclick yank
(global-set-key (kbd "<mouse-2>") nil)

;; (use-package ido
;;   :init
;;   (ido-mode 1)
;;   :config
;;   (setq ido-everywhere t
;; 	ido-enable-flex-matching t
;; 	ido-create-new-buffer 'always))

(use-package ivy
  :init
  (ivy-mode 1))

(use-package clang-format
  :bind ("C-c C-f" . clang-format-buffer)
  :bind ("C-c f" . clang-format-region))

;;; Use shift+directionkey to switch window
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq-default indent-tabs-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")


;; (use-package magit
;;   :ensure t)

;; (use-package geiser
;;   :config
;;   (when windows-p
;;     (setq scheme-program-name "C:\\Program Files\\Chez Scheme 9.5\\bin\\ta6nt\\scheme"))
;;   (when linux-p
;;     (setq scheme-program-name "chez")))

;; (add-to-list 'auto-mode-alist
;; 	     '("\\.sls\\'" . scheme-mode)
;;              '("\\.sc\\'" . scheme-mode))


(use-package paredit
  :ensure t
  :init
  (autoload 'enable-paredit-mode "paredit" nil t)
  :config
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode))

;; (use-package column-number-mode
;;   :init
;;   (add-hook 'c-mode-hook 'column-enforce-mode))

;; z80 stuff
;; (use-package z80-mode
;;   :config
;;   (add-hook 'z80-mode-hook
;; 	    (lambda ()
;; 	      (setq indent-tabs-mode t)
;; 	      (electric-indent-mode -1)
;; 	      (setq tab-stop-list (number-sequence 4 120 4)))))

(setq racket-program (when linux-p
		       "/home/add/bin/racket/bin/racket"))

(when windows-p
  (setenv "CHEZSCHEMELIBDIRS" "C:\\scheme\\lib;")
  (setenv "CHEZSCHEMELIBEXTS" ".sc;;.so;")

  (let ((putty-directory "C:/Program Files (x86)/PuTTY/"))
    (setq tramp-default-method "plink")
    (when (and (not (string-match putty-directory (getenv "PATH")))
	       (file-directory-p putty-directory))
      (setenv "PATH" (concat putty-directory ";" (getenv "PATH")))
      (add-to-list 'exec-path putty-directory))))


;;; setup-packages.el ends here
