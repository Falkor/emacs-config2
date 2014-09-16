;; === Auto-save and backup files ===
(setq auto-save-list-file-name nil)     ; no .saves files
(setq auto-save-default        t)       ; auto saving
(setq make-backup-files        t)       ; make  backup files
;; see http://www.emacswiki.org/emacs/BackupDirectory
(setq
 backup-by-copying t                    ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))                  ; don't litter my fs tree
 delete-old-versions t                  ; delete excess backup versions
                                        ; silently
 kept-new-versions 6
 kept-old-versions 2
 version-control t)                     ; make numeric backup versions
