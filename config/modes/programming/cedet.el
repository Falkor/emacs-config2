;; -*- mode: emacs-lisp; -*-
;; ----------------------------------------------------------------------
;; `'cedet.el` - CEDET (Collection Of Emacs Development Environment Tools),
;; Semantic and main programming stuff.
;; Time-stamp: <Mar 2014-12-02 12:57 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .       See http://cedet.sourceforge.net/
;; .       or  http://xtalk.msk.su/~ott/en/writings/emacs-devenv/EmacsCedet.html
;; ----------------------------------------------------------------------

;; see http://tuhdo.github.io/c-ide.html



;; See http://p.writequit.org/org/settings.html
(defun my/add-watchwords ()
  "Highlight FIXME, TODO, and NOCOMMIT in code"
  (font-lock-add-keywords
   nil '(("\\<\\(FIXME\\|TODO\\|NOCOMMIT\\)\\>"
          1 '((:foreground "#d7a3ad") (:weight bold)) t))))

(add-hook 'prog-mode-hook 'my/add-watchwords)

;; ------------------
;; IEdit: Interactive, multi-occurrence editing in your buffer
;; see https://github.com/victorhge/iedit
(use-package iedit
  :bind ("C-c ;" . iedit-mode))

;; ----------------
;; === Semantic ===
;; ----------------
;; see http://cedet.sourceforge.net/semantic.shtml
;; The most critical part as it is the code parser that will latter provide text
;; analysis in Emacs

(use-package cc-mode
  :mode (("\\.h\\(h?\\|xx\\|pp\\)\\'" . c++-mode)
         ("\\.m\\'"                   . c-mode)
         ("\\.mm\\'"                  . c++-mode))
  :config
  ;; (progn
  ;;   (bind-key "#" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "{" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "}" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "/" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "*" 'self-insert-command c-mode-base-map)
  ;;   (bind-key ";" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "," 'self-insert-command c-mode-base-map)
  ;;   (bind-key ":" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "(" 'self-insert-command c-mode-base-map)
  ;;   (bind-key ")" 'self-insert-command c-mode-base-map)
  ;;   (bind-key "<" 'self-insert-command c++-mode-map)
  ;;   (bind-key ">" 'self-insert-command c++-mode-map)
  ;;   )
  )


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
    (setq semanticdb-default-save-directory "~/.emacs.d/.cache/semanticdb") ; getting rid of semantic.caches
	)
  :config
  (progn
	(require 'semantic)
	(require 'semantic/ia)
	(require 'semantic/sb) ; integrate semantic with speedbar
	(require 'semantic/bovine/gcc) ; allows semantic to ask GCC for system include paths
								   ; complete the above as follows: 
	(defun falkor/semantic/bovine/gcc ()
	  ;; complete below using the output of `gcc -xc++ -E -v -`
	  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1" 'c++-mode)
	  ;;(semantic-add-system-include "/usr/local/include/boost" 'c++-mode)
	  )

	
	;; Semantic options -- see http://www.gnu.org/software/emacs/manual/html_node/semantic/Semantic-mode.html

	;; MANDATORY ;) parse the code whenever you’re idle
	(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)

	;; Store parsing results in a database
	(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

	;; Display information about the current thing under the cursor when idle.
	(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

	;; Highlight local symbols which are the same as the thing under the cursor
	(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

	;; Toggle Semantic Sticky Function mode in all Semantic-enabled buffers.
	;; displays a header line that shows the declaration line of the function or
	;; tag on the topmost line in the text area.
	(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

	;; Activate semantic
	(semantic-mode 1))
  
    ;;(add-hook 'semantic-init-hooks 'falkor/semantic-init)
  )



;; GNU Emacs package for showing an inline arguments hint for the C/C++ function at point.
(use-package function-args
  :config
  (progn
    (fa-config-default)
    ;; (bind-keys :map c-mode-map
    ;;            ("C-TAB" . moo-complete)
    ;;            ("M-o"   . fa-show))
    ;; (bind-map :map
    ;;c++-mode-map
    ;;            ("C-TAB" . moo-complete)
    ;;            ("M-o"   . fa-show))
    ))







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






;; (use-package auto-complete-c-headers
;;   :init
;;   (progn
;;  (defun falkor/ac-c-header-init ()
;;    (require 'auto-complete-c-headers)

;;    (add-to-list 'ac-sources 'ac-source-c-headers)

;;    ;; complete below using the output of `gcc -xc++ -E -v -`
;;    (add-to-list 'achead:include-directories
;;                '(("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1")
;;                  ("."))))

;;  (add-hook 'c++-mode-hook 'falkor/ac-c-header-init)
;;  (add-hook 'c-mode-hook   'falkor/ac-c-header-init)))


;; (defun falkor/semantic-init ()
;;   (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1" 'c++-mode)
;;   ;;(semantic-add-system-include "/usr/local/include/boost" 'c++-mode)

;;   ;;  adds semantic as a suggestion backend to auto complete
;;   ;; (add-to-list 'ac-sources 'ac-source-semantic))
;;   )

;; ;; ;; === Prepare CEDET binding ===
;; (defun falkor/cedet-hook ()

;;   ;; Intellisense menu
;;   (local-set-key (read-kbd-macro "M-<return>") 'semantic-ia-complete-symbol-menu)
;;   ;;  jump to declaration of variable or function, whose name is under point
;;   (local-set-key "\C-j"  'semantic-ia-fast-jump)
;;   (local-set-key "\C-p"  'semantic-analyze-proto-impl-toggle) ; swith to/from declaration/implement

;;   ;; shows documentation for function or variable, whose names is under point
;;   (local-set-key "\C-cd" 'semantic-ia-show-doc)     ; in a separate buffer
;;   (local-set-key "\C-cs" 'semantic-ia-show-summary) ; in the mini-buffer


;;   ;;(add-to-list 'ac-sources 'ac-source-semantic)
;;   )

;; (add-hook 'c-mode-common-hook 'falkor/cedet-hook)
;; (add-hook 'c-mode-hook        'falkor/cedet-hook)
;; (add-hook 'c++-mode-hook      'falkor/cedet-hook)
