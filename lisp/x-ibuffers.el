;;; -*- lexical-binding: t; no-byte-compile: t -*-

;; (use-package avy
;;   :ensure t
;;   :bind (("M-s f" . avy-goto-char)
;;          ("M-s F" . avy-goto-char-2)
;;          ("M-s w" . avy-goto-word-1)
;;          ("M-s l" . avy-goto-line))
;;   :config
;;   (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;;   ;;(setq avy-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))
;;   (setq avy-style 'at-full)
;;   (setq avy-timeout-seconds 0.5)
;; )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Vertico - Vertical completion UI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vertico
  :ensure t
  :hook ((after-init       . vertico-mode)
         (minibuffer-setup . vertico-repeat-save))
  :custom
  (vertico-sort-function nil))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Embark - Act on completion candidates
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package embark
  :ensure t
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
)

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Orderless - Flexible completion style
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ensure-package 'orderless)
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((eglot (styles . (orderless basic)))
                                       (file (styles basic partial-completion))))
  (setq completion-cycle-threshold 4))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Consult - Useful completion commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; https://github.com/minad/consult
(use-package consult
  :ensure t
  :bind (("M-s f" . consult-find)
         ("M-s g" . consult-ripgrep)
         ("C-x b" . consult-buffer)
         ("M-y"   . consult-yank-pop)
         ("M-s l" . consult-line)
         ("M-g g" . consult-goto-line))
  :custom
    (consult-ripgrep-args
      (concat
        "rg "
        "--hidden "
        "--glob !.git/ --glob !node_modules/ --glob !dist/ --glob !build/ --glob !venv/ --glob !__pycache__/ "
        "--line-number "
        "--smart-case "
        "--null "
        "--color=never "
        "--no-heading "
        "--with-filename "
        "--max-columns=1024 "
      )
    )
    (consult-preview-key '(:debounce 0.2 any))
    (consult-buffer-sort 'visibility)
    (consult-file-externally-functions nil)
    (consult-fontify-preserve nil)
    (consult-async-min-input 2)
    (consult-async-refresh-delay 0.15)
    (consult-async-input-throttle 0.2)
    (consult-async-input-debounce 0.1)
  :config
    (with-no-warnings
      (consult-customize consult-ripgrep consult-find consult-grep consult-buffer
        :preview-key '(:debounce 0.3 any)
      )
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Marginalia - Enrich completion annotations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-install 'marginalia)
(marginalia-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wgrep - Edit grep buffer and apply changes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IBuffer - Improved buffer menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;(use-package nerd-icons
;;;  :ensure t
;;;  :config
;;;  (unless (nerd-icons-font-installed-p)
;;;    (nerd-icons-install-fonts t))
;;;)

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer)
  :init 
  (setq ibuffer-filter-group-name-face '(:inherit (font-lock-string-face bold)))
  :config
  ;; Display icons for buffers
  (use-package all-the-icons-ibuffer
    :when (display-graphic-p)
    :hook (ibuffer-mode . all-the-icons-ibuffer-mode)
    :init (setq all-the-icons-ibuffer-icon t)))

(provide 'x-ibuffers)
