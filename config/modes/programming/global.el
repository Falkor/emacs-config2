;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: global.el -  Global setting for any programming language          
;; Time-stamp: <Lun 2014-11-10 12:30 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             
;; ----------------------------------------------------------------------

(add-hook 'prog-mode-hook (lambda ()
							(setq show-trailing-whitespace t)))
