;;; addfunc.el --- Summary
;;; Commentary:

;;; Code:
(defun font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(c-add-style "vsxu-style"
	     '("bsd"
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



(c-add-style "cpp-style"
	     '("stroustrup"
	       (indent-tabs-mode . t)
	       (c-basic-offset . 8)
	       (tab-width . 8)
	       (c-offsets-alist . ((substatement-open . 0)
				   (inline-open . 0)
				   (brace-list-open . 0)
				   (block-open . 0)
				   (brace-list-open . +)
				   (statement-case-open . +)
				   (case-label . 0)))))

(c-add-style "entropy-crush"
	     '("linux"
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

;;; addfunc.el ends here
