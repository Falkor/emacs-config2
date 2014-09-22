;; Running XEmacs ?
(defvar running-xemacs       (string-match "XEmacs" emacs-version))

;; Macro to be used later to differenciate code for GNU Emacs, XEmacs or
;; Carbon Emacs
(defmacro GNUEmacs (&rest body)
  "Execute any number of forms if running under GNU Emacs."
  (list 'if (not running-xemacs) (cons 'progn body)))
(defmacro XEmacs (&rest body)
  "Execute any number of forms if running under XEmacs."
  (list 'if running-xemacs (cons 'progn body)))
(defmacro CarbonEmacs (&rest body)
  "Execute any number of forms if running under Mac OS X port Carbon Emacs."
  (list 'if (featurep 'carbon-emacs-package) (cons 'progn body)))
;; To detect Carbon Emacs, use the following: 
;; (if (featurep 'carbon-emacs-package)
;;     (progn
;;       (something-to-do)
;;       (something-to-do)
;;       (something-to-do)
;;       ))
(defmacro Aquamacs (&rest body)
  "Execute any number of forms if running under Mac OS X port Aquamacs."
  (list 'if (featurep 'aquamacs) (cons 'progn body)))


;; === Special Mac OS X configuration (Carbon emacs and aquamacs)
;; Enhanced Carbon EMacs (ECE) plugin
;; see http://www.inf.unibz.it/~franconi/mac-emacs/
(CarbonEmacs
 (unless   (or (boundp 'enhanced-carbon-emacs) (boundp 'aquamacs-version))
   (defun load-local-site-start (site-lisp-directory)
     "Load site-start.el from a given site-lisp directory"
     (let ((current-default-directory default-directory))
       (setq default-directory site-lisp-directory)
       (normal-top-level-add-subdirs-to-load-path)
       (setq default-directory current-default-directory)
       (setq load-path (cons site-lisp-directory load-path))
       (load (concat site-lisp-directory "/site-start.el"))
       ))
   (load-local-site-start "/Library/Application Support/emacs/ec-emacs/site-lisp")))
