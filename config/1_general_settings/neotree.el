;; ----------------------------------------------------------------------
;; File: neotree.el - NerdTree like 
;; Time-stamp: <Mer 2014-09-24 10:15 svarrette>
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
  :bind ("<f1>" . neotree-project-dir))

