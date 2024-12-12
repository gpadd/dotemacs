(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
			       ;; Restore after startup
			       (setq gc-cons-threshold 800000)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))
(load custom-file)

(load-theme 'wombat t)

(setq calendar-week-start-day 1)
(setq backup-inhibited t)
(setq inhibit-startup-screen t
      initial-scratch-message ";;; -*- lexical-binding: t; -*-\n\n")
(setq frame-inhibit-implied-resize t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
;;(tooltip-mode -1)
;;(menu-bar-mode -1)

;;(setq display-line-numbers-type 't)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq confirm-nonexistent-file-or-buffer nil)
(fset 'yes-or-no-p 'y-or-n-p)
(set-language-environment "UTF-8")

(setq user-full-name "Andreas Wilfer"
      user-mail-address "andreas@wilfer.se")

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(use-package addutils
  :bind ("M-g M-g" . addutils-goto-line-relative))

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  ;;(evil-mode)
  :config
  (evil-set-undo-system 'undo-redo))
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  ;;(evil-collection-init)
  )
(use-package evil-tutor)

(global-set-key [f5] 'compile)
(global-set-key [f9] 'recompile)
(global-set-key [f12] 'shell-command)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(setq inferior-lisp-program "sbcl")

(use-package paredit
  :hook
  (emacs-lisp-mode . enable-paredit-mode)
  ;;(eval-expression-minibuffer-setup . enable-paredit-mode)
  ;;(ielm-mode . enable-paredit-mode)
  (lisp-mode . enable-paredit-mode)
  ;;(lisp-interaction-mode . enable-paredit-mode)
  :config
  (show-paren-mode t))

(add-to-list 'major-mode-remap-alist '(perl-mode . cperl-mode))
