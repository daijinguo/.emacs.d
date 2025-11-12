;;; -*- lexical-binding: t no-byte-compile: t -*-

;; load the path for self config files
(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir)))

;;; Config the custom file
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'x-elpa)
(require 'x-basic)
(require 'x-display)
(require 'x-oskeys)
(require 'x-edit)
(require 'x-ibuffers)
(require 'x-treemacs)
(require 'x-theme)
(require 'x-program)



;; end if init.el
(provide 'init)
