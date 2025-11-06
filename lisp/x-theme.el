;;; -*- lexical-binding: t no-byte-compile: t -*-


;; --------------------------------------------------
;; theme - 1
;;(package-install 'spacemacs-theme)
;;(eval-after-load 'spacemacs-theme (progn (load-theme 'spacemacs-dark t)))

;; theme - 2
;;(use-package dracula-theme
;;  :ensure t
;;  :config (load-theme 'dracula t))

;; theme - 3
;;(use-package nord-theme
;;  :ensure t
;;  :config (load-theme 'nord t))

;; theme - 4
;;(use-package solarized-theme
;;  :ensure t
;;  :config (load-theme 'solarized-dark t))


;;
;; --------------------------------------------------
;; theme - doom-themes

(use-package all-the-icons :ensure t)

(use-package doom-themes
  :ensure t
  :init
    (setq doom-themes-load-themes t)
  :config
    (load-theme 'doom-molokai t)  ;; doom-molokai  doom-vibrant
)

(doom-themes-visual-bell-config)
(doom-themes-org-config)
(doom-themes-neotree-config)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-one-brighter-modeline t
      doom-one-brighter-comments t
      doom-themes-neotree-file-icons t)
(when (featurep 'treemacs)
      (doom-themes-treemacs-config))

;;
;; --------------------------------------------------
;; mode line

(use-package spaceline
  :ensure t
  :config
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (spaceline-toggle-line-column-on)
    (spaceline-toggle-line-on)
    (spaceline-info-mode)
    (setq spaceline-left
          '((evil-state :face highlight)
            (buffer-modified)
            (buffer-name :face spaceline-buffer-name-face)
            (major-mode)
            (lsp-status :when active)
            ))
    (setq spaceline-right
          '((flycheck-status :when active)
            (version-control :when active)
            (org-clock :when active)
            (line-column :face highlight)
            (buffer-position :face highlight)
            (buffer-encoding)
            ))
    (setq spaceline-center '()
          spaceline-height 24
          spaceline-separator " "
          spaceline-flycheck-bullet "⦿ ")
    (custom-set-faces
      '(spaceline-face ((t (:background "#282c34" :foreground "#abb2bf"))))
      '(spaceline-highlight-face ((t (:background "#3f444a" :foreground "#e06c75"))))
      '(spaceline-buffer-name-face ((t (:foreground "#82aaff" :bold t))))
      '(spaceline-vc-face ((t (:foreground "#c3e88d"))))
    )
)




(provide 'x-theme)
