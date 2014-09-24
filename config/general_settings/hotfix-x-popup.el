;; -*- mode: lisp; -*-
;; Time-stamp: <Mer 2014-09-17 21:52 svarrette>
;;
;; hotfix-x-popup.el - Hotfix on emacs popup dialogs on Mac OS X that freeze
;; see http://superuser.com/questions/125569/how-to-fix-emacs-popup-dialogs-on-mac-os-x
;; ----------------------------------------------------------------------

(when is-mac
  (defadvice yes-or-no-p (around prevent-dialog activate)
    "Prevent yes-or-no-p from activating a dialog"
    (let ((use-dialog-box nil))
      ad-do-it))
  (defadvice y-or-n-p (around prevent-dialog-yorn activate)
    "Prevent y-or-n-p from activating a dialog"
    (let ((use-dialog-box nil))
      ad-do-it)))
