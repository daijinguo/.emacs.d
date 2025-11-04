;;;-*- lexical-binding: t; no-byte-compile: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto Revert Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Automatically reload files modified by external programs
(use-package autorevert
  :ensure nil
  :diminish
  :hook (after-init . global-auto-revert-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespace Display
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-whitespace-mode t)
;; (setq whitespace-space-regexp   "\\(^\xA0+\\)")
;; (setq whitespace-hspace-regexp  "\\(^\xA0+\\)")
;; (setq whitespace-tab-regexp     "\\(^\xA0+\\)")
;; (setq whitespace-newline-regexp "\\(^\xA0+\\)")
;; (setq whitespace-style (quote (face
;;                                space-mark tab-mark newline-mark
;;                                missing-newline-at-eof )))
;; (setq whitespace-display-mappings
;;       '(;(space-mark   32 [183] [46])
;;          (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n]) ; eol - downwards arrow +
;;         ;(newline-mark ?\n    [?\u00B6 ?\n] [?$ ?\n]) ; eol - pilcrow
;;          (tab-mark     9      [8674 9]      [92 9] )
;;        )
;; )

(use-package whitespace
  :ensure nil
  :hook
    ((prog-mode c++-mode text-mode go-mode rust-mode cmake-mode) . whitespace-mode)
    (after-init . global-whitespace-mode)
  :config
    (setq whitespace-space-regexp   "\\(^\xA0+\\)")
    (setq whitespace-hspace-regexp  "\\(^\xA0+\\)")
    (setq whitespace-tab-regexp     "\\(^\xA0+\\)")
    (setq whitespace-newline-regexp "\\(^\xA0+\\)")
    (setq whitespace-style
          '(face space-mark tab-mark newline-mark missing-newline-at-eof))
    (setq whitespace-display-mappings
          '((newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n])
            (tab-mark     9      [8674 9]      [92 9] )))
    (setq whitespace-global-modes nil)
    (setq whitespace-action '(auto-cleanup)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Electric Pair Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Automatic parenthesis pairing
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init
  (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Show Paren Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Highlight matching parens
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :init
  (setq show-paren-when-point-inside-paren t)
  (setq show-paren-when-point-in-periphery t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart Region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Smartly select region, rectangle, multi cursors
(use-package smart-region
  :hook (after-init . smart-region-on))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight Line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Highlight the current line
(use-package hl-line
  :ensure nil
  :hook
  ((after-init . global-hl-line-mode)
   ((dashboard-mode eshell-mode shell-mode term-mode vterm-mode) .
    (lambda () (setq-local global-hl-line-mode nil)))))

(provide 'x-edit)