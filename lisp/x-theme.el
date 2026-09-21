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
    ;; 终端模式 (-nw) 下继承终端自身的背景色，不强制覆盖背景。
    ;; 直接覆盖主题中 default face 的 spec，避免启动完成后
    ;; face-set-after-frame-default 用主题背景 #282c34 重新计算 face。
    (unless (display-graphic-p)
      (custom-theme-set-faces
       'doom-one
       `(default ((t (:background unspecified
                                  :foreground ,(face-attribute 'default :foreground))))))
      (when (frame-live-p (selected-frame))
        (set-frame-parameter (selected-frame) 'background-color 'unspecified)))
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
