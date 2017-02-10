;; ----------------------------------------------------------------------
;; File: neotree.el - NerdTree like
;; Time-stamp: <Mer 2014-09-24 12:12 svarrette>
;; ----------------------------------------------------------------------
;; see http://www.emacswiki.org/emacs/NeoTree

(require 'find-file-in-project)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name   (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

(use-package neotree
  ;; :commands ( neo-buffer--unlock-width  neo-buffer--lock-width)
  :bind ("<f1>" . neotree-project-dir)
  :config
  (progn
    (setq neo-smart-open t)
    (setq projectile-switch-project-action 'neotree-projectile-action)
    ; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    ))

