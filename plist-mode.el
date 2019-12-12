;;; plist-mode.el --- Major mode for Old-Style Property List files

;; Copyright (C) 2019 Eddie Hillenbrand

;; Author: EddieHillenbrand
;; Keywords: extensions

;; This file is NOT part of GNU Emacs.
;; This program is actual free software; it uses the permisive MIT
;; license NOT the GPL crap license.


;;; Commentary:

;; forthcoming...


;;; Code:

(require 'cc-mode)

(defgroup plist nil
  "Major mode for editing Old-Style NeXT/OpenStep Property List files."
  :prefix "plist-"
  :group 'plist
  :link '(url-link "https://github.com/eddieh/plist-mode"))

(defvar plist-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?{ "(}" st)
    (modify-syntax-entry ?} "){" st)
    (modify-syntax-entry ?/ ".  14" st)
    (modify-syntax-entry ?* ".  23" st)
    st)
  "Syntax table for `plist-mode'.")

(defvar plist-mode-font-lock-defaults
  `((
     ("\"\\.\\*\\?" . font-lock-string-face))))

(defun plist-indent-line ()
  "Indent current line of Property List file."
  (interactive)
  (let ((savep (> (current-column) (current-indentation)))
	(indent (condition-case nil (max (plist-calculate-indentation) 0)
		  (error 0))))
    (if savep
	(save-excursion (indent-line-to indent))
      (indent-line-to indent))))

(defun plist-calculate-indentation ()
  "Return the column to which the current line should be indented."
  (* tab-width (min (car (syntax-ppss (line-beginning-position)))
		    (car (syntax-ppss (line-end-position))))))

;;;###autoload
(define-derived-mode plist-mode prog-mode "Plist"
  "Major mode for editing Old-Style NeXT/OpenStep Property List files."

  :syntax-table plist-mode-syntax-table

  (setq-local comment-start "/*")
  (setq-local comment-start-skip "\\(//+\\|/\\*+\\)\\s *")
  (setq-local comment-end "*/")
  (setq-local comment-use-syntax t)
  (setq-local comment-multi-line t)

  (setq-local font-lock-defaults '(plist-mode-font-lock-defaults))

  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil)
  (setq-local indent-line-function 'plist-indent-line))

(provide 'plist-mode)

;;; plist-mode.el ends here
