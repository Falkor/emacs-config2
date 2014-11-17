;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: guide-key.el - Guide key usage
;; Time-stamp: <Lun 2014-11-17 16:29 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             see https://github.com/kai2nenobu/guide-key
;; ----------------------------------------------------------------------



;; It's hard to remember keyboard shortcuts. The guide-key package pops up help after a short delay.
(use-package guide-key
  :init
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
  (setq guide-key/popup-window-position "bottom")
  (setq guide-key/idle-delay 0.1)
  (use-package guide-key-tip
	:config (setq guide-key-tip/enabled t))
  (guide-key-mode 1))  ; Enable guide-key-mode
