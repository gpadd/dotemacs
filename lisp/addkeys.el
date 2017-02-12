;;; addkeys.el --- Summary


(global-set-key (kbd "<f5>") (lambda ()
			       (interactive)
			       (call-interactively 'compile)))

(global-set-key (kbd "<f6>") (lambda ()
			       (interactive)
			       (call-interactively 'shell-command)))
(global-set-key (kbd "<f7>") (lambda ()
			       (interactive)
			       (call-interactively 'gdb)))

(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "C-x RET") 'shell)

(global-set-key (kbd "M-i") 'imenu)

(global-set-key (kbd "<f12>") 'slime-selector)

;;; addkeys.el ends here
