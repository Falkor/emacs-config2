;; =============================================
;; Activate fill adapt
;; see http://www.emacswiki.org/emacs/FillAdapt
;; =============================================
(require 'filladapt)
;; turn on filladapt mode everywhere but in ChangeLog files
(setq-default filladapt-mode nil)
(cond ((equal mode-name "Change Log")
       t)
      (t
       (turn-on-filladapt-mode)))
