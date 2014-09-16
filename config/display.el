;;
;; setup basic look and feel for emacs (scrolling, fonts, color theme etc.)
;;


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
(powerline-default-theme)
(setq powerline-color1 "#222")      ;; dark grey; 
(setq powerline-color2 "#444")      ;; slightly lighter grey
;; shape...
;; (setq powerline-arrow-shape 'arrow) ;; mirrored arrows, 
;; (setq powerline-color1 "grey22")
;; (setq powerline-color2 "grey40")
(custom-set-faces
   '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
    '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

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
