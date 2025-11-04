;;; -*- lexical-binding: t; no-byte-compile: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Garbage Collection Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initial GC settings for better performance during startup
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.5)
(setq read-process-output-max (* 10 1024 1024))

;; GC Magic Hack - optimize garbage collection
(use-package gcmh
  :ensure t
  :hook
  (emacs-startup . gcmh-mode)
  :init
  (setq gcmh-idle-delay 'auto)
  (setq gcmh-auto-idle-delay-factor 10)
  (setq gcmh-high-cons-threshold #x1000000))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File Handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable backup and auto-save files
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default inhibit-compacting-font-caches t)

;; Disable lock files
(setq-default create-lockfiles nil)

;; Always load the newest version of files
(setq-default load-prefer-newer t)

;; Simplified prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default use-short-answers t)
(setq-default y-or-n-p-use-read-key t)
(setq-default read-char-choice-use-read-key t)

;; Confirmation settings
(setq confirm-kill-emacs nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; System Specific Configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux specific settings
(setq x-gtk-use-system-tooltips nil)
(setq x-gtk-use-native-input t)
(setq x-underline-at-descent-line t)

;; UTF-8 encoding settings
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(setq locale-coding-system 'utf-8)
(setq system-time-locale "C")
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(setq session-save-file-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (setq selection-coding-system 'utf-8))

;; Dired listing switches for different systems
(when (memq system-type '(darwin berkeley-unix))
  (customize-set-variable 'dired-use-ls-dired nil)
  (customize-set-variable 'dired-listing-switches "-alh"))

(when (eq system-type 'gnu/linux)
  (customize-set-variable 'dired-listing-switches "-alFh"))

;; Trash bin configuration for macOS
(when (eq system-type 'darwin)
  (setq delete-by-moving-to-trash t
        trash-directory "~/.Trash/emacs"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; History (Commented Out)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package saveplace
;;   :ensure nil
;;   :hook (after-init . save-place-mode))

(provide 'x-basic)