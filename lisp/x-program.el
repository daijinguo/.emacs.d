;;; -*- lexical-binding: t no-byte-compile: t -*-


(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  (company-tooltip-align-annotations t)
  (company-require-match 'never)
  (company-global-modes '(not erc-mode message-mode help-mode gud-mode))
)


;; Install lsp-mode and related packages
(use-package lsp-mode
  :ensure t
  :hook
  (;; Replace these with the languages you use
   (python-mode . lsp)
   (js-mode . lsp)
   (typescript-mode . lsp)
   (java-mode . lsp)
   (c-mode . lsp)
   (c++-mode . lsp)
   (go-mode . lsp)
   (rust-mode . lsp))
  :commands (lsp lsp-deferred)
  :custom
  ;; General LSP settings
  (lsp-auto-guess-root t)
  (lsp-prefer-flymake nil) ; Use flycheck instead of flymake
  (lsp-before-save-edits t) ; Apply edits before saving
  ;; Performance settings
  (lsp-idle-delay 0.5) ; Delay before starting LSP operations
  (lsp-enable-snippet nil) ; Disable snippet support if not needed
  (lsp-enable-folding nil) ; Disable folding by default
  (lsp-enable-indentation t) ; Enable indentation handling
  (lsp-enable-on-type-formatting nil) ; Disable on-type formatting
  ;; Diagnostics settings
  (lsp-enable-links t) ; Enable clickable links in documentation
  (lsp-headerline-breadcrumb-enable nil) ; Disable breadcrumb in headerline
  ;; Modeline settings
  (lsp-modeline-code-actions-enable nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-modeline-workspace-status-enable nil)
  :config
  (lsp-enable-which-key-integration t)
  ;; Customize LSP server startup
  (setq lsp-restart 'auto-restart) ; Automatically restart failed servers
  (setq lsp-auto-configure t) ; Auto-configure based on project files
  ;; File watch settings
  (setq lsp-file-watch-threshold 5000) ; Increase threshold for large projects
)

;; Install LSP UI for better UI integration
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-update-mode 'line)
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-delay 0.5)
  (setq lsp-ui-doc-position 'bottom))


(use-package rustic
  :ensure t
  :hook (rustic-mode . lsp)
  :custom
  (rustic-lsp-client 'lsp-mode)
  (rustic-format-on-save t)
  (rustic-indent-method-chain t)
  :config
  ;; Rust-analyzer specific settings
  (setq lsp-rust-analyzer-cargo-watch-command "check")
  (setq lsp-rust-analyzer-cargo-load-out-dirs-from-check t)
  (setq lsp-rust-analyzer-proc-macro-enable t)
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
)


(provide 'x-program)
