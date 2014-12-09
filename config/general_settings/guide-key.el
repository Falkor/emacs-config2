;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: guide-key.el - Guide key usage
;; Time-stamp: <Mar 2014-12-09 22:07 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             see https://github.com/kai2nenobu/guide-key
;; ----------------------------------------------------------------------



;; It's hard to remember keyboard shortcuts. The guide-key package pops up help after a short delay.
(use-package guide-key
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c r" "C-c h" "C-c p" "C-x g"))
    (setq guide-key/popup-window-position "bottom")
    (setq guide-key/idle-delay 0.1)
    (use-package guide-key-tip
      :config (setq guide-key-tip/enabled t))
    (guide-key-mode 1))  ; Enable guide-key-mode
  :diminish (guide-key-mode)
  )
