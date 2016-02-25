;; -*- mode: emasc-lisp; -*-
;; ----------------------------------------------------------------------
;; File: yasnippets.el - Yasnippet -- et Another Snippet extension for Emacs.
;; Time-stamp: <Jeu 2014-12-04 11:15 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; ----------------------------------------------------------------------

;; === Yasnippet ===
;; Templates using Yasnippet: Yet Another Snippet extension for Emacs.
;; see http://www.emacswiki.org/emacs/Yasnippet and http://yasnippet.googlecode.com
;; Installation notes: see README


(use-package yasnippet
  :if (not noninteractive)
  :diminish (yas-minor-mode . " Y") 
  :commands (yas-minor-mode yas-expand yas-new-snippet yas-find-snippets yas-reload-all yas-visit-snippet-file)
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :init
  (progn 
  (hook-into-modes #'(lambda () (yas-minor-mode 1))
                   '(prog-mode-hook
                     text-mode-hook
                     org-mode-hook
                     ruby-mode-hook
                     message-mode-hook))
  ;;(add-to-list 'ac-sources 'ac-source-yasnippet)
  )
  :config
  (progn
    (setq yas-verbosity 0)
    (bind-keys :map yas-minor-mode-map
			   ("<tab>"      . nil)  ; unbind tab
			   ("TAB"        . nil)  ; idem
               ("M-<return>" . yas-expand)
               ;; ("M-<return>" . yas-expand)
               ("C-c y n"    . yas-new-snippet)
               ("C-c y f"    . yas-find-snippets)
               ("C-c y r"    . yas-reload-all)
               ("C-c y v"    . yas-visit-snippet-file)
               )
    ;; ;; Hotfix for conflicts between yasnippet and smart-tab
    ;; ;; see https://github.com/haxney/smart-tab/issues/1
    ;; (add-to-list 'hippie-expand-try-functions-list
    ;;              'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list
	(add-hook 'emacs-lisp-mode-hook #'(lambda () (yas-activate-extra-mode 'lisp-mode)))
        (yas-reload-all)
        ))
