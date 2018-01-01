;;; errors.el --- Summary
;;; Commentary:

;;; Code:
(require 'compile)

;; ** cc65 and ca65 errors **
(pushnew '("^\\([^ \n(]+\\)(\\([0-9]+\\)): \\(?:Error\\|Warnin\\(g\\)\\):" 1 2 nil (3))
	 compilation-error-regexp-alist)

;;; errors.el ends here
