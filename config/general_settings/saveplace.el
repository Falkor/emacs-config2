;; -*- mode: lisp; -*-
;; Time-stamp: <Ven 2014-09-26 11:41 svarrette>
;; -------------------------------------------------------------------------
;; Saving Emacs Sessions (cursor position etc. in a previously visited file)
(use-package saveplace
  :init
  (progn
	(setq-default save-place t)
	(setq save-place-file (get-conf-path ".saved-places"))
))
