;; -*- mode: emacs-lisp; -*-
;; ----------------------------------------------------------------------
;; File: ggtags.el - Emacs frontend to GNU Global source code tagging system
;; Time-stamp: <Jeu 2014-11-27 01:11 svarrette>
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

	;; See Suggested Key Mapping of https://github.com/syohex/emacs-helm-gtags
	(setq helm-gtags-prefix-key (kbd "C-t"))
	
    (use-package helm-gtags
      :init
      (progn
        (setq
         helm-gtags-ignore-case         t
         helm-gtags-auto-update         t
         helm-gtags-use-input-at-cursor t
         helm-gtags-pulse-at-cursor     t
         helm-gtags-suggested-key-mapping t))
      :config
      (progn
        ;; Enable helm-gtags-mode in Dired so you can jump to any tag
        ;; when navigate project tree with Dired
        (add-hook 'dired-mode-hook 'helm-gtags-mode)
        ;; Enable helm-gtags-mode in Eshell for the same reason as above
        (add-hook 'eshell-mode-hook 'helm-gtags-mode)

        ;; Enable helm-gtags-mode in languages that GNU Global supports
        (add-hook 'c-mode-hook    'helm-gtags-mode)
        (add-hook 'c++-mode-hook  'helm-gtags-mode)
        (add-hook 'java-mode-hook 'helm-gtags-mode)
        (add-hook 'asm-mode-hook  'helm-gtags-mode)
        (bind-keys :map helm-gtags-mode-map 
                   ("C-c g a" . helm-gtags-tags-in-this-function)
                   ("C-t s"   . helm-gtags-select) ; Tag jump using gtags and helm
				   ("C-:"     . helm-gtags-dwim)   ; Find name by context.
				   ;;                - Jump to header file if cursor is on include statement
				   ;;                - Jump to tag definition if cursor is on tag reference
				   ;;                - Jump to tag reference if cursor is on tag definition
				   ("C-t <"    . helm-gtags-previous-history) ; Move to previous history on context stack
				   ("C-t >"    . helm-gtags-next-history)     ; Move to next history on context stack.
				   ("C-t C-t"  . helm-gtags-pop-stack)        ; Move to previous 
										; point on the stack. helm-gtags pushes
										; current point to stack before
										; executing each jump functions. 
				   )
		))
    (add-hook 'c-mode-common-hook
              (lambda ()
                (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
                  (ggtags-mode 1))))
	(setq-local hippie-expand-try-functions-list
				(cons 'ggtags-try-complete-tag hippie-expand-try-functions-list))
	(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
	))
