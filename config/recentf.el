;; === Recentf mode ===
;; see http://www.emacswiki.org/emacs/RecentFiles
;; A minor mode that builds a list of recently opened files
(require 'recentf)

;;  file to save the recent list into
(setq recentf-save-file "~/.emacs.d/.recentf")

;; maximum number of items in the recentf menu
(setq recentf-max-menu-items 30)

;; save file names relative to my current home directory
(setq recentf-filename-handlers '(abbreviate-file-name))

(recentf-mode t)                        ; activate it