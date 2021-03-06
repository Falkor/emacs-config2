;; Global configuration

;; Add menu bar
(menu-bar-mode   t)

(setq search-highlight         t)       ; highlight search object
(setq query-replace-highlight  t)       ; highlight query object
(setq byte-compile-verbose     t)
(setq initial-major-mode 'text-mode)    ; to avoid autoloads for lisp mode
(setq require-final-newline t)          ; ensure a file ends in a newline when it

;; Increase the lisp interpretor depth
;;(setq max-lisp-eval-depth 10000)

;; use *.el before *.elc if newer
(setq load-prefer-newer t)

;; Automatically fill comment
;; Bug on Latex mode
;; (setq comment-auto-fill-only-comments t)

;; Correct copy-paste to clipboard
(setq select-enable-clipboard t)
;; after mouse selection in X11, you can paste by `yank' in emacs
;;(Setq x-select-enable-primary t)
(setq mouse-drag-copy-region  t)

;; Technomancy better defaults -- see https://github.com/technomancy/better-defaults
;;(require 'better-defaults)
;;(use-package better-defaults)

;; Finding Files (and URLs) At Point (FFAP)
;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html
;;(require 'ffap)
(use-package ffap)


;; Unique buffer names dependent on file name
;;(require 'uniquify)
(use-package uniquify)

;; style used for uniquifying buffer names with parts of directory name
(setq uniquify-buffer-name-style 'forward)

;;(require 'ansi-color)
(use-package ansi-color)

;; === Sane defaults configurations ===

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)


;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system    'utf-8) ; pretty
(set-terminal-coding-system   'utf-8) ; pretty
(set-keyboard-coding-system   'utf-8) ; pretty
(set-selection-coding-system  'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Don't highlight matches with jump-char - it's distracting
(setq jump-char-lazy-highlight-face nil)

;; === Auto-fill  / visual-line configuration ===
;; automatic wrapping of lines and insertion of newlines when the cursor
;; goes over the column limit.
(setq-default fill-column 80)
;;(setq auto-fill-mode t)                 ; activate by default

;;Finally, visual-line-mode is so much better than auto-fill-mode. It doesn't
;;actually break the text into multiple lines - it only looks that way.
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
;;(global-subword-mode 1)

;; break lines for me, please
(setq-default truncate-lines nil)

;; Keep cursor away from edges when scrolling up/down
;;(require 'smooth-scrolling)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
;; (setq undo-tree-mode-lighter "")
;; (require 'undo-tree)
;; (global-undo-tree-mode)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))
