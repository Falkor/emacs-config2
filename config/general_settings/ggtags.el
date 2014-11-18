;; -*- mode: elisp; -*-
;; ----------------------------------------------------------------------
;; File: ggtags.el - Emacs frontend to GNU Global source code tagging system
;; Time-stamp: <Mar 2014-11-18 11:00 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             See https://github.com/leoliu/ggtags
;; ----------------------------------------------------------------------

;; Install Global with support for exuberant ctags
;;   brew install --HEAD ctags
;;   brew install global --with-exuberant-ctags

(use-package ggtags
  :config
  (progn
	(bind-keys :map ggtags-mode-map
			   ("C-c g s" . ggtags-find-other-symbol)
			   ("C-c g h" . ggtags-view-tag-history)
			   ("C-c g r" . ggtags-find-reference)
			   ("C-c g f" . ggtags-find-file)
			   ("C-c g c" . ggtags-create-tags)
			   ("C-c g u" . ggtags-update-tags)
			   ("M-,"     . pop-tag-mark))
	(add-hook 'c-mode-common-hook
			  (lambda ()
				(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
				  (ggtags-mode 1))))))
