;;; -*- lexical-binding: t; no-byte-compile: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Startup Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Inhibit startup messages and buffer menu
(setq inhibit-startup-message t)
(setq inhibit-startup-buffer-menu t)

;; Disable tooltip mode if it's enabled
(when (bound-and-true-p tooltip-mode)
  (tooltip-mode -1))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Terminal and GUI Specific Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Terminal specific configurations
(unless (display-graphic-p)
  (when (>= emacs-major-version 24)
    (xterm-mouse-mode -1)
    (menu-bar-mode -1)))

;; GUI specific configurations
(when (display-graphic-p)
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq initial-frame-alist
        '((width . 200)
          (height . 40))))

;; set GUI fonts
(cond
  ;; macOS
  ((eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Reddit Mono-16.4")
    ;; (set-face-attribute 'default nil :font "CamingoCode-15")
    ;; (set-face-attribute 'default nil :font "IBM Plex Mono-15")
    ;; (set-face-attribute 'default nil :font "M PLUS 1 Code-16")
    ;; (set-face-attribute 'default nil :font "B612 Mono-15")
    ;; (set-face-attribute 'default nil :font "Code New Roman-15.6")
  )
  ;; Linux
  ((eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :font "Monospace-11")
  )
  ;; Windows
  ((eq system-type 'windows-nt)
    (set-face-attribute 'default nil :font "Consolas-11"))
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Frame Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set frame title to show buffer name
(setq-default frame-title-format "%b")

;; Enable pixelwise resize for windows and frames
(setq-default window-resize-pixelwise t)
(setq-default frame-resize-pixelwise t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line and Column Display
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable line numbers globally
(if (fboundp 'display-line-numbers-mode)
    (global-display-line-numbers-mode 1)
  (global-linum-mode 1))

;; Line number display settings
(setq display-line-numbers-type t)
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-widen t)

;; Line movement and navigation
(setq line-move-visual nil)
(setq track-eol t)
(setq set-mark-command-repeat-pop t)

;; Column and line number display
(setq column-number-mode t)
(setq line-number-mode t)
(setq size-indication-mode t)
(setq-default fill-column 150)
(setq-default tab-width 4)


;; set default major mode to text-mode
(setq-default major-mode 'text-mode)
(add-to-list 'auto-mode-alist '("\\.log.m\\'"     . text-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'"       . text-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'"       . text-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'"        . text-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'"  . text-mode))


(provide 'x-display)
