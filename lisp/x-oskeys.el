;;; -*- lexical-binding: t no-byte-compile: t -*-

(cond
 ((eq system-type 'darwin)
  ;; mac-* variables are used by the special emacs-mac build of Emacs by
  ;; Yamamoto Mitsuharu, while other builds use ns-*.
  (setq mac-command-modifier      'meta
        ns-command-modifier       'meta
        mac-option-modifier       'super
        ns-option-modifier        'super
        ;; Free up the right option for character composition
        mac-right-option-modifier 'none
        ns-right-option-modifier  'none))
 ((eq system-type 'windows-nt)
  (setq w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super)))


(provide 'x-oskeys)

