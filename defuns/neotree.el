;; ----------------------------------------------------------------------
;; File: neotree.el - 
;; Time-stamp: <Mer 2014-09-17 21:16 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;;
;; ----------------------------------------------------------------------

;; see http://www.emacswiki.org/emacs/NeoTree

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))



;; ----------------------------------------------------------------------
;; eof
;;
;; Local Variables:
;; mode: lisp
;; End:
