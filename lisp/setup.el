;;; setup.el --- Summary
;;; Commentary:
;;; Code:
;(use-package helm
;  :init
;  (require 'helm-config)
;  :bind (("M-x" . helm-M-x)
;         ("M-<f5>" . helm-find-files)
;         ([f10] . helm-buffers-list)))

(load-theme 'zenburn t)

(setq c-default-style "cpp-style")

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq browse-url-browser-function 'eww-browse-url)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq confirm-nonexistent-file-or-buffer nil)

(use-package ido-mode
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

(use-package lua-mode
  :config
  (setq lua-indent-level 2))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(use-package nasm-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))
  (add-hook 'asm-mode-hook 'font-lock-mode))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; (load "/home/add/quicklisp/clhs-use-local.el" t)

(use-package paredit
  :init
  (autoload 'enable-paredit-mode "paredit" "paredit" t)
  :config
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

(use-package column-number-mode
  :init
  (add-hook 'c-mode-hook 'column-enforce-mode))

;; z80 stuff
(use-package z80-mode
  :config
  (add-hook 'z80-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode t)
	      (electric-indent-mode -1)
	      (setq tab-stop-list (number-sequence 4 120 4)))))

;; (use-package pry
;;   :init
;;   :load-path "site-lisp/emacs-pry")

;; (use-package ruby-mode
;;   :mode "\\.rb\\'"
;;   :interpreter "ruby"
;;   :init
;;   (require 'rbenv)
;;   ;;(require 'pry)
;;   ;; :bind (("<f8>" . run-pry)
;;   ;; 	 ("C-<f9>" . pry-intercept)
;;   ;; 	 ("<f9>" . pry-intercept-rerun))
;;   :config
;;   (global-rbenv-mode))

(use-package c-mode
  :init
  (add-hook 'c-mode-hook 'company-mode))

(use-package c++-mode
  :init
  (add-hook 'c++-mode-hook 'company-mode))

(use-package evil
  :init
  (setq evil-search-module 'evil-search
	evil-want-C-u-scroll t
	evil-want-C-w-in-emacs-state t)
  :config
  (evil-mode 0))

(use-package company
  :config
  (setq company-backends (delete 'company-semantic company-backends))
  :bind (:map c-mode-map
	      ("C-x TAB" . company-complete)
	      :map c++-mode-map
	      ("C-x TAB" . company-complete)))
;;; setup.el ends here
