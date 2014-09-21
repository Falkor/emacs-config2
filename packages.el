;; -*- mode: lisp; -*-
;;
;; Load package managers -- assumes you setup the variable packages-dir as the
;; root directory to host your packages. Then
;; * ELPA packages will be hosted in <packages-dir>/elpa/
;; * EL-get packages will be hosted in <packages-dir>/el-get/
;;

(require 'cl)

;; === ELPA, the package manager ===
;; see http://tromey.com/elpa/
;; The code below is no longer required on Emacs 24
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize)
;;   (require 'init-elpa))
(require 'package)


;; === setup packages sources ===
(setq package-archives '(
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")
                                        ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ))
(setq package-user-dir  (concat packages-dir "elpa/"))
(package-initialize)


;;
;; Define packages to install
;;
(defvar falkor/packages '(alert
                          apache-mode
                          auto-complete
                          autopair
                          better-defaults
						  cl-lib
                          color-theme
                          deft
                          el-get
						  erc-terminal-notifier
                          erlang
                          feature-mode
                          fit-frame
                          find-file-in-project
                          flycheck
                          gist
                          go-mode
                          graphviz-dot-mode
                          haml-mode
                          haskell-mode
                          helm
                          htmlize
                          idle-require
                          idle-highlight
                          jabber
                          js2-mode
                          load-dir
                          magit
                          markdown-mode
                          marmalade
                          mic-paren
                          neotree
                          nodejs-repl
                          org
                          paredit
                          php-mode
                          powerline
                          puppet-mode
                          restclient
                          ruby-compilation
                          rvm
						  smart-compile
                          smart-tab
                          smart-tabs-mode
                          smex
                          solarized-theme
                          use-package
                          web-mode
                          yaml-mode
                          yasnippet)
  "Default packages")

;; Eventually load custom configuration
;; (defvar falkor/custom/packages 
;;   nil
;;   "Custom List of packages")

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
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))


(setq el-get-dir (concat packages-dir "el-get/"))
(setq el-get-status-file   (concat el-get-dir ".status.el"))
(setq el-get-autoload-file (concat el-get-dir ".loaddefs.el"))

(require 'el-get)

;;(setq el-get-byte-compile nil)
;; Load the local recipes
(add-to-list 'el-get-recipe-path (concat el-get-dir "recipes"))

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
