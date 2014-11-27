;; -*- mode: emacs-lisp; -*-
;; ----------------------------------------------------------------------
;; File: cedet.el - Mainly rely on Collection Of Emacs Development
;; .                Environment Tools (CEDET)
;; Time-stamp: <Jeu 2014-11-27 01:11 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .       See http://cedet.sourceforge.net/
;; .       or  http://xtalk.msk.su/~ott/en/writings/emacs-devenv/EmacsCedet.html
;; ----------------------------------------------------------------------

;; see http://tuhdo.github.io/c-ide.html


(defun falkor/ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;; $> gcc -xc++ -E -v -
  ;; [...]
  ;; #include <...> search starts here:
  ;; /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1
  ;; /usr/local/include
  ;; /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include
  ;; /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
  ;; /usr/include
  ;; /System/Library/Frameworks (framework directory)
  ;; /Library/Frameworks (framework directory)
  ;; End of search list
  ;;
  ;; See also the variable `semantic-dependency-system-include-path`
  (add-to-list 'achead:include-directories
               '(("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1")
                 ("."))
               ))

(defun falkor/semantic-init ()
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1" 'c++-mode)
  ;;(semantic-add-system-include "/usr/local/include/boost" 'c++-mode)
  )


;; ----------------
;; === Semantic ===
;; ----------------
;; see http://cedet.sourceforge.net/semantic.shtml
;; The most critical part as it is the code parser that will latter provide text
;; analysis in Emacs

(use-package cc-mode)
(use-package semantic
  :init
  (progn
    ;; Depending on your requirements, you can use one of the commands, described
    ;; below, to load corresponding set of features (these commands are listed in
    ;; increasing order, and each command include features of previous commands):
    ;;
    ;;     o   This is the default. Enables the database and idle reparse
    ;;         engines
    ;;(semantic-load-enable-minimum-features)

    ;;     o This enables some tools useful for coding, such as summary mode imenu
    ;;       support, the semantic navigator i.e prototype help and smart completion
    ;; (semantic-load-enable-code-helpers)

    ;;     o   This enables even more coding tools such as the nascent
    ;;         intellisense mode decoration mode, and stickyfunc mode (plus
    ;;         regular code helpers)
    ;;(semantic-load-enable-guady-code-helpers)

    ;;     o   This turns on which-func support (plus all other code
    ;;         helpers)
    ;;(semantic-load-enable-excessive-code-helpers)

    ;;     o   This turns on modes that aid in writing grammar and developing
    ;;         semantic tool.
    ;;         It does not enable any other features such as code helpers above.
    ;;(semantic-load-enable-semantic-debugging-helpers)

    ;; Directory that semantic use to cache its files
    (setq semanticdb-default-save-directory "~/.emacs.d/.emacs-semanticdb") ; getting rid of semantic.caches

    (global-semanticdb-minor-mode        1)
    (global-semantic-idle-scheduler-mode 1)
    (global-semantic-stickyfunc-mode     1)

    (semantic-mode 1))
  :config
  (progn
    ;;(use-package )
    (add-hook 'semantic-init-hooks 'falkor/semantic-init)
    ))

;; IEdit: Interactive, multi-occurrence editing in your buffer
;; see https://github.com/victorhge/iedit
(use-package iedit
  :bind ("C-c ;" . iedit-mode))
;; (define-key global-map (kbd "C-c ;") 'iedit-mode)






;; (use-package 'function-args
;;   )
;; (fa-config-default)
;; (define-key c-mode-map  [(contrl tab)] 'moo-complete)
;; (define-key c++-mode-map  [(control tab)] 'moo-complete)
;; (define-key c-mode-map (kbd "M-o")  'fa-show)
;; (define-key c++-mode-map (kbd "M-o")  'fa-show))


;; This extension provides several commands that are useful for c++-mode:

;; * `fa-show' -- show an overlay hint with current function arguments.
;; * `fa-jump' -- jump to definition of current element of `fa-show'.
;; * `moo-complete' -- a c++-specific version of `semantic-ia-complete-symbol'.
;; * `moo-propose-virtual' -- in class declaration, list all virtual
;;   methods that the current class can override.
;; * `moo-propose-override' -- similar to `moo-propose-virtual', but lists all
;;   inherited methods instead.
;; * `moo-jump-local' -- jump to a tag defined in current buffer.



;; ;; === Prepare CEDET binding ===
;; (defun falkor/cedet-hook ()
;;   ;; Intellisense menu
;;   (local-set-key (read-kbd-macro "M-<return>") 'semantic-ia-complete-symbol-menu)
;;   ;;  jump to declaration of variable or function, whose name is under point
;;   (local-set-key "\C-cj" 'semantic-ia-fast-jump)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle) ; swith to/from declaration/implement
;;   ;;
;;   (local-set-key "\C-ch" 'semantic-decoration-include-visit) ; visit the header file under point
;;   ;;
;;   ;; shows documentation for function or variable, whose names is under point
;;   (local-set-key "\C-cd" 'semantic-ia-show-doc)     ; in a separate buffer
;;   (local-set-key "\C-cs" 'semantic-ia-show-summary) ; in the mini-buffer
;;   )

;; (add-hook 'c-mode-common-hook 'falkor/cedet-hook)
;; (add-hook 'c-mode-hook        'falkor/cedet-hook)
;; (add-hook 'c++-mode-hook      'falkor/cedet-hook)
