;; Configure helm mode
;; see http://emacs-helm.github.io/helm/
;;(helm-mode 1)


(defun helm-do-grep-recursive (&optional non-recursive)
  "Like `helm-do-grep', but greps recursively by default."
  (interactive "P")
  (let* ((current-prefix-arg (not non-recursive))
         (helm-current-prefix-arg non-recursive))
    (call-interactively 'helm-do-grep)))

;; see also http://tuhdo.github.io/helm-intro.html
;; see also https://github.com/xiaohanyu/oh-my-emacs/blob/master/core/ome-completion.org
;;
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h".
(setq helm-command-prefix-key (kbd "C-c h"))

(use-package helm
  :init
  (progn
    (require 'helm-config)
	
    (setq helm-candidate-number-limit 100)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    (helm-mode t)
	)
  :bind (("M-y"     . helm-show-kill-ring)
         ("M-x"     . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
         ("C-x C-g" . helm-do-grep)
		 ("C-x b"   . helm-buffers-list)
         ;; see projectile.el for C-x C-p
         )
  :config
  (progn
	(setq helm-locate-command
		  (case system-type
			('gnu/linux     "locate -i -r %s")
			('berkeley-unix "locate -i %s")
			('windows-nt    "es %s")
			('darwin        "mdfind -name %s %s")
			(t "locate %s")))
	(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
	(define-key helm-map (kbd "C-z")   'helm-select-action)

	))

