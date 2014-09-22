;; -*- mode: lisp; -*-

;; === Yasnippet ===
;; Templates using Yasnippet: Yet Another Snippet extension for Emacs.
;; see http://www.emacswiki.org/emacs/Yasnippet and http://yasnippet.googlecode.com
;; Installation notes: see README

;; Classical setup
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (bind-keys*
;;  ("C-<return>" . yas-expand)
;;  ("M-<return>" . yas-expand))

;; Advanced setup with [use-package](https://github.com/jwiegley/use-package)
(use-package yasnippet
  :commands (yas-global-mode yas-minor-mode yas-expand)
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :init (yas-global-mode 1)
  :config
  (progn
	(setq yas-verbosity 0)
	;; (setq yas-snippet-dirs (concat emacs-root "snippets"))
	;; (yas-load-directory yas-snippet-dirs)
	)
  :bind (("C-<return>" . yas-expand)
		 ("M-<return>" . yas-expand)))


;;(yas/initialize)

