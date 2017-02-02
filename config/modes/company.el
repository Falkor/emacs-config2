;; -*- mode: elisp; -*-
;; Time-stamp: <Mon 2017-01-09 09:59 svarrette>
;; ----------------------------------------------------------------------------
;; Company mode -- Complete Anything
;; See http://company-mode.github.io/
;;
;; Company is a text completion framework for Emacs. The name stands for
;; "complete anything". It uses pluggable back-ends and front-ends to retrieve
;; and display completion candidates. It comes with several back-ends such as
;; Elisp, Clang, Semantic, Eclim, Ropemacs, Ispell, CMake, BBDB, Yasnippet,
;; dabbrev, etags, gtags, files, keywords and a few others.
;; ----------------------------------------------------------------------------

;; company
(use-package company
  :init
  (progn
    (global-company-mode 1)
    (delete 'company-semantic company-backends)))

;; see http://syamajala.github.io/c-ide.html
(require 'rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)
(setq rtags-use-helm t)
