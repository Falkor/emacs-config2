;; -*- mode: elisp; -*-
;; ----------------------------------------------------------------------
;; File: yaml.el - YAML programming support.
;; Time-stamp: <Mar 2014-12-02 12:44 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; ----------------------------------------------------------------------

(use-package yaml-mode
  :config
  (progn
	(add-hook 'yaml-mode-hook 'whitespace-mode)
	))
