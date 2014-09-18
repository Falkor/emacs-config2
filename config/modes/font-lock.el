;; -*- mode: lisp; -*-
;; Time-stamp: <Jeu 2014-09-18 14:46 svarrette>
;;
;; =================================================================
;; Font Lock configuration
;; Note: minor mode, always local to a particular buffer, which
;; highlights (or “fontifies”) the buffer contents according to the
;; syntax of the text you are editing.
;; =================================================================
;; Enable syntax highlighting for older Emacsen that have it off
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode     1)    ; GNU Emacs
  (setq font-lock-auto-fontify t))   ; XEmacs

(setq font-lock-maximum-decoration t)
(setq font-lock-maximum-size       nil)

(setq font-lock-support-mode 'jit-lock-mode)
