;; -*- mode: lisp -*-
;; Time-stamp: <Mer 2014-09-24 12:21 svarrette>
;; ===============================================
;;  Code/Tab completion
;; ===============================================


;; see http://www.emacswiki.org/emacs/TabCompletion
;;(require 'smart-tab)
(use-package smart-tab
  :init
  (progn
	(add-to-list 'hippie-expand-try-functions-list 
				 'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list
	(setq smart-tab-using-hippie-expand t)
	(global-smart-tab-mode t)))

;; Disable indent "smart" alignement to insert real tabs
(defun indent-with-real-tab-hook ()
  (setq indent-line-function 'insert-tab)
  )
;;(add-hook 'text-mode-hook   'indent-with-real-tab-hook)
(add-hook 'conf-mode-hook   'indent-with-real-tab-hook)
