;;; addutils.el --- a collection of add's utils -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Andreas (add) Wilfer

;; Author: Andreas Wilfer <andreas@wilfer.se>
;; Keywords: lisp goto relative
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is just my alternative to the goto-line function that I somehow
;; can't get to work with relative numbers, but welp..

;;; Code:

(defun addutils-goto-line-relative (arg)
  "Go to a line relative to where the curor is."
  (interactive "NGoto relative line: ")
  (forward-line arg))

(provide 'addutils)
;;; addutils.el ends here
