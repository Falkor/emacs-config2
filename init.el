;; -*- mode: emacs-lisp; -*-
;; -------------------------------------------------------------------------
;; Time-stamp: <Wed 2017-02-08 16:54 svarrette>
;;
;; .emacs -- my personnal Emacs Init File -- see http://github.com/Falkor/emacs-config2
;;
;;       _____     _ _              _
;;      |  ___|_ _| | | _____  _ __( )___     ___ _ __ ___   __ _  ___ ___
;;      | |_ / _` | | |/ / _ \| '__|// __|   / _ \ '_ ` _ \ / _` |/ __/ __|
;;      |  _| (_| | |   < (_) | |    \__ \  |  __/ | | | | | (_| | (__\__ \
;;      |_|  \__,_|_|_|\_\___/|_|    |___/ (_)___|_| |_| |_|\__,_|\___|___/
;;
;;
;; Copyright (c) 2000-2017 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             http://varrette.gforge.uni.lu
;;
;; -------------------------------------------------------------------------

;; Initialization - save start time

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst emacs-start-time (current-time))

(unless noninteractive
  (message "Loading %s..." load-file-name))

;; ;; Definitions
;; (defgroup falkor nil
;;   "Personal Emacs.d Settings"
;;   :version "0.1")

;; ;; Customization
;; (defcustom falkor-custom-packages
;;   '()
;;   "Custom Packages to install in addition to the default packages defined in falkor/packages"
;;   :group 'falkor
;;   :type  'list
;;   )

;; Common Lisp stuff all the time
(require 'cl)
;;(use-package cl-lib)

;; keep all emacs-related stuff under ~/emacs.d
(defvar emacs-root "~/.emacs.d/"
  "the root of my personal emacs load-path.")

;; Helper function for root path
(defun get-conf-path(path)
  "Appends argument at the end of emacs-root using expand-file-name"
  (expand-file-name path emacs-root))


;; ============================ Let's go! ============================
;; Turn off mouse interface early in startup to avoid momentary display
;; No splash screen please ...
(setq inhibit-startup-message t)

;; === Load path etc. ===
;; add all the elisp directories under ~/emacs.d to my load path
(cl-labels ((add-path (p)
                      (add-to-list 'load-path
                                   (concat emacs-root p))))
  (add-path "site-lisp")
  (add-path "core")
  )

(setq   custom-file    (get-conf-path "custom.el"))

;; === ENVIRONMENT ===
(load (get-conf-path "core/env"))
(require 'falkor/env)

;; === PACKAGES ===

;; ;; Define the custom packages
;; load falkor/custom/packages is existing
;; (setq custom-package-file (get-custom-path "packages.el"))
;; (if (file-readable-p custom-package-file)
;;  (load-file custom-package-file))

;; Now load/setup packages
(load (get-conf-path "core/packages"))

;; Set PATH
(exec-path-from-shell-copy-env "PATH")

;; === KEY LIBRARIES ===
;; Below are the key libraries you wish to see loaded asap
(require 'use-package)
(setq use-package-verbose nil)
;;(use-package load-dir)


(load (get-conf-path "core/utils"))
(load (get-conf-path "core/auto-complete"))

;; === Emacs Modular Configuration entry point ===
;; See https://github.com/targzeta/emacs-modular-configuration
;; ----
;; All sub configuration is delegated to the config/ directory
;; and you can then merge into a single config.el[c] by calling
;; `M-x emc-merge-config-files` or `make cfg`
(require 'emacs-modular-configuration)

(load (concat emacs-root "config"))

;; ===== Custom settings ====
;; Overwrite with the custom settings
;;(load-dir-one custom-dir)
(load custom-file 'noerror)


;;; Post initialization
(when window-system
  (let ((elapsed (float-time (time-subtract (current-time)
                                            emacs-start-time))))
    (message "Loading done (%.3fs)"  elapsed))

  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed (float-time (time-subtract (current-time)
                                                         emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed)))
            t))
