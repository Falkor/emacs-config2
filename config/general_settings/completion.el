;; -*- mode: lisp -*-
;; Time-stamp: <Jeu 2014-09-25 11:47 svarrette>
;; ;; ===============================================
;; ;;  Code/Tab completion
;; ;; ===============================================

;; ;; see http://www.emacswiki.org/emacs/TabCompletion
;; ;;(require 'smart-tab)
;; (use-package smart-tab
;;   :init
;;   (progn
;;  (add-to-list 'hippie-expand-try-functions-list
;;               'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list
;;  (setq smart-tab-using-hippie-expand t)
;;  (global-smart-tab-mode t)))

;; ;; Disable indent "smart" alignement to insert real tabs
;; (defun indent-with-real-tab-hook ()
;;   (setq indent-line-function 'insert-tab)
;;   )
;; ;;(add-hook 'text-mode-hook   'indent-with-real-tab-hook)
;; (add-hook 'conf-mode-hook   'indent-with-real-tab-hook)



;; === Yasnippet ===
;; Templates using Yasnippet: Yet Another Snippet extension for Emacs.
;; see http://www.emacswiki.org/emacs/Yasnippet and http://yasnippet.googlecode.com
;; Installation notes: see README

(use-package yasnippet
  :if (not noninteractive)
  :diminish yas-minor-mode
  :commands (yas-minor-mode yas-expand yas-new-snippet yas-find-snippets yas-reload-all yas-visit-snippet-file)
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :init
  (hook-into-modes #'(lambda () (yas-minor-mode 1))
                   '(prog-mode-hook
                     text-mode-hook
                     org-mode-hook
                     ruby-mode-hook
                     message-mode-hook))
  :config
  (progn
    (setq yas-verbosity 0)
    (bind-keys :map yas-minor-mode-map
               ("C-<return>" . yas-expand)
               ("M-<return>" . yas-expand)
               ("C-c y n"    . yas-new-snippet)
               ("C-c y f"    . yas-find-snippets)
               ("C-c y r"    . yas-reload-all)
               ("C-c y v"    . yas-visit-snippet-file)
               )
    ;; Hotfix for conflicts between yasnippet and smart-tab
    ;; see https://github.com/haxney/smart-tab/issues/1
    (add-to-list 'hippie-expand-try-functions-list
                 'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list
    )
  :idle
  (progn
    (yas-reload-all)))

;; (define-key yas-minor-mode-map (kbd "C-<return>") 'yas-expand)
;; (define-key yas-minor-mode-map (kbd "M-<return>") 'yas-expand)

;; add C/C++ headers directly in auto-complete
;; see https://github.com/mooz/auto-complete-c-headers
(defun my:ac-c-header-init ()
  (auto-complete-mode 1)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;; below list from the output of `gcc -xc -E -v -` or `gcc -xc++ -E -v -` as
  ;; advided in the variable achead:include-directories
  (when is-mac
    (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"))
  )

;; Turn on auto completion
;; See http://www.emacswiki.org/emacs/AutoComplete
;;(require 'auto-complete-config)
(use-package auto-complete
  :config (use-package auto-complete-config
            :diminish auto-complete-mode
            :init
            (progn
              (setq ac-comphist-file (get-conf-path ".ac-comphist.dat"))
              (ac-config-default)
              (hook-into-modes #'my:ac-c-header-init
                               '(c-mode-common-hook
                                 c-mode-hook
                                 c++-mode-hook))
              )
            :config
            (progn
              (ac-set-trigger-key "TAB")
              (ac-set-trigger-key "<tab>")
              )))
