;;;-*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Management Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable automatic package initialization at startup
(setq package-enable-at-startup nil)

;; For older Emacs versions, set TLS algorithm priority to avoid issues with TLS 1.3
(when (< emacs-major-version 27)
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Set package user directory based on current Emacs version
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                        user-emacs-directory))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Archive Sources
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define default and mirror URLs for package archives
(defconst pkg-url-default
  '(("gnu"    . "https://elpa.gnu.org/packages/")
    ("nongnu" . "https://elpa.nongnu.org/nongnu/")
    ("melpa"  . "https://melpa.org/packages/")))

(defconst pkg-url-tuna-mirrors
  '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
    ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq package-check-signature nil)

;; Use Tsinghua University mirrors by default
(setq package-archives pkg-url-tuna-mirrors)
;; (setq package-archives pkg-url-default) ; Uncomment to use official sources

;; Initialize packages
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Utility Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ensure a specific package is installed
(defun ensure-package (package)
  "Ensure ELPA PACKAGE is installed."
  (unless (package-installed-p package)
    (package-install package)))

;; Upgrade all installed packages
(defun upgrade-all-packages ()
  "Upgrade all ELPA installed packages."
  (interactive)
  (package-refresh-contents)
  (package-upgrade-all))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use-Package Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initialize packages
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))

(eval-when-compile (require 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Native Compilation
(setq native-compile-cache nil)
(setq native-compile-async nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Essential Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install and configure diminish
(ensure-package 'diminish)
(require 'diminish)

;; Bootstrap quelpa as an addition to MELPA
(ensure-package 'quelpa)
(use-package quelpa
  :commands quelpa
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-self-upgrade-p nil)
  (quelpa-update-melpa-p nil)
  (quelpa-checkout-melpa-p nil))

;; Keep ~/.emacs.d/ clean using no-littering
(use-package no-littering
  :ensure t
  :demand t)

(provide 'x-elpa)