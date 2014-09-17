;; ~/.emacs.d/config.el -- Emacs configurations

;; Generated by Emacs Modular Configuration version 0.1
;; DO NOT EDIT THIS FILE.
;; Edit the files under '~/.emacs.d/config' directory tree, 
;; then run within emacs 'M-x emc-merge-config-files'

;; ############################################################################
;; Config file: ~/.emacs.d/config/auto-insert.el
;; ========================================================
;; Auto-insert: automatic insertion of text into new files
;; ========================================================

(require 'auto-insert-tkld)    ; see ~/.emacs.d/site-lisp/auto-insert-tkld.el
;; doc:  ~/.emacs.d/site-lisp/auto-insert-tkld.pdf
(setq auto-insert-path (cons (concat emacs-root "auto-insert") auto-insert-path))
;; trick to abstract the personal web page
;;(setq auto-insert-organisation  user-www)
(setq auto-insert-automatically t)
;; associate file extention to a template name
(setq auto-insert-alist
      '(
        ("\\.tex$"         . "LaTeX")            ; TeX or LaTeX
        ("\\.bib$"         . "BibTeX")           ; BibTeX
        ("\\.sty$"         . "LaTeX Style")      ; LaTeX Style
        ("\\.el$"          . "Emacs Lisp")       ; Emacs Lisp
        ("\\.java$"        . "Java")             ; Java
        ("\\App.java$"     . "JavaSwing")        ; Java Swing app
        ("[Tt]ools.h"      . "Tools C++")        ; Useful functions in C/C++
        ("\\Logs.cpp"      . "Logs C++")         ; Macros for logs/debugging
        ("\\Logs.h[+p]*"   . "Logs C++ Include") ; " header file
        ("\\.c$"           . "C")                ; C
        ("\\.h$"           . "C Include")        ; C header file
        ("\\.cxx$"         . "C++")              ; C++
        ("\\.c\\+\\+$"     . "C++")              ;
        ("\\.cpp$"         . "C++")              ;
        ("\\.cc$"          . "C++")              ;
        ("\\.C$"           . "C++")              ;
        ("[Mm]akefile$"    . "Makefile")         ; Makefile
        ("[Mm]akefile.am$" . "Makefile.am")      ; Makefile.am (Automake)
        ("\\.md$"          . "Text")             ; Text
        ("\\.txt$"         . "Text")             ; Text
        ("\\.gpg$"         . "GPG")              ; GPG 
        ("[Rr]eadme$"      . "Readme")           ; Readme
        ("README$"         . "Readme")           ;
        ("\\.sh$"          . "Shell")            ; Shell
        ("\\.csh$"         . "Shell")            ;
        ("\\.tcsh$"        . "Shell")            ;
        ("\\.html"         . "Html")             ; HTML
        ("\\.wml"          . "WML")              ; WML (Website Meta Language)
        ("\\.php"          . "PHP")              ; PHP
        ("\\.gnuplot"      . "Gnuplot")          ; Gnuplot
        ("\\.pl$"          . "Perl")             ; Perl
        ("\\.pm$"          . "Perl Module")      ; PerlModule
        ("\\.t$"           . "Perl Test")        ; Perl Test script
        ("\\.pp$"          . "Puppet")           ; Puppet manifest
        ("\\.rb$"          . "Ruby")             ; Ruby
        ("\\.R$"           . "R")                ; R
        ("\\.admission_rule[s]?$" . "OAR")              ; OAR admission rule
        (""                . "Shell") ; Shell (by default: assume a shell template)
        ))
;; now associate a template name to a template file
(setq auto-insert-type-alist
      '(
        ("LaTeX"       . "insert.tex")
        ("BibTeX"      . "insert.bib")
        ("LaTeX Style" . "insert.sty")
        ("Emacs Lisp"  . "insert.el")
        ("Java"        . "insert.java")
        ("JavaSwing"   . "insertApp.java")
        ("C"           . "insert.c")
        ("C Include"   . "insert.h")
        ("C++"         . "insert.cpp")
        ("Tools C++"   . "insert.tools_cpp.h")
        ("Logs C++"    . "insert.logs.cpp")
        ("Logs C++ Include" . "insert.logs.h")
        ("Makefile"    . "insert.makefile")
        ("Makefile.am" . "insert.makefile.am")
        ("Text"        . "insert.md")
        ("GPG"         . "insert.gpg")
        ("Readme"      . "insert.readme")
        ("Shell"       . "insert.shell")
        ("Html"        . "insert.html")
        ("WML"         . "insert.wml")
        ("PHP"         . "insert.php")
        ("Gnuplot"     . "insert.gnuplot")
        ("Perl"        . "insert.pl")
        ("Perl Module" . "insert.pm")
        ("Perl Test"   . "insert.t")
        ("Puppet"      . "insert.pp")
        ("Ruby"        . "insert.rb")
        ("R"           . "insert.R")
        ("OAR"         . "insert.oar")
        ))

