;;; -*- lexical-binding: t no-byte-compile: t -*-

;; macOS 27 (Darwin 27) 上 Emacs 31.1 内嵌的 libgccjit 检测部署目标时算出了
;; 无效版本 18.0，导致传给 clang driver 的 -mmacosx-version-min=18.0 被拒绝
;; （native-ice: error invoking gcc driver）。提前设置部署目标即可修复。
(setenv "MACOSX_DEPLOYMENT_TARGET" "27.0")

;; load the path for self config files
(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir)))

;;; Config the custom file
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'x-elpa)
(require 'x-basic)
(require 'x-display)
(require 'x-oskeys)
(require 'x-edit)
(require 'x-ibuffers)
(require 'x-treemacs)
(require 'x-neotree)
(require 'x-theme)
(require 'x-program)

(require 'server)
(unless (server-running-p) (server-start))


;; end if init.el
(provide 'init)
