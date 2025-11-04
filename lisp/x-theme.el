;;; -*- lexical-binding: t no-byte-compile: t -*-


(package-install 'spacemacs-theme)
(eval-after-load 'spacemacs-theme (progn (load-theme 'spacemacs-dark t)))

(package-install 'spaceline)
(eval-after-load 'spaceline
  (progn
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (spaceline-toggle-line-column-on)
    (spaceline-toggle-line-on)
    (spaceline-info-mode)
  )
)


(provide 'x-theme)
