;; Global configuration

(setq search-highlight         t)       ; highlight search object
(setq query-replace-highlight  t)       ; highlight query object
(auto-compression-mode         1)       ; transparently edit compressed files
(setq byte-compile-verbose     t)
(setq initial-major-mode 'text-mode)    ; to avoid autoloads for lisp mode
(setq require-final-newline t)          ; ensure a file ends in a newline when it

;; Saving Emacs Sessions (cursor position etc. in a previously visited file)
(require 'saveplace)
(setq-default save-place t)

;; Finding Files (and URLs) At Point (FFAP)
;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html
(require 'ffap)

;; Unique buffer names dependent on file name
(require 'uniquify)
;; style used for uniquifying buffer names with parts of directory name
(setq uniquify-buffer-name-style 'forward)

(require 'ansi-color)
