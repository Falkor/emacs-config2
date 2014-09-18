;; -*- mode: lisp; -*-

;; === Yasnippet ===
;; Templates using Yasnippet: Yet Another Snippet extension for Emacs.
;; see http://www.emacswiki.org/emacs/Yasnippet and http://yasnippet.googlecode.com
;; Installation notes: see README
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory (concat emacs-root "snippets")) 
(yas-load-directory yas/root-directory)          ; Load the snippets

(yas-global-mode 1)
(global-set-key (read-kbd-macro "C-<return>") 'yas/expand)
