;; Configure helm mode
;; see http://emacs-helm.github.io/helm/
;;(helm-mode 1)


(defun helm-do-grep-recursive (&optional non-recursive)
  "Like `helm-do-grep', but greps recursively by default."
  (interactive "P")
  (let* ((current-prefix-arg (not non-recursive))
         (helm-current-prefix-arg non-recursive))
    (call-interactively 'helm-do-grep)))

(use-package helm
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100))
  :bind (("C-c h"   . helm-mini)
         ("M-x"     . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
         ("C-x C-g" . helm-do-grep)
         ;; see projectile.el for C-x C-p
         )
  :config
  (progn
    (use-package helm-gtags
      :init
      (progn
        (setq
         helm-gtags-ignore-case         t
         helm-gtags-auto-update         t
         helm-gtags-use-input-at-cursor t
         helm-gtags-pulse-at-cursor     t

         helm-gtags-suggested-key-mapping t))
      :config
      (progn
        ;; Enable helm-gtags-mode in Dired so you can jump to any tag
        ;; when navigate project tree with Dired
        (add-hook 'dired-mode-hook 'helm-gtags-mode)
		;; Enable helm-gtags-mode in Eshell for the same reason as above
		(add-hook 'eshell-mode-hook 'helm-gtags-mode)

		;; Enable helm-gtags-mode in languages that GNU Global supports
		(add-hook 'c-mode-hook    'helm-gtags-mode)
		(add-hook 'c++-mode-hook  'helm-gtags-mode)
		(add-hook 'java-mode-hook 'helm-gtags-mode)
		(add-hook 'asm-mode-hook  'helm-gtags-mode)))))
