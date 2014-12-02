;; -*- mode: elisp; -*-
;; ----------------------------------------------------------------------
;; File: json.el -
;; Time-stamp: <Mar 2014-12-02 13:00 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .
;; ----------------------------------------------------------------------

(use-package json-mode
  :config
  (progn
    ;; Beautify json -- see https://github.com/daschwa/dotfiles/blob/master/emacs.d/emacs-init.org
    (defun beautify-json ()
      (interactive)
      (let ((b (if mark-active (min (point) (mark)) (point-min)))
            (e (if mark-active (max (point) (mark)) (point-max))))
        (shell-command-on-region b e
                                 "python -mjson.tool" (current-buffer) t)))

	))
