;; -------------------------------------------------------------------------
;; .emacs -- my personnal Emacs Init File
;;           see http://github.com/Falkor/emacs-config
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

;; keep all emacs-related stuff under ~/emacs.d
(defvar emacs-root "~/.emacs.d/"
  "the root of  personal emacs load-path.")

;; init PATH & exec-path from current shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))


;; add all the elisp directories under ~/emacs.d to my load path
(cl-labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path "include")
)


;; Emacs Modular Configuration entry point
;; See https://github.com/targzeta/emacs-modular-configuration
(require 'emacs-modular-configuration)


(load (concat emacs-root "config"))
