;; -*- mode: lisp; -*-
;; Time-stamp: <Lun 2014-11-10 10:46 svarrette>
;; ----------------------------------------------------------------------
;; Compilation mode

(use-package smart-compile)

;; -------------
;; Management of the modeline background color to represent the compilation
;; process outputs  :
;;
;;   * blue:   compilation in progress
;;   * green:  compilation finished successfully
;;   * orange: compilation finished with warnnings
;;   * red:    compilation finished with errors
;;
(defvar modeline-timer)
(setq modeline-timer nil)

(defvar modeline-timeout)
(setq modeline-timeout "2 sec")

(defvar open-compilation-buffer-flag)

(defun modeline-set-color (color)
  "Colors the modeline"
  (interactive)
  (if (and (>= emacs-major-version 24) (>= emacs-minor-version 3))
      (set-face-background 'mode-line color)
    (set-face-background 'mode-line color)
    )
  )

(defun modeline-cancel-timer ()
  (let ((m modeline-timer))
    (when m
      (cancel-timer m)
      (setq modeline-timer nil))))

(defun modeline-delayed-clean ()
  (modeline-cancel-timer)
  (setq modeline-timer
        (run-at-time modeline-timeout nil 'modeline-set-color nil)))

(defun compilation-exit-hook (status code msg)
  ;; If M-x compile exists with a 0
                                        ;  (defvar current-frame)
  (if (and (eq status 'exit) (zerop code))
      (progn
        (if (string-match "warning:" (buffer-string))
            (modeline-set-color "orange")
          (modeline-set-color "YellowGreen")
          )
        (other-buffer (get-buffer "*compilation*"))
        (modeline-delayed-clean)
                                        ;      (delete-windows-on (get-buffer "*compilation*"))
        )
    (progn
      (modeline-set-color "OrangeRed")
      (if open-compilation-buffer-flag
          (open-compilation-buffer)
        (modeline-delayed-clean)
        )))

                                        ;  (setq current-frame (car (car (cdr (current-frame-configuration)))))
                                        ;  (select-frame-set-input-focus current-frame)
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))

(defadvice compile (around compile/save-window-excursion first () activate)
  (save-window-excursion ad-do-it))

(defadvice recompile (around compile/save-window-excursion first () activate)
  (save-window-excursion ad-do-it))

; FIXME: nobody calls this
(defun recompile-if-not-in-progress ()
  (let ((buffer (compilation-find-buffer)))
    (unless (get-buffer-process buffer)
      (recompile)))
  )

(defun interrupt-compilation ()
  (setq compilation-exit-message-function 'nil)
  (ignore-errors
    (progn (delete-process "*compilation*")
  	   (modeline-set-color "DeepSkyBlue")
  	   (message "previous compilation aborted!")
  	   (sit-for 1.5)
  	   ))

; (ignore-errors
;   (progn (process-kill-without-query
; 	    (get-buffer-process (get-buffer "*compilation*")))
; 	   (modeline-set-color "DeepSkyBlue")))

;  (condition-case nil
;      (process-kill-without-query
;       (get-buffer-process (get-buffer "*compilation*")))
;    (error (modeline-set-color "DeepSkyBlue")))
  )


(defun interrupt-and-recompile ()
  "Interrupt old compilation, if any, and recompile."
  (interactive)
  (interrupt-compilation)
  (recompile)
)

(setq compilation-last-buffer nil)
(defun compile-again ()
   "Run the same compile as the last time.
    If there was no last time, or there is a prefix argument, this acts like
      M-x compile."
   (interactive)

   (setq compilation-process-setup-function
	 (lambda() (progn (modeline-cancel-timer)
			  (setq compilation-exit-message-function 'compilation-exit-hook)
			  (modeline-set-color "LightBlue"))))

   (if compilation-last-buffer
       (progn
;	 (condition-case nil
;	     (set-buffer compilation-last-buffer)
;	   (error 'ask-new-compile-command))
	 (modeline-cancel-timer)
	 (interrupt-and-recompile)
	 )
     (call-interactively 'smart-compile)
     )
   )

(defun save-and-compile-again ()
  (interactive)
  (save-some-buffers 1)
  (setq open-compilation-buffer-flag t)
  (compile-again)
  )

(defun ask-new-compile-command ()
  (interactive)
  (setq compilation-last-buffer nil)
  (save-and-compile-again)
  )

(defun open-compilation-buffer()
  (interactive)
  (display-buffer "*compilation*")
  (modeline-delayed-clean)
  )


(global-set-key (kbd "C-x C-e")  'save-and-compile-again)
(global-set-key (kbd "<f6>")     'save-and-compile-again)


; Kill compilation buffer upon successful compilation
;; ;; Courtesy from http://stackoverflow.com/questions/11043004/emacs-compile-buffer-auto-close
;; (defun bury-compile-buffer-if-successful (buffer string)
;;   "Bury a compilation buffer if succeeded without warnings "
;;   (if (and
;;        (string-match "compilation" (buffer-name buffer))
;;        (string-match "finished" string)
;;        (not
;;         (with-current-buffer buffer
;;           (search-forward "warning" nil t))))
;;       (run-with-timer 1 nil
;;                       (lambda (buf)
;;                         (bury-buffer bufq)
;;                         (switch-to-prev-buffer (get-buffer-window buf) 'kill))
;;                       buffer)))

;; (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)


;; Below version does not work with ECB and lead to the error:
;; ECB 2.40 - Error: Can't use winner-mode functions in the ecb-frame
;;
;; (defun compile-autoclose (buffer string)
;;   (cond
;;    ((string-match "finished" string)
;;     (bury-buffer "*compilation*")
;;     (winner-undo)
;;     ;;(message "Build successful.")
;;     (message "%s" (propertize "Build successful." 'face '(:foreground "YellowGreen"))))
;;    (t
;;     (message "%s: %s" (propertize "Compilation exited abnormally" 'face '(:foreground "red")) string))))

;; (setq compilation-finish-functions 'compile-autoclose)

;; Colored bar attempt
;; see code from https://bitbucket.org/arco_group/emacs-pills
;; in `config/compile.cfg.el`
