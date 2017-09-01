;; -*- mode: emacs-lisp; -*-
;;
;; Load package managers -- assumes you setup the variable packages-dir as the
;; root directory to host your packages. Then
;; * ELPA packages will be hosted in <packages-dir>/elpa/
;; * EL-get packages will be hosted in <packages-dir>/el-get/
;;

(require 'cl)
(require 'falkor/env)

;; =================================
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
                         ("melpa"     . "http://melpa.org/packages/")
                         ;;      ("marmalade" . "http://marmalade-repo.org/packages/")
                         ))

(setq package-user-dir     (concat packages-dir "elpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

;;
;; Define packages to install
;;
(defvar falkor/packages '(ace-jump-mode
                          alert
                          airline-themes
                          apache-mode
                          auctex
                          auto-compile
                          ;;auto-complete
                          ;;auto-complete-c-headers ; auto-complete source for C/C++ header files
                          autopair
                          ;;better-defaults
                          color-theme
                          company
                          company-auctex
                          company-c-headers
                          enh-ruby-mode
                          exec-path-from-shell
                          expand-region
                          feature-mode
                          fit-frame
                          find-file-in-project
                          flycheck
                          function-args
                          ggtags
                          git-timemachine
                          git-gutter-fringe
                          gitconfig-mode
                          guide-key
                          guide-key-tip
                          helm
                          helm-c-yasnippet
                          helm-gtags
                          helm-package
                          helm-projectile
                          helm-swoop
                          htmlize
                          indent-guide
                          irony
                          js2-mode
                          json-mode
                          latex-extra
                          lua-mode
                          ;;load-dir
                          magit
                          magit-gitflow
                          markdown-mode
                          markdown-toc
                          marmalade
                          mic-paren
                          neotree
                          nodejs-repl
                          org
                          pabbrev
                          pandoc-mode
                          paredit
                          php-mode
                          powerline
                          projectile
                          puppet-mode
                          restclient
                          robe
                          ruby-compilation
                          rvm
                          smart-compile
                          smart-tab
                          smart-tabs-mode
                          smartparens
                          smex
                          solarized-theme
                          sr-speedbar
                          use-package
                          web-mode
                          ws-butler
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

(setq el-get-dir           (concat packages-dir "el-get/"))
(setq el-get-status-file   (concat el-get-dir ".status.el"))
(setq el-get-autoload-file (concat el-get-dir ".loaddefs.el"))

(add-to-list 'load-path (concat el-get-dir "el-get"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

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
