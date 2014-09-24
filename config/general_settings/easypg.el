;; -*- mode: lisp; -*-
;; 
;; =======================================
;; === Auto Encryption (with GPG etc.) ===
;; =======================================
;; See http://www.emacswiki.org/emacs/EasyPG
(if (equal emacs-major-version 23)
 (require 'epa-setup))

;;(require 'epa-file)
;; (use-package epa-file
;;   :init
;;   (progn
;; 	(epa-file-enable)))

(epa-file-enable)
