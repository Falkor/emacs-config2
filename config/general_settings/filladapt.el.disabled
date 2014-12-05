;; -*- mode: lisp; auto-fill-mode;  -*-
;; =============================================
;; Activate fill adapt
;; see http://www.emacswiki.org/emacs/FillAdapt
;; =============================================

;;(require 'filladapt)
(use-package filladapt
  :init
  (progn
    (setq-default filladapt-mode nil)
    (cond ((equal mode-name "Change Log")
           t)
          (t
           (turn-on-filladapt-mode)))))


;; turn on filladapt mode everywhere but in ChangeLog files

;; (add-hook 'c-mode-common-hook
;;    (lambda ()
;;      (when (featurep 'filladapt)
;;        (c-setup-filladapt))))
