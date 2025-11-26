;;; -*- lexical-binding: t no-byte-compile: t -*-

(use-package all-the-icons :ensure t)

(use-package neotree
  :ensure t
  :bind (("C-x n t" . neotree-toggle)
         ("C-x n f" . neotree-find))
  :config
  (setq neo-theme 'arrow)
  (setq neo-window-fixed-size nil)
  (setq neo-autorefresh nil)

  (defun my/neotree-open-project ()
    "Open NeoTree at project root or current directory."
    (interactive)
    (let ((project-root
           (or (ignore-errors (project-root (project-current)))
               (locate-dominating-file default-directory ".git")
               (locate-dominating-file default-directory ".dir-locals.el")
               default-directory)))
      (neotree-dir project-root)))

  (advice-add #'neotree-toggle :override #'my/neotree-open-project)
)


;(use-package neotree-projectile
;  :after (neotree projectile)
; :ensure t)


(provide 'x-neotree)
;; Ends of files