;;
;; setup basic look and feel for emacs (scrolling, fonts, color theme etc.)
;;

;; === Turn off mouse interface early in startup to avoid momentary display ===
;; You really don't need these (except perhaps the menu-bar); trust me.
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode nil))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode nil))

;; === disable scroll bar ===
;; may be useful - replace 't' by 'nil' to disable right scrollbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode nil))

;; === defaults === 
(setq truncate-partial-width-windows nil)
(setq line-number-mode         t)
(setq column-number-mode       t)
(setq visible-bell             t)
 
; === Default size of the frame ===
(set-frame-width (selected-frame) 120)
(set-frame-height (selected-frame) 40)

;; === remove the few annoyance of default emacs ===
;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p) 

;; remove initial message 
(setq inhibit-startup-message t)

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
