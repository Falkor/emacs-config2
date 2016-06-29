;; -*- mode:lisp -*-
;; Time-stamp: <Lun 2014-11-10 12:25 svarrette>
;; ========================================================================
;; Setup basic look and feel for emacs (scrolling, fonts, color theme etc.)
;; ========================================================================
;;
(require 'cl-lib)


;; === defaults ===
(setq truncate-partial-width-windows nil)
(setq line-number-mode    t)
(setq column-number-mode  t)

;; === F... the beep ===
;;(setq visible-bell        t)  ;; this sucks under El Capitan
;; El Capitan work-around
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

;; === Default size of the frame ===
(set-frame-width (selected-frame) 145)
(set-frame-height (selected-frame) 60)

;; === remove the few annoyance of default emacs ===
;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; kill and move region directly
(delete-selection-mode t)
;; (pc-selection-mode)

;; === display current time in the status bar ===
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
;;(setq display-time-string-forms
;;      '(24-hours ":" minutes " " seconds))
;;(display-time-mode 1)

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
(use-package powerline)
(powerline-center-theme)


;; =================================================================
;; Emacs Color Theme
;; see http://www.emacswiki.org/emacs/ColorTheme
;; see http://code.google.com/p/gnuemacscolorthemetest/ For direct
;; screenshots
;; =================================================================
;; WITH color theme
(use-package color-theme
  :config
  (progn
	;; clean color-theme-libraries
	;;
	;; (message
	;; 	  (remove-if-not #'(lambda(line) (string-match "\\.el" line))
	;; 					 '(list color-theme-libraries)))
	;; Personnal Hotfix - srry
	;;(message (concat "****elpa package : "  (package--dir "elpa" "20080305.34/")))
	(color-theme-initialize)
	(setq color-theme-is-global t)
	(color-theme-vim-colors)))


;; === To better see the cursor ===
(setq default-frame-alist
      '((cursor-color . "green")
        (cursor-type . box)))
(set-default 'cursor-type 'box)

;; === See the end of the file ===
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; See also trailing whitespace
;;(setq-default show-trailing-whitespace t)

;; === Auto fit the size of the frame to the buffer content ===
;; see http://www.emacswiki.org/emacs/Shrink-Wrapping_Frames
;; run 'M-x fit-frame' for that
;;(require 'fit-frame)
;;(add-hook 'after-make-frame-functions 'fit-frame)


