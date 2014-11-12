;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: autocomplete.el -  See http://www.emacswiki.org/emacs/AutoComplete
;; Time-stamp: <Lun 2014-11-10 11:28 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .
;; ----------------------------------------------------------------------

(use-package pabbrev
  :commands pabbrev-mode
  :diminish pabbrev-mode)


(use-package auto-complete-config
  :diminish auto-complete-mode
  :init
  (progn
	(setq ac-comphist-file (get-conf-path ".ac-comphist.dat"))
	(ac-config-default))
  :config
  (progn
	(ac-set-trigger-key "<backtab>")))