;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/backup.el
;; === Auto-save and backup files ===
(setq auto-save-list-file-name nil)     ; no .saves files
(setq auto-save-default        t)       ; auto saving
(setq make-backup-files        t)       ; make  backup files
;; see http://www.emacswiki.org/emacs/BackupDirectory
(setq
 backup-by-copying t                    ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))                  ; don't litter my fs tree
 delete-old-versions t                  ; delete excess backup versions
                                        ; silently
 kept-new-versions 6
 kept-old-versions 2
 version-control t)                     ; make numeric backup versions
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/completion.el
;; === Code completion ===
;; see http://www.emacswiki.org/emacs/TabCompletion
(require 'smart-tab)
(global-smart-tab-mode t)

;; Disable indent "smart" alignement to insert real tabs
(defun indent-with-real-tab-hook ()
  (setq indent-line-function 'insert-tab)
  )
;;(add-hook 'text-mode-hook   'indent-with-real-tab-hook)
(add-hook 'conf-mode-hook   'indent-with-real-tab-hook)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/display.el
;;
;; setup basic look and feel for emacs (scrolling, fonts, color theme etc.)
;;


;; === defaults ===
(setq truncate-partial-width-windows nil)
(setq line-number-mode    t)
(setq column-number-mode  t)

;; === F... the beep ===
(setq visible-bell        t)

;; === Default size of the frame ===
(set-frame-width (selected-frame) 120)
(set-frame-height (selected-frame) 40)

;; === remove the few annoyance of default emacs ===
;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; kill and move region directly
(delete-selection-mode t)
;; (pc-selection-mode)

;; === display current time in the status bar ===
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
(setq display-time-string-forms
      '(24-hours ":" minutes " " seconds))
(display-time-mode 1)

;;
;; === Specify the frame title ===
;; see http://www.emacswiki.org/emacs/FrameTitle
;; recognize the same special characters as mode-line-format variable, mainly:
;;    %b -- print buffer name.      %f -- print visited file name.
;;    %F -- print frame name.
;;    %* -- print %, * or hyphen.   %+ -- print *, % or hyphen.
;;          %& is like %*, but ignore read-only-ness.
;;          % means buffer is read-only and * means it is modified.
;;          For a modified read-only buffer, %* gives % and %+ gives *.
;;    %m -- print the mode name.
;;    %z -- print mnemonics of buffer, terminal, and keyboard coding systems.
;;    %Z -- like %z, but including the end-of-line format.
;;    %[ -- print one [ for each recursive editing level.  %] similar.
;;    %% -- print %.   %- -- print infinitely many dashes.
;;  Decimal digits after the % specify field width to which to pad.
(setq frame-title-format '(buffer-file-name "emacs: %b (%f)" "emacs: %b"))

;; =================================================================
;; Font selection (to use a mono-spaced (non-proportional) font)
;; =================================================================
;; Snow Leopard users may try Menlo-12, other should consider Monaco-12.
(add-to-list 'default-frame-alist '(font . "Monaco-12"))

;; =================================================================
;; Powerline Status Bar
;; =================================================================
;; See https://github.com/milkypostman/powerline
;; inspired by [vim-powerline](https://github.com/Lokaltog/vim-powerline).
(require 'powerline)
(powerline-center-theme)
;; shape...
;; (setq powerline-arrow-shape 'arrow) ;; mirrored arrows,
;; (setq powerline-color1 "DarkGrey")
;; (setq powerline-color2 "honeydew1")
;; (custom-set-faces
;;  '(powerline-active1 '((t (:background "DarkGrey"  :inherit mode-line))))
;;  '(powerline-active2 '((t (:background "honeydew1" :inherit mode-line)))))

;; (custom-theme-set-faces
;;  'color-theme-vim-insert-mode
;;  `(powerline-active1 ((t (:background "DarkGrey"    :inherit mode-line))))
;;  `(powerline-active2 ((t (:background "honeydew1"   :inherit mode-line))))
;;  `(powerline-inactive1 ((t (:background "gray71"    :inherit mode-line-inactive))))
;;  `(powerline-inactive2 ((t (:background "honeydew3" :inherit mode-line-inactive)))))

;; (setq powerline-color1 "grey22")
;; (setq powerline-color2 "grey40")
;; (custom-set-faces
;;  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; (when (and (buffer-file-name (current-buffer)) vc-mode)
;;     (if (vc-workfile-unchanged-p (buffer-file-name (current-buffer)))
;;       (powerline-vc 'powerline-insert-face 'r)
;;       (powerline-vc 'powerline-normal-face 'r)))



;; =================================================================
;; Emacs Color Theme
;; see http://www.emacswiki.org/emacs/ColorTheme
;; see http://code.google.com/p/gnuemacscolorthemetest/ For direct
;; screenshots
;; =================================================================
;; WITH color theme
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

(color-theme-vim-colors)

;; To better see the cursor
(setq default-frame-alist
      '((cursor-color . "green")
        (cursor-type . box)))
(set-default 'cursor-type 'box)

;; === See the end of the file ===
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; See also trailing whitespace
(setq-default show-trailing-whitespace t)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/filladapt.el
;; =============================================
;; Activate fill adapt
;; see http://www.emacswiki.org/emacs/FillAdapt
;; =============================================
(require 'filladapt)
;; turn on filladapt mode everywhere but in ChangeLog files
(setq-default filladapt-mode nil)
(cond ((equal mode-name "Change Log")
       t)
      (t
       (turn-on-filladapt-mode)))

;; (add-hook 'c-mode-common-hook
;; 	  (lambda ()
;; 	    (when (featurep 'filladapt)
;; 	      (c-setup-filladapt))))
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/global.el
;; Global configuration

(setq search-highlight         t)       ; highlight search object
(setq query-replace-highlight  t)       ; highlight query object
(setq byte-compile-verbose     t)
(setq initial-major-mode 'text-mode)    ; to avoid autoloads for lisp mode
(setq require-final-newline t)          ; ensure a file ends in a newline when it

;; Correct copy-paste to clipboard
(setq x-select-enable-clipboard t)
;; after mouse selection in X11, you can paste by `yank' in emacs
;;(Setq x-select-enable-primary t)
(setq mouse-drag-copy-region  t)

;; Technomancy better defaults -- see https://github.com/technomancy/better-defaults
(require 'better-defaults)

;; Saving Emacs Sessions (cursor position etc. in a previously visited file)
(require 'saveplace)
(setq-default save-place t)

;; Finding Files (and URLs) At Point (FFAP)
;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html
(require 'ffap)

;; Unique buffer names dependent on file name
(require 'uniquify)
;; style used for uniquifying buffer names with parts of directory name
(setq uniquify-buffer-name-style 'forward)

(require 'ansi-color)


;; === Sane defaults configurations ===

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Don't highlight matches with jump-char - it's distracting
(setq jump-char-lazy-highlight-face nil)

;; === Auto-fill configuration ===
;; automatic wrapping of lines and insertion of newlines when the cursor
;; goes over the column limit.
(setq-default fill-column 80)
(setq auto-fill-mode t)                 ; activate by default

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Keep cursor away from edges when scrolling up/down
;;(require 'smooth-scrolling)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
;; (setq undo-tree-mode-lighter "")
;; (require 'undo-tree)
;; (global-undo-tree-mode)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

;; Turn on auto completion
;; See http://www.emacswiki.org/emacs/AutoComplete
(require 'auto-complete-config)
(ac-config-default)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/ido.el
;; ido

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/indent.el
;; === Indenting configuration ===
;; see http://www.emacswiki.org/emacs/IndentationBasics
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 	 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; === Show whitespaces/tabs etc. ===
(setq x-stretch-cursor t)

;; === Get ride of tabs most of the time ===
(setq-default indent-tabs-mode nil)     ; indentation can't insert tabs

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)


;; (setq c-brace-offset -2)
;;(setq c-auto-newline t)
;; (add-hook 'c-mode-common-hook (lambda () (setq c-basic-offset 4)))
;; (add-hook 'c-mode-common-hook (lambda () (setq c-recognize-knr-p nil)))
;; (add-hook 'ada-mode-hook (lambda ()      (setq ada-indent 4)))
;; (add-hook 'perl-mode-hook (lambda ()     (setq perl-basic-offset 4)))
;; (add-hook 'cperl-mode-hook (lambda ()    (setq cperl-indent-level 4)))
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/parenthesis.el
;; === Show matching parenthesis ===
(require 'paren)
(GNUEmacs
 (show-paren-mode t)
 (setq show-paren-ring-bell-on-mismatch t))
(XEmacs
 (paren-set-mode 'paren))

(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "turquoise")
;; (set-face-attribute 'show-paren-match-face nil 
;;                     :weight 'bold :underline nil :overline nil :slant 'normal)
(set-face-foreground 'show-paren-mismatch-face "red") 
(set-face-attribute 'show-paren-mismatch-face nil 
                    :weight 'bold :underline t :overline nil :slant 'normal)


;; show matching parenthesis, even if found outside the present screen.
;; see http://www.emacswiki.org/emacs/MicParen
(require 'mic-paren)                    ; loading
(paren-activate)                        ; activating


;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/recentf.el
;; === Recentf mode ===
;; see http://www.emacswiki.org/emacs/RecentFiles
;; A minor mode that builds a list of recently opened files
(require 'recentf)

;;  file to save the recent list into
(setq recentf-save-file "~/.emacs.d/.recentf")

;; maximum number of items in the recentf menu
(setq recentf-max-menu-items 30)

;; save file names relative to my current home directory
(setq recentf-filename-handlers '(abbreviate-file-name))

(recentf-mode t)                        ; activate it
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/saveplace.el
;; Saving Emacs Sessions (cursor position etc. in a previously visited file)
(require 'saveplace)
(setq-default save-place t)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/time-stamp.el

;; === Maintain last change time stamps (via Time-stamp: <>) ===
(require 'time-stamp)
;; format of the string inserted by `M-x time-stamp'
(setq time-stamp-format "%3a %:y-%02m-%02d %02H:%02M %u")
                                        ; `Weekday YYYY-MM-DD HH:MM USER'

;; update time stamps every time you save a buffer
(add-hook 'write-file-hooks 'time-stamp)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/user.el
;; User configuration / Identity
(setq user-full-name    "Sebastien Varrette")
(setq user-mail-address "<Sebastien.Varrette@uni.lu>")
(setq user-www          "http://varrette.gforge.uni.lu")
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/modes/autopair.el
;; ==============================================================
;; Autopair: Automagically pair braces and quotes like TextMate
;; see http://code.google.com/p/autopair/ or 
;; http://www.emacswiki.org/emacs/AutoPairs
;; ==============================================================
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers 
(setq autopair-autowrap t) 
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/modes/helm.el
;; Configure helm mode
;; see http://emacs-helm.github.io/helm/
(helm-mode 1)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/modes/org.el
;; Settings for org-mode
;; See http://www.aaronbedra.com/emacs.d/#org-mode

;; === Settings ===
;; Enable logging when tasks are complete. This puts a time-stamp on the
;; completed task. Since I usually am doing quite a few things at once, I added
;; the INPROGRESS keyword and made the color blue. Finally, enable flyspell-mode
;; and writegood-mode when org-mode is active.

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))

;; === org-agenda ===

(setq org-rootdir "~/Dropbox/SyncFolder/org/")

(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)
(setq org-agenda-files (concat org-rootdir "personal.org"))
;; (setq org-agenda-files (list "~/Dropbox/org/personal.org"
;;                              "~/Dropbox/org/groupon.org"))

;; === org-habbit ===
(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")
(setq org-habit-preceding-days 7
      org-habit-following-days 1
      org-habit-graph-column 80
      org-habit-show-habits-only-for-today t
      org-habit-show-all-today t)


;; === org-babel ===
;; org-babel is a feature inside of org-mode that makes this document possible.
;; It allows for embedding languages inside of an org-mode document with all the
;; proper font-locking. It also allows you to extract and execute code. It isn't
;; aware of Clojure by default, so the following sets that up.
(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (dot . t)
   (ruby . t)))

(add-to-list 'org-src-lang-modes (quote ("dot". graphviz-dot)))

(defvar org-babel-default-header-args:clojure
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  (lisp-eval-string body)
  "Done!")

(provide 'ob-clojure)

(setq org-src-fontify-natively t
      org-confirm-babel-evaluate nil)

(add-hook 'org-babel-after-execute-hook (lambda ()
                                          (condition-case nil
                                              (org-display-inline-images)
                                            (error nil)))
          'append)


;; ==== org-abbrev ===

(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

(define-skeleton skel-org-block-elisp
  "Insert an emacs-lisp block"
  ""
  "#+begin_src emacs-lisp\n"
  _ - \n
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "selisp" "" 'skel-org-block-elisp)

(define-skeleton skel-header-block
  "Creates my default header"
  ""
  "#+TITLE: " str "\n"
  "#+AUTHOR: Aaron Bedra\n"
  "#+EMAIL: aaron@aaronbedra.com\n"
  "#+OPTIONS: toc:3 num:nil\n"
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" />\n")

(define-abbrev org-mode-abbrev-table "sheader" "" 'skel-header-block)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/modes/smart-tabs.el
;; === Smart Tabs ===
;; see http://www.emacswiki.org/emacs/SmartTabs

(smart-tabs-insinuate 'c 'javascript 'ruby 'python)
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/bindings/global.el
;; ----------------------------------------------------------------------
;; File: bindings/global.el - setup my gloabl key bindings in emacs
;;       Part of my emacs configuration (see ~/.emacs or init.el)
;;
;; Creation:  08 Jan 2010
;; Time-stamp: <Mer 2014-09-17 21:37 svarrette>
;;
;; Copyright (c) 2010-2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;;               http://varrette.gforge.uni.lu
;;
;; More information about Emacs Lisp:
;;              http://www.emacswiki.org/emacs/EmacsLisp
;; ----------------------------------------------------------------------
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;; ----------------------------------------------------------------------

;; === Always indent on return ===
(global-set-key (kbd "RET") 'newline-and-indent)

;; Use helm to open files
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x C-g") 'helm-git-find-file)


;; === Another comment binding (also M-;) ===
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; === Git stuff ===
(global-set-key (kbd "C-x g") 'magit-status)

;; === Buffer switching ===
;; C-x b permits to switch among the buffer by entering a buffer name,
;; with completion.
;; See http://www.emacswiki.org/emacs/IswitchBuffers
(require 'iswitchb)
(iswitchb-mode t)
;; to ignore the *...* special buffers from the list
(setq iswitchb-buffer-ignore '("^ " "*Buffer"))

;; Move from one buffer to another using 'C-<' and 'C->'
;;(load "cyclebuffer" nil 't)
;;(global-set-key (kbd "C-<") 'cyclebuffer-forward)
;;(global-set-key (kbd "C->") 'cyclebuffer-backward)
(global-set-key (kbd "C-<") 'previous-buffer)
(global-set-key (kbd "C->") 'next-buffer)

;; === helm ===
(global-set-key (kbd "C-c h") 'helm-mini)

;; === Window switching ===
(global-set-key [C-prior] 'other-window)
(global-set-key [C-next]  'other-window)

;; === Font size ===
;; I may prefer C-+ and C-- for window enlarge/schrink
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; === Multi speed mouse scrolling ===
;; scroll:         normal speed
;; Ctrl + scroll:  high speed
;; Shift + scroll: low  speed
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;; === Navigation ===
(global-set-key [kp-home]  'beginning-of-buffer) ; [Home]
(global-set-key [home]     'beginning-of-buffer) ; [Home]
(global-set-key [kp-end]   'end-of-buffer)       ; [End]
(global-set-key [end]      'end-of-buffer)       ; [End]

;; goto next error (raised in the compilation buffer typically)
(global-set-key (kbd "C-x n") 'next-error)
(global-set-key (kbd "C-x p") 'previous-error)

(global-set-key (kbd "M-n") 'goto-line)          ; goto line number

;; === ECB / NerdTree like ===
;; (use-package  neotree
;; 			  :bind "f1" 'neotree-toggle)
(require 'neotree)

(global-set-key [(f1)] 'neotree-project-dir) ; open neotree at the git root dir
(global-set-key [(f2)] 'ecb-toggle) ; Activate ECB (see ~/.emacs.d/init-cedet)

;; === Shell pop ===
(global-set-key [(f3)]     'shell-pop)

;; Speedbar

                                        ;(global-set-key [(f4)] 'speedbar-get-focus)      ; jump to speedbar frame
;;(require 'sr-speedbar)
;;(speedbar 1)

;; (global-set-key [(f4)] 'sr-speedbar-toggle)       ; jump to speedbar frame

;; find matching parenthesis (% command in vim: Go to the matching parenthesis,
;; if on parenthesis; otherwise, insert '%')
;; see ~/.emacs.d/init-defuns.el
;; in practice, it's annoying when writing a C code with printf format so I
;; decided to rebind it to something different that '%'
(global-set-key (kbd "C-c C-p") 'match-paren)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; === Compilation ===
(global-set-key (kbd "C-x C-e") 'smart-compile)
;;(define-key ruby-mode-map [remap ruby-send-last-sexp ] nil)

;; === Kill this buffer ===
(global-set-key (kbd "C-q") 'kill-this-buffer)

;; === Launch a shell ===
(global-set-key (kbd "C-!") 'shell)

;; === Re-indent the full file (quite useful) ===
(global-set-key (kbd "C-c i") 'indent-buffer)   ;
(global-set-key (kbd "C-c n") 'cleanup-buffer)  ;



;; === yank and indent copied region ===
(global-set-key (kbd "M-v")  'yank-and-indent)


;; === Search [and replace] ===
                                        ; Use regex searches by default.
(global-set-key (kbd "C-s")   'isearch-forward)
(global-set-key (kbd "\C-r")  'isearch-backward)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-q")   'query-replace)


;; === Instant messaging ===
;; see http://www.emacswiki.org/emacs/CategoryChatClient
;; TO BE TRIED LATER
                                        ;(global-set-key (kbd "C-c j") (lambda () (interactive) (switch-or-start 'jabber-connect "*-jabber-*")))
                                        ;(global-set-key (kbd "C-c M-j") 'jabber-disconnect)

                                        ;(global-set-key (kbd "C-c i")
                                        ;               (lambda () (interactive)
                                        ;                 (switch-or-start (lambda () (rcirc-connect "irc.freenode.net"))
                                        ;                                  "*irc.freenode.net*")))


;; === Emacs Org ===
;; An Emacs Mode for Notes, Project Planning, and Authoring
;; see http://www.emacswiki.org/emacs/OrgMode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; === Flyspell ===
(global-set-key (kbd "C-c C-i w")  'ispell-word)
(global-set-key (kbd "C-c C-i b")  'ispell-buffer)




;; ===============================
;;  BINDINGS INDUCED BY SUB-MODES
;; ===============================

;; * comment and uncomment a region in a buffer is done via 'M-;'

;; * LaTeX-mode: see AucTeX manual.
;;   Some additionnal notes:
;;   - make a LaTeX reference (to a label) by pressing `C-c )'
;;   - insert a label by pressing `C-c (' (or `C-('
;;   - insert a citation by pressing `C-c [' (or `C-['
;;   - hit `C-c ='; the buffer will split into 2 and in the top half you
;;     will see a TOC, hitting `l' there will show all the labels and cites.
;;   - M-<ret> invoke a template from Yasnippet
;;   - C-<ref> insert a \item

;; * C-x d    open dired (for directory browsing), see ~/.emacs.d/dired-refcard.gnu.pdf
;;            Note: I bind 'p' once on a file to run the 'open' command on this file
;;            See ~/.emacs.d/init-emodes.el (section Dired)

;; * SVN: see menu Tools/Version Control (C-x v v to commit for instance)

;; * GIT (i.e. magit): see ~/.emacs.d/init-emodes.el

;; * Programming stuff:
;;   Most useful:
;;    - 'C-t C-t' to invoke a template from tempo (see ~/.emacs.d/tempo-c-cpp.el)
;;    - 'M-<ret>' to invoke a template from Yasnippet (see ~/.emacs.d/init-emodes.el)
;;    - 'C-<ret>' to invoke semantic menu (see ~/.emacs.d/init-cedet.el)

;; * CEDET: see ~/.emacs.d/init-cedet.el

;; * nxHtml: see ~/.emacs.d/init-emodes.el, in particular C-<ret> is bind in
;;  this case to popup the complete-tag menu very useful when editing some
;;  [x]html file





;;(provide 'init-bindings)
;; ----------------------------------------------------------------------
;; eof
;;
;; Local Variables:
;; mode: lisp
;; End:
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/bindings/mac.el
;; Special configuration for Mac 

;; (Aquamacs
(when is-mac
  (setq
   ns-command-modifier 'meta         ; Apple/Command key is Meta
   ns-alternate-modifier nil         ; Option is the Mac Option key
   ;;ns-use-mac-modifier-symbols  nil  ; display standard Emacs (and not standard Mac) modifier symbols)
   ))

;;  (require 'redo)
;;  (require 'mac-key-mode)
;;  (mac-key-mode 1)
;;  (setq
;;   ns-command-modifier 'meta         ; Apple/Command key is Meta
;;   ns-alternate-modifier nil         ; Option is the Mac Option key
;;   ;;ns-use-mac-modifier-symbols  nil  ; display standard Emacs (and not standard Mac) modifier symbols)
;;   )
;;  )
;; ############################################################################


;; ~/.emacs.d/config.el ends here