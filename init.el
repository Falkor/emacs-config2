;; -------------------------------------------------------------------------
;; Time-stamp: <Mer 2014-09-17 01:35 svarrette>
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

;; Common Lisp stuff all the time
(require 'cl)
(require 'cl-lib)

;; keep all emacs-related stuff under ~/emacs.d
(defvar emacs-root "~/.emacs.d/"
  "the root of  personal emacs load-path.")

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; === Environement settings ===
;; init PATH & exec-path from current shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

;; easy way to load recursively all .el files
(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

;; ============================ Let's go! ============================
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode)   (menu-bar-mode   -1))
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
(setq package-user-dir (concat emacs-root "elpa"))
(setq custom-file      (concat emacs-root "custom.el"))
(setq custom-dir       (concat emacs-root "rc.custom"))
(setq defuns-dir       (concat emacs-root "defuns"))


;; Load Lisp defined functions
(load-directory defuns-dir)

;; === ELPA, the package manager ===
;; see http://tromey.com/elpa/
;; The code below is no longer required on Emacs 24
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize)
;;   (require 'init-elpa))
(require 'package)
(setq package-archives '(
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defvar falkor/packages '(auto-complete
                          autopair
                          color-theme
                          deft
                          el-get
                          erlang
                          feature-mode
                          flycheck
                          gist
                          go-mode
                          graphviz-dot-mode
                          haml-mode
                          haskell-mode
                          htmlize
                          idle-highlight
                          jabber
                          js2-mode
                          magit
                          markdown-mode
                          marmalade
                          mic-paren
                          nodejs-repl
                          org
                          paredit
                          php-mode
                          powerline
                          puppet-mode
                          restclient
                          ruby-mode
                          ruby-compilation
                          rvm
                          smart-tabs-mode
                          smex
                          solarized-theme
                          web-mode
                          yaml-mode)
  "Default packages")

;; Now install the default packages
(defun falkor/packages-installed-p ()
  (loop for pkg in falkor/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (falkor/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg falkor/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; =========== EL-Get =============
;; See https://github.com/dimitri/el-get

(require 'el-get)
(require 'el-get-status)
;;(setq el-get-byte-compile nil)
;; Load the local recipes
(add-to-list 'el-get-recipe-path (concat emacs-root "el-get/recipes"))

;; ECB for emacs 24
(setq el-get-sources
      '((:name ecb
               :type git
               :url "https://github.com/alexott/ecb.git"
               :load "ecb.el"
               :compile ("ecb.el"))
        ))
(setq my-packages
      (append '(el-get)
              (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)



;; === Emacs Modular Configuration entry point ===
;; See https://github.com/targzeta/emacs-modular-configuration
(require 'emacs-modular-configuration)

(load (concat emacs-root "config"))

;; ===== Custom settings ====
;; Overwrite with the custom settings
;;(load-directory custom-dir)
;;(load custom-file 'noerror)
