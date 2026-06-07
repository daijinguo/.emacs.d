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
    (load-theme 'doom-one t)  ;; doom-molokai doom-one doom-ayu-dark doom-molokai doom-vibrant
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

(set-face-attribute 'mode-line nil
  :background "#282c34"
  :foreground "#abb2bf"
  :box nil
  :height 1.05)

(setq mode-line-format
  '("%e"
    mode-line-buffer-identification
    "  "
    (:eval (format "L%l:C%c" (line-number-at-pos) (current-column)))
    "  "
    mode-line-modes
    "  "
    (:eval (if (buffer-modified-p) "●" ""))))


(provide 'x-theme)
