;;; plist-mode.el --- Major mode for Old-Style Property List files

;; Copyright (C) 2019 Eddie Hillenbrand

;; This file is NOT part of GNU Emacs.

;; This program is actual free software; it uses the permisive MIT
;; license NOT the GPL crap license.


;;; Commentary:

;; forthcoming...


;;; Code:

(require 'cc-mode')

(defgroup plist nil
  "Major mode for editing Old-Style NeXT/OpenStep Property List files."
  :prefix "plist-"
  :group 'plist
  :link '(url-link "https://github.com/eddieh/plist-mode"))

;;;###autoload
(define-derived-mode plist-mode prog-mode "Plist"
  "Major mode for editing Caddy configuration files."

  (setq-local comment-start "/\\*")
  (setq-local comment-start-skip "\\(//+\\|/\\*+\\)\\s *")
  (setq-local comment-end "\\*/")
  (setq-local comment-column 0)
  ;; (setq-local comment-use-syntax t)

  ;; for filling, pretend we're cc-mode
  (setq c-comment-prefix-regexp "//+\\|\\**"
        c-paragraph-start "\\(@[[:alpha:]]+\\>\\|$\\)"
        c-paragraph-separate "$"
        c-block-comment-prefix "* "
        c-line-comment-starter "//"
        c-comment-start-regexp "/[*/]\\|\\s!"
        comment-start-skip "\\(//+\\|/\\*+\\)\\s *")
  (setq-local comment-line-break-function #'c-indent-new-comment-line)
  (setq-local c-block-comment-start-regexp "/\\*")
  (setq-local comment-multi-line t)

  ;; (setq-local font-lock-defaults '(plist-mode-font-lock-keywords))

  (setq-local tab-width 8)
  (setq-local indent-tabs-mode t)
  ;; (setq-local indent-line-function 'plist--indent-line)
  )

(provide 'plist-mode)

;;; plist-mode.el ends here
