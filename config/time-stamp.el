
;; === Maintain last change time stamps (via Time-stamp: <>) ===
(require 'time-stamp)
;; format of the string inserted by `M-x time-stamp'
(setq time-stamp-format "%3a %:y-%02m-%02d %02H:%02M %u")
                                        ; `Weekday YYYY-MM-DD HH:MM USER'

;; update time stamps every time you save a buffer
(add-hook 'write-file-hooks 'time-stamp)
