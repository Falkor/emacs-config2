;; -*- mode: emacs-lisp; -*-
;; ----------------------------------------------------------------------
;; `'cedet.el` - CEDET (Collection Of Emacs Development Environment Tools),
;; Semantic and main programming stuff.
;; Time-stamp: <Wed 2017-02-08 17:08 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .       See http://cedet.sourceforge.net/
;; .       or  http://xtalk.msk.su/~ott/en/writings/emacs-devenv/EmacsCedet.html
;; ----------------------------------------------------------------------

;; see http://tuhdo.github.io/c-ide.html

                                        ; ;; See http://p.writequit.org/org/settings.html
                                        ; (defun my/add-watchwords ( )
                                        ; ("Highlight FIXME, TODO, and NOCOMMIT in code")
                                        ; (font-lock-add-keywords
                                        ;   nil '(("\\<\\(FIXME\\|TODO\\|NOCOMMIT\\)\\>"
                                        ;   1 '((:foreground "#d7a3ad") (:weight bold)) t))))
                                        ;
                                        ; ;;
                                        ; (add-hook 'prog-mode-hook 'my/add-watchwords)

;; ------------------
;; IEdit: Interactive, multi-occurrence editing in your buffer
;; see https://github.com/victorhge/iedit
(use-package iedit
  :bind ("C-c ;" . iedit-mode))

;; ==========================================
;; (optional) bind TAB for indent-or-complete
;; ==========================================
(defun irony--check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))
(defun irony--indent-or-complete ()
  "Indent or Complete"
  (interactive)
  (cond ((and (not (use-region-p))
              (irony--check-expansion))
         (message "complete")
         (company-complete-common))
        (t
         (message "indent")
         (call-interactively 'c-indent-line-or-region))))
(defun irony-mode-keys ()
  "Modify keymaps used by `irony-mode'."
  (local-set-key (kbd "TAB") 'irony--indent-or-complete)
  (local-set-key [tab] 'irony--indent-or-complete))

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(use-package irony
  :diminish irony-mode
  :config
  (progn
    (use-package company-irony
      :ensure t
      :config
      (progn
        (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
        (setq company-backends (delete 'company-semantic company-backends))
        (eval-after-load 'company
          '(add-to-list
            'company-backends 'company-irony))
        (setq company-idle-delay 0)
        (add-hook 'c-mode-common-hook 'irony-mode-keys)
        ;(define-key c-mode-map [(tab)]   'company-complete)
        ;(define-key c++-mode-map [(tab)] 'company-complete)
        ))

    (require 'company-irony-c-headers)
    (eval-after-load 'company
      '(add-to-list
        'company-backends '(company-irony-c-headers company-irony)))
    (add-hook 'c++-mode-hook  'irony-mode)
    (add-hook 'c-mode-hook    'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)

    (add-hook 'irony-mode-hook 'my-irony-mode-hook)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    ))



;; (use-package cc-mode
;;   :mode (("\\.h\\(h?\\|xx\\|pp\\)\\'" . c++-mode)
;;          ("\\.m\\'"                   . c-mode)
;;          ("\\.mm\\'"                  . c++-mode))
;;   ;;:bind ("M-q" . query-replace)
;;   ;;:init
;;   ;; (progn
;;   ;;   (define-key c-mode-map    [(tab)] 'company-complete)
;;   ;;   (define-key c++-mode-map  [(tab)] 'company-complete))
;;   ;; :config
;;   ;; (progn
;;   ;;   (bind-key "#" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "{" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "}" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "/" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "*" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key ";" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "," 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key ":" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "(" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key ")" 'self-insert-command c-mode-base-map)
;;   ;;   (bind-key "<" 'self-insert-command c++-mode-map)
;;   ;;   (bind-key ">" 'self-insert-command c++-mode-map)
;;   ;;   )
;;   )


(use-package flycheck
  :commands global-flycheck-mode
  :config
  (progn
    (dolist (hook '(c-common-mode-hook c-mode-hook c++-mode-hook))
      (add-hook hook 'flycheck-mode))
    (setq-default flycheck-disabled-checkers '(html-tidy emacs-lisp-checkdoc))
    ))

(require 'flycheck-rtags)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))

(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package cmake-ide
  :config
  (cmake-ide-setup))



;; c-mode-common-hook is also called by c++-mode
;;(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)'))

;; ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
;; ;; (setq flycheck-standard-error-navigation nil)
;; ;; ;; flycheck errors on a tooltip (doesnt work on console)
;; ;; (when (display-graphic-p (selected-frame))
;; ;;   (eval-after-load 'flycheck
;; ;;     '(custom-set-variables
;; ;;       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
;; ;;   )))

;; ;; ----------------
;; ;; === Semantic ===
;; ;; ----------------
;; ;; see http://cedet.sourceforge.net/semantic.shtml
;; ;; The most critical part as it is the code parser that will latter provide text
;; ;; analysis in Emacs

;; ;; (use-package semantic
;; ;;   :init
;; ;;   (progn
;; ;;     ;; Depending on your requirements, you can use one of the commands, described
;; ;;     ;; below, to load corresponding set of features (these commands are listed in
;; ;;     ;; increasing order, and each command include features of previous commands):
;; ;;     ;;
;; ;;     ;;     o   This is the default. Enables the database and idle reparse
;; ;;     ;;         engines
;; ;;     ;;(semantic-load-enable-minimum-features)

;; ;;     ;;     o This enables some tools useful for coding, such as summary mode imenu
;; ;;     ;;       support, the semantic navigator i.e prototype help and smart completion
;; ;;     ;; (semantic-load-enable-code-helpers)

;; ;;     ;;     o   This enables even more coding tools such as the nascent
;; ;;     ;;         intellisense mode decoration mode, and stickyfunc mode (plus
;; ;;     ;;         regular code helpers)
;; ;;     ;;(semantic-load-enable-guady-code-helpers)

;; ;;     ;;     o   This turns on which-func support (plus all other code
;; ;;     ;;         helpers)
;; ;;     ;;(semantic-load-enable-excessive-code-helpers)

;; ;;     ;;     o   This turns on modes that aid in writing grammar and developing
;; ;;     ;;         semantic tool.
;; ;;     ;;         It does not enable any other features such as code helpers above.
;; ;;     ;;(semantic-load-enable-semantic-debugging-helpers)

;; ;;     ;; Directory that semantic use to cache its files
;; ;;     (setq semanticdb-default-save-directory "~/.emacs.d/.cache/semanticdb") ; getting rid of semantic.caches
;; ;;     )
;; ;;   :config
;; ;;   (progn
;; ;;     (require 'semantic)
;; ;;     (require 'semantic/ia)
;; ;;     ;;(require 'semantic/sb) ; integrate semantic with speedbar
;; ;;     (require 'semantic/bovine/c)
;; ;;     ;;(require 'semantic/bovine/clang)
;; ;;                                         ;(require 'semantic/bovine/gcc) ; allows semantic to ask GCC for system include paths
;; ;;                                         ; complete the above as follows:

;; ;;                                         ; (defun falkor/semantic-include ()
;; ;;                                         ;   "Add my own specialization of the included headers for semantic and company-c-headers"
;; ;;                                         ;   ;;(semantic-reset-system-include)
;; ;;                                         ;
;; ;;                                         ;   ;; complete below using the output of `gcc -xc++ -E -v -`
;; ;;                                         ;   ;; TODO: use a more generic approach
;; ;;                                         ;   (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1" 'c++-mode)
;; ;;                                         ;
;; ;;                                         ;   ;;(semantic-add-system-include "/usr/local/include/boost" 'c++-mode)
;; ;;                                         ;   )
;; ;;                                         ; (add-hook 'c++-mode-hook 'falkor/semantic-include)
;; ;;                                         ; (use-package company-c-headers
;; ;;                                         ;   :config
;; ;;                                         ;   (progn
;; ;;                                         ;     (add-to-list 'company-c-headers-path-system "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1")
;; ;;                                         ;     )
;; ;;                                         ;   )


;; ;;     ;; (defun falkor/company-c-mode-common ()
;; ;;     ;;   (add-to-list 'company-backends 'company-semantic)
;; ;;     ;;   (add-to-list 'company-backends 'company-c-headers)
;; ;;     ;;   )
;; ;;     ;; (add-hook 'c-mode-common-hook 'falkor/company-c-mode-common)

;; ;;     ;; ----------------
;; ;;     ;; Semantic options
;; ;;     ;; see http://www.gnu.org/software/emacs/manual/html_node/semantic/Semantic-mode.html

;; ;;     ;; MANDATORY ;) parse the code whenever you’re idle
;; ;;     (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; ;;     ;; Store parsing results in a database
;; ;;     (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; ;;     ;; Display information about the current thing under the cursor when idle.
;; ;;     (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;; ;;     ;; Highlight local symbols which are the same as the thing under the cursor
;; ;;     (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

;; ;;     ;; Toggle Semantic Sticky Function mode in all Semantic-enabled buffers.
;; ;;     ;; displays a header line that shows the declaration line of the function or
;; ;;     ;; tag on the topmost line in the text area.
;; ;;     ;;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

;; ;;     ;; Activate semantic
;; ;;     (semantic-mode 1)

;; ;;     ;; -----------------
;; ;;     ;; GNU Emacs package for showing an inline arguments hint for the C/C++ function at point.
;; ;;     ;; This extension provides several commands that are useful for c++-mode:
;; ;;     ;; * `fa-show' -- show an overlay hint with current function arguments.
;; ;;     ;; * `fa-jump' -- jump to definition of current element of `fa-show'.
;; ;;     ;; * `moo-complete' -- a c++-specific version of `semantic-ia-complete-symbol'.
;; ;;     ;; * `moo-propose-virtual' -- in class declaration, list all virtual
;; ;;     ;;   methods that the current class can override.
;; ;;     ;; * `moo-propose-override' -- similar to `moo-propose-virtual', but lists all
;; ;;     ;;   inherited methods instead.
;; ;;     ;; * `moo-jump-local' -- jump to a tag defined in current buffer.

;; ;;                                         ; (use-package function-args
;; ;;                                         ;   :config (fa-config-default))
;; ;;                                         ;
;; ;;     (defun falkor/cedet-keybindings ()
;; ;;       (local-set-key (kbd "C-j")  'semantic-ia-fast-jump)
;; ;;       (local-set-key (kbd "C-p")  'semantic-analyze-proto-impl-toggle) ; ; swith to/from declaration/implement
;; ;;                                         ;   ;; function-args specific bindings
;; ;;                                         ;   (local-set-key (kbd "C-<tab>") 'moo-complete) ;  c++-specific version of semantic-ia-complete-symbol
;; ;;                                         ;   (local-set-key (kbd "M-o") 'fa-show)
;; ;;       )
;; ;;     (add-hook 'c-mode-common-hook 'falkor/cedet-keybindings)
;; ;;     (add-hook 'c-mode-hook        'falkor/cedet-keybindings)
;; ;;     (add-hook 'c++-mode-hook      'falkor/cedet-keybindings)))



;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; ;; ;; Enable EDE only in C/C++
;; ;; (require 'ede)
;; ;; (global-ede-mode)

;; ;; ;; company-c-headers
;; ;; (use-package company-c-headers
;; ;;   :init
;; ;;   (add-to-list 'company-backends 'company-c-headers))

;; ;; (use-package cc-mode
;; ;;   :init
;; ;;   (define-key c-mode-map  [(tab)]   'company-complete)
;; ;;   (define-key c++-mode-map  [(tab)] 'company-complete))


;; ;; Takes care of whitespaces discretely by fixing up whitespaces only for those
;; ;; lines you touched. Hence, you won’t add any trailing whitespaces without
;; ;; littering your commits with tons of noise.
;; (use-package ws-butler
;;   :commands ws-butler-mode
;;   :init (progn
;;           (add-hook 'c-mode-common-hook 'ws-butler-mode)
;;           (add-hook 'python-mode-hook 'ws-butler-mode)
;;           (add-hook 'cython-mode-hook 'ws-butler-mode)))

;; ;; (use-package auto-complete-c-headers
;; ;;   :init
;; ;;   (progn
;; ;;  (defun falkor/ac-c-header-init ()
;; ;;    (require 'auto-complete-c-headers)

;; ;;    (add-to-list 'ac-sources 'ac-source-c-headers)

;; ;;    ;; complete below using the output of `gcc -xc++ -E -v -`
;; ;;    (add-to-list 'achead:include-directories
;; ;;                '(("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1")
;; ;;                  ("."))))

;; ;;  (add-hook 'c++-mode-hook 'falkor/ac-c-header-init)
;; ;;  (add-hook 'c-mode-hook   'falkor/ac-c-header-init)))


;; ;; (defun falkor/semantic-init ()
;; ;;   (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1" 'c++-mode)
;; ;;   ;;(semantic-add-system-include "/usr/local/include/boost" 'c++-mode)

;; ;;   ;;  adds semantic as a suggestion backend to auto complete
;; ;;   ;; (add-to-list 'ac-sources 'ac-source-semantic))
;; ;;   )

;; ;; ;; ;; === Prepare CEDET binding ===
;; ;; (defun falkor/cedet-hook ()

;; ;;   ;; Intellisense menu
;; ;;   (local-set-key (read-kbd-macro "M-<return>") 'semantic-ia-complete-symbol-menu)
;; ;;   ;;  jump to declaration of variable or function, whose name is under point
;; ;;   (local-set-key "\C-j"  'semantic-ia-fast-jump)
;; ;;   (local-set-key "\C-p"  'semantic-analyze-proto-impl-toggle) ; swith to/from declaration/implement

;; ;;   ;; shows documentation for function or variable, whose names is under point
;; ;;   (local-set-key "\C-cd" 'semantic-ia-show-doc)     ; in a separate buffer
;; ;;   (local-set-key "\C-cs" 'semantic-ia-show-summary) ; in the mini-buffer


;; ;;   ;;(add-to-list 'ac-sources 'ac-source-semantic)
;; ;;   )

;; ;; (add-hook 'c-mode-common-hook 'falkor/cedet-hook)
;; ;; (add-hook 'c-mode-hook        'falkor/cedet-hook)
;; ;; (add-hook 'c++-mode-hook      'falkor/cedet-hook)
