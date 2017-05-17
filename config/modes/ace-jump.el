;; -*- mode: lisp; -*-
;; Time-stamp: <Mon 2017-02-13 13:48 svarrette>
;; ----------------------------------------------------------------------
;; Ace-jump-mode --  a quick cursor location minor mode for emacs
;; see http://www.emacswiki.org/AceJump
;; see also https://github.com/winterTTr/ace-jump-mode
;; ----------------------------------------------------------------------

(use-package ace-jump-mode
  :commands (ace-jump-mode)
  :bind (
         ("C-c C-j w" . ace-jump-word-mode)
         ("C-c C-j c" . ace-jump-char-mode)
         ("C-c C-j w" . ace-jump-word-mode)))
