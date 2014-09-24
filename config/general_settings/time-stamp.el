;; -*- mode:lisp; -*-
;; === Maintain last change time stamps (via Time-stamp: <Dim 2014-09-21 09:21 svarrette>) ===
;;(require 'time-stamp)
(use-package time-stamp
  :init
  (progn
	;; format of the string inserted by `M-x time-stamp'
	(setq time-stamp-format "%3a %:y-%02m-%02d %02H:%02M %u")
                                        ; `Weekday YYYY-MM-DD HH:MM USER'

	;; update time stamps every time you save a buffer
	(add-hook 'write-file-hooks 'time-stamp)))


