;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: global.el -  Global setting for any programming language
;; Time-stamp: <Mar 2014-12-02 12:46 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             
;; ----------------------------------------------------------------------

(add-hook 'prog-mode-hook (lambda ()
							(setq show-trailing-whitespace t)))
