;; to activate or not ECB 
(defun ecb-toggle ()
  "Activate (or desactivate) Emacs Code Browser (ECB)"
  (interactive)
  (if ecb-minor-mode
      (ecb-deactivate)
    (ecb-activate)))
