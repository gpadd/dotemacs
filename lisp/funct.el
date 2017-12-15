;;; funct.el --- Summary
;;; Commentary:

;;; Code:
(defun font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

;;; funct.el ends here
