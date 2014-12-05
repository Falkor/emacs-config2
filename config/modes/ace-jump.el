;; -*- mode: lisp; -*-
;; Time-stamp: <Mer 2014-09-24 23:42 svarrette>
;; ----------------------------------------------------------------------
;; Ace-jump-mode --  a quick cursor location minor mode for emacs
;; see http://www.emacswiki.org/AceJump
;; see also https://github.com/winterTTr/ace-jump-mode
;; ----------------------------------------------------------------------

(use-package ace-jump-mode
  :commands (ace-jump-mode)
  :bind ("C-c C-j" . ace-jump-mode))
