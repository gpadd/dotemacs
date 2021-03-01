;;; funct.el --- Summary
;;; Commentary:

;;; Code:
(defun font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun development-mode ()
  "Modes used for developers"
  (interactive)
  (company-mode t)
  (company-box-mode t)
  (lsp t))

;;; funct.el ends here
