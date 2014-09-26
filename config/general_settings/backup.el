;; -*- mode: lisp -*-
;; Time-stamp: <Ven 2014-09-26 12:19 svarrette>
;; ===============================================
;;      Auto-save and backup files Management 
;; ===============================================

;; see http://www.emacswiki.org/emacs/BackupDirectory

(setq  backup-directory (get-conf-path ".backup/"))
(setq  auto-save-list-file-prefix (get-conf-path ".auto-save-list/.saves-"))

;; Set backup directory
;; store all backup and autosave files there
(setq backup-directory-alist
      `((".*" . ,backup-directory)))
(setq auto-save-file-name-transforms
      `((".*" , backup-directory t)))

(setq auto-save-list-file-name nil)     ; no .saves files
(setq auto-save-default        t)       ; auto saving
(setq make-backup-files        t)       ; make  backup files


;; ;; Set backup directory in /tmp
;; ;; store all backup and autosave files in the /tmp dir
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

(setq
 backup-by-copying t                    ; don't clobber symlinks
 ;; backup-directory-alist
 ;; '(("." . backup-directory ))           ; don't litter my fs tree
 delete-old-versions t                  ; delete excess backup versions silently
 kept-new-versions 6
 kept-old-versions 2
 version-control t)                     ; make numeric backup versions

;; ==== Save minibuffer history ===
(setq savehist-file (get-conf-path ".history"))
(savehist-mode 1)
(setq history-length 1000)
