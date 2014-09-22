;; -*- mode: lisp; -*-
;; Saving Emacs Sessions (cursor position etc. in a previously visited file)
;; (require 'saveplace)
;; (setq-default save-place t)
(use-package saveplace
  :init
  (progn
	(setq-default save-place t)))
