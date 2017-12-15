;;; cstyle.el --- Summary
;;; Commentary:

;;; Code:
(c-add-style "vsxu-style"
	     '("linux"
	       (indent-tabs-mode . nil)
	       (c-basic-offset . 2)
	       (tab-width . 2)
	       (c-offsets-alist . ((substatement-open . 0)
				   (inline-open . 0)
				   (brace-list-open . 0)
				   (block-open . 0)
				   (brace-list-open . +)
				   (statement-case-open . 0)
				   (case-label . 0)))))

(c-add-style "entropy-crush"
	     '("linux-tabs-only"
	       (indent-tabs-mode . t)
	       (c-basic-offset . 4)
	       (tab-width . 4)
	       (c-offsets-alist . ((substatement-open . 0)
				   (inline-open . 0)
				   (brace-list-open . 0)
				   (block-open . 0)
				   (brace-list-open . +)
				   (statement-case-open . +)
				   (case-label . 0)))))
;;; cstyle.el ends here
