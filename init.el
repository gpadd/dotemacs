(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
			       ;; Restore after startup
			       (setq gc-cons-threshold 800000)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))
(load custom-file)

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

;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(global-set-key [f5] 'compile)
(global-set-key [f9] 'recompile)
(global-set-key [f12] 'shell-command)

(use-package materiadd-theme
  :load-path "lisp/themes"
  :config
  (load-theme 'materiadd t)
  (with-eval-after-load 'faces
    (set-face-attribute 'default nil :stipple nil :inverse-video nil
			:family "JetBrains Mono" :box nil
			:strike-through nil :overline nil
			:underline nil :slant 'normal
			:weight 'normal :width 'normal
			:foundry "nil"))
  (with-eval-after-load 'faces
    (set-face-attribute 'mode-line-buffer-id nil :background 'unspecified)
    (set-face-attribute 'link nil :foreground 'unspecified)
    (set-face-attribute 'header-line nil :background 'unspecified)
    (set-face-attribute 'diff-header nil :background 'unspecified)
    (set-face-attribute 'diff-file-header nil :background 'unspecified)))

(use-package addutils
  :load-path "lisp/"
  :bind ("M-g M-g" . addutils-goto-line-relative))

(use-package forth-mode
  :load-path "site-lisp/"
  :commands forth-mode)

(use-package paredit
  :ensure t
  :hook
  (emacs-lisp-mode . enable-paredit-mode))

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
  ;;(evil-collection-init)
  )
(use-package evil-tutor
  :ensure t)

(add-to-list 'major-mode-remap-alist '(perl-mode . cperl-mode))
