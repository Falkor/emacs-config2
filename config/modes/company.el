;; -*- mode: elisp; -*-
;; Time-stamp: <Wed 2017-02-08 23:41 svarrette>
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
  :ensure t
  :defer t
  :diminish company-mode
  :init
  (progn
    (global-company-mode 1)
    (delete 'company-semantic company-backends)

    ;; Default company mode colors are kind of ugly...
    (custom-set-faces
     '(company-preview
       ((t (:foreground "darkgray" :underline t))))
     '(company-preview-common
       ((t (:inherit company-preview))))
     '(company-tooltip
       ((t (:background "lightgray" :foreground "black"))))
     '(company-tooltip-selection
       ((t (:background "steelblue" :foreground "white"))))
     '(company-tooltip-common
       ((((type x)) (:inherit company-tooltip :weight bold))
        (t (:inherit company-tooltip))))
     '(company-tooltip-common-selection
       ((((type x)) (:inherit company-tooltip-selection :weight bold))
        (t (:inherit company-tooltip-selection)))))
    ))

;; see http://syamajala.github.io/c-ide.html
(require 'rtags)
(require 'company-rtags)

;;(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)
(use-package rtags-helm
  :config
  (setq rtags-use-helm t))
