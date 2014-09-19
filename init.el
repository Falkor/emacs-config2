;; -------------------------------------------------------------------------
;; Time-stamp: <Ven 2014-09-19 16:59 svarrette>
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
;; Copyright (c) 2000-2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .             http://varrette.gforge.uni.lu
;;
;; -------------------------------------------------------------------------

;; Definitions
(defgroup falkor nil
  "Personal Emacs.d Settings"
  :version "0.1")

;; Customization
(defcustom falkor-custom-packages
  '()
  "Custom Packages to install in addition to the default packages defined in falkor/packages"
  :group 'falkor
  :type  'list
  )

;; Common Lisp stuff all the time
(require 'cl)
(require 'cl-lib)

;; keep all emacs-related stuff under ~/emacs.d
(defvar emacs-root "~/.emacs.d/"
  "the root of  personal emacs load-path.")

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; === Environement settings ===

;; Helper function for root path
(defun get-conf-path(path)
  "Appends argument at the end of emacs-root using expand-file-name"
  (expand-file-name path emacs-root))

;; init PATH & exec-path from current shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

;; ;; easy way to load recursively all .el files
;; (defun load-directory (directory)
;;   "Load recursively all `.el' files in DIRECTORY."
;;   (dolist (element (directory-files-and-attributes directory nil nil nil))
;;     (let* ((path (car element))
;;            (fullpath (concat directory "/" path))
;;            (isdir (car (cdr element)))
;;            (ignore-dir (or (string= path ".") (string= path ".."))))
;;       (cond
;;        ((and (eq isdir t) (not ignore-dir))
;;         (load-directory fullpath))
;;        ((and (eq isdir nil) (string= (substring path -3) ".el"))
;;         (load (file-name-sans-extension fullpath)))))))

;; ============================ Let's go! ============================
;; Turn off mouse interface early in startup to avoid momentary display
;;(if (fboundp 'menu-bar-mode)   (menu-bar-mode   -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode   -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ...
(setq inhibit-startup-message t)

;; === Load path etc. ===
;; add all the elisp directories under ~/emacs.d to my load path
(cl-labels ((add-path (p)
                      (add-to-list 'load-path
                                   (concat emacs-root p))))
  (add-path "site-lisp")
  )
;;(add-path "site-lisp/use-package")
(setq config-dir     (get-conf-path "config/"))
(setq defuns-dir     (get-conf-path "defuns"))
(setq packages-dir   (get-conf-path "packages/"))
(setq custom-file    (get-conf-path "custom.el"))
(setq custom-dir     (get-conf-path  "rc.custom/"))

;; Helper function to access custom files
(defun get-custom-path(path)
  "Appends argument at the end of custom-dir using expand-file-name"
  (expand-file-name path custom-dir))

;; === setup and evantually install [missing] packages ===
;; load falkor/custom/packages is existing
;; (setq custom-package-file (get-custom-path "packages.el"))
;; (if (file-readable-p custom-package-file)
;; 	(load-file custom-package-file))

;; Now load/setup packages
(load-file (get-conf-path "packages.el"))

(require 'load-dir)
;; Load Lisp defined functions
(load-dir-one defuns-dir)


;; === Special Mac OS X configuration (Carbon emacs and aquamacs)
;; Enhanced Carbon EMacs (ECE) plugin
;; see http://www.inf.unibz.it/~franconi/mac-emacs/
;; (CarbonEmacs
;;  (unless   (or (boundp 'enhanced-carbon-emacs) (boundp 'aquamacs-version))
;;    (defun load-local-site-start (site-lisp-directory)
;;      "Load site-start.el from a given site-lisp directory"
;;      (let ((current-default-directory default-directory))
;;        (setq default-directory site-lisp-directory)
;;        (normal-top-level-add-subdirs-to-load-path)
;;        (setq default-directory current-default-directory)
;;        (setq load-path (cons site-lisp-directory load-path))
;;        (load (concat site-lisp-directory "/site-start.el"))
;;        ))
;;    (load-local-site-start "/Library/Application Support/emacs/ec-emacs/site-lisp")))




;; ;; ======= Enhance initialization speed =======
;; ;; Some features are not loaded by default to minimize initialization time, so
;; ;; they have to be required (or loaded, if you will). require-calls tends to
;; ;; lead to the largest bottleneck's in a configuration. idle-require delays the
;; ;; require-calls to a time where Emacs is in idle. So this is great for stuff
;; ;; you eventually want to load, but is not a high priority.

;; (require 'idle-require)             ; Need in order to use idle-require
;; (dolist (feature
;;          '(alert
;;            apache-mode
;;            auto-compile             ; auto-compile .el files
;;            deft
;;            erlang
;;            gist
;;            go-mode
;;            gnuplot
;;            haml-mode
;;            jabber
;;            recentf                  ; recently opened files
;;            restclient
;;            smex                     ; M-x interface Ido-style.
;;            tex-mode
;;            webgen-mode))               ; TeX, LaTeX, and SliTeX mode commands
;;   (idle-require feature))

;; (setq idle-require-idle-delay 5)
;; (idle-require-mode 1)



;; === Emacs Modular Configuration entry point ===
;; See https://github.com/targzeta/emacs-modular-configuration
(require 'emacs-modular-configuration)

(load (concat emacs-root "config"))

;; ===== Custom settings ====
;; Overwrite with the custom settings
(load-dir-one custom-dir)
(load custom-file 'noerror)
