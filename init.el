;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
			       ;; Restore after startup
			       (setq gc-cons-threshold 800000)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))
(load custom-file)

(load-theme 'wombat)

(setopt ring-bell-function 'ignore
	calendar-week-start-day 1
	backup-inhibited t
	inhibit-startup-screen t
	initial-scratch-message ";;; -*- lexical-binding: t; -*-\n\n"
	frame-inhibit-implied-resize t

	dired-vc-rename-file t

	tool-bar-mode nil
	scroll-bar-mode nil
	column-number-mode t
	show-paren-mode t
	;; tooltip-mode -1
	;; menu-bar-mode -1

	;; display-line-numbers-type 't
	display-line-numbers-type 'relative

	confirm-nonexistent-file-or-buffer nil)

(global-display-line-numbers-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(fset 'yes-or-no-p 'y-or-n-p)
(set-language-environment "UTF-8")

(global-set-key [f5] 'compile)
(global-set-key [f8] 'font-lock-mode)
(global-set-key [f9] 'recompile)
(global-set-key [f12] 'shell-command)

(use-package addutils
  :load-path "lisp/"
  :bind ("M-g M-g" . addutils-goto-line-relative))

(use-package forth-mode
  :load-path "lisp/"
  :commands forth-mode)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy))
  (global-set-key "\C-cs" 'slime-selector))

(use-package paredit
  :ensure t
  :hook
  (scheme-mode . enable-paredit-mode)
  (emacs-lisp-mode . enable-paredit-mode)
  (lisp-mode . enable-paredit-mode))

(use-package rainbow-delimiters
  :ensure t
  :after paredit
  :hook
  (scheme-mode . rainbow-delimiters-mode)
  (emacs-lisp-mode . rainbow-delimiters-mode)
  (lisp-mode . rainbow-delimiters-mode)
  (lisp-interaction-mode . rainbow-delimiters-mode))

(use-package paren
  :ensure nil
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode 1))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  ;;(evil-mode)
  :config
  (evil-set-undo-system 'undo-redo))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))

(use-package evil-tutor
  :ensure t)

(add-to-list 'major-mode-remap-alist '(perl-mode . cperl-mode))
