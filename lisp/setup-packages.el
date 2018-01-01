;;; setup-packages.el --- Summary
;;; Commentary:
;;; Code:
(load-theme 'wombat t)

(setq c-default-style "add")

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq browse-url-browser-function 'eww-browse-url)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq confirm-nonexistent-file-or-buffer nil)

(use-package ido
  :init
  (ido-mode 1)
  :config
  (setq ido-everywhere t
	ido-enable-flex-matching t
	ido-create-new-buffer 'always))

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

(use-package magit
  :ensure t)
(use-package paredit
  :ensure t
  :init
  (autoload 'enable-paredit-mode "paredit" nil t)
  :config
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; (use-package column-number-mode
;;   :init
;;   (add-hook 'c-mode-hook 'column-enforce-mode))

;; z80 stuff
(use-package z80-mode
  :config
  (add-hook 'z80-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode t)
	      (electric-indent-mode -1)
	      (setq tab-stop-list (number-sequence 4 120 4)))))


(setq initial-scratch-message nil)

;;; setup-packages.el ends here
