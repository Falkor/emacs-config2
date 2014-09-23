;; -*- mode: lisp; -*-
;; =================================================================
;; Aquamacs specific 
;; =================================================================
;; see http://www.emacswiki.org/emacs/AquamacsEmacsCompatibilitySettings
(Aquamacs
 (aquamacs-autoface-mode -1)  ; no mode-specific faces, everything in Monaco
 ;; do not load persistent scratch buffer
 (setq aquamacs-scratch-file nil)
 ;; do not make initial frame visible
 (setq show-scratch-buffer-on-startup nil)
)

