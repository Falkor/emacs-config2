;; -*- mode: lisp; -*-
;; Time-stamp: <Jeu 2014-09-25 15:19 svarrette>
;; ----------------------------------------------------------------------

;; --------------------------------
;; === ECB (Emacs Code Browser) ===
;; see http://ecb.sourceforge.net/
;; or  http://www.emacswiki.org/emacs/EmacsCodeBrowser
;; or  http://www.emacswiki.org/emacs/PracticalECB
(require 'ecb)
;;(require 'ecb-autoloads)

;; ;; /!\ Caution on ECB variable configuration
;; ;; see http://ecb.sourceforge.net/docs/setq-or-customize.html#setq-or-customize 
;; ;; for the options that shouldn't be configured via setq ;(

;; --- Annoyances
;; use the primary button to navigate in the source tree -- middle button otherwise (!?!)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-tip-of-the-day nil)           ; disable tips of the day
(setq ecb-version-check nil)			; to prevent ecb failing to start up

(setq ecb-history-sort-method nil)	 ; No sorting, means the most recently used
										; buffers are on the top of the history
                                        ; and the seldom used buffers at the bottom
;; (setq ecb-vc-enable-support t)          ; show versionning status of the files
;;                                         ; in the sources/hstory (SVN etc.)
;; ;; autostart ECB on emacs startup (put to nil to desactivate)
;; ;;(setq ecb-auto-activate t)


;; --- ECB layout ----
(setq ecb-create-layout-file (get-conf-path ".ecb-falkor-layout.el")) ; where my layout are saved
(setq ecb-windows-width 37)
(setq ecb-layout-name "falkor")

;; The "falkor" layout is as follows:
;; +------+-------+--------------------------------------+
;; |              |                                      |
;; |              |                                      |
;; | Directories  |                                      |
;; |              |                                      |
;; +--------------|          Edit                        |
;; |   History    |                                      |
;; |              |                                      |
;; +------+-------+                                      |
;; |              |                                      |
;; |   Methods    |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+

;; You can easily create your own layout using M-x ecb-create-new-layout
;; see ~/emacs.d/custom.el for the configuration of my own layout




