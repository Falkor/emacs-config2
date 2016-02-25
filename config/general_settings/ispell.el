;; -*- mode: emacs-lisp; -*-

;; ---------------
;; Flyspell

;; Enable flyspell in text mode.
(defun enable-flyspell-mode ()
  "Enable Flyspell mode."
  (flyspell-mode t))

;; Enable flyspell in programming mode.
(defun enable-flyspell-prog-mode ()
  "Enable Flyspell Programming mode."
  (flyspell-prog-mode))

;; Perfom all setup
(defun falkor/flyspell-setup ()
  (dolist (hook '(text-mode-hook html-mode-hook messsage-mode-hook))
    (add-hook hook 'enable-flyspell-mode))
  ;; disable flyspell in change log and log-edit mode that derives from text-mode
  (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
    (add-hook hook (lambda () (flyspell-mode nil))))
  (dolist (hook '(prog-mode-hook))
    (add-hook hook 'enable-flyspell-prog-mode)))

(use-package flyspell
  :bind ("<mouse-3>" . flyspell-correct-word)
  :init
  (progn
    (falkor/flyspell-setup)
    (setq ispell-program-name "aspell")

	;; LaTeX-sensitive spell checking
    (setq ispell-enable-tex-parser t)
    ;; default dictionnary
    (setq ispell-local-dictionary "en")
    ;; save the personal dictionary without confirmation
    (setq ispell-silently-savep t)
    
    
	;; Automatic dictionary switcher for flyspell
	(use-package auto-dictionary
	  :init (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1))))


    ;; enable the likeness criteria
    ;;(setq flyspell-sort-corrections nil)

    ;; dash character (`-') is considered as a word delimiter
    ;;(setq flyspell-consider-dash-as-word-delimiter-flag t)


    (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
    (define-key flyspell-mouse-map [mouse-3] #'undefined)
    ))


  ;; (eval-after-load "flyspell"
  ;;   '(progn
  ;;      (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
  ;;      (define-key flyspell-mouse-map [mouse-3] #'undefined)))
