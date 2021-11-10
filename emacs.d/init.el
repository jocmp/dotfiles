(load "~/.emacs.d/sanemacs.el" nil t)

(setq default-frame-alist '((font . "Cascadia Code-13")))

(setq-default tab-width 2)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))

(use-package helm
	:bind (("M-x" . helm-M-x)
				 ("C-x r b" . helm-filtered-bookmarks)
				 ("C-x C-f" . helm-find-files)))

(use-package helm-ag
	     :init
	     (custom-set-variables
	      '(helm-follow-mode-persistent t)))

(use-package helm-projectile
	     :bind ("M-p" . helm-projectile))

(use-package flycheck
	     :ensure t
	     :init
	     (global-flycheck-mode)
	     :config
	     (setq flycheck-indication-mode 'left-fringe))

(use-package markdown-mode
	:mode "\\.txt\\'"
	:hook ((markdown-mode . flyspell-mode)))

(use-package robe
	     :init
	     (add-hook 'ruby-mode-hook 'robe-mode))

;; (use-package rubocopfmt
;;	:hook
;; 	(ruby-mode . rubocopfmt-mode))

(use-package dired-sidebar ;; https://github.com/jojojames/dired-sidebar
  :ensure t
  :bind (("C-c b" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar))

(use-package one-themes ;; https://github.com/balajisivaraman/emacs-one-themes
  :init
  (load-theme 'one-light t))

(require 'whitespace)
(setq whitespace-line-column 140) ;; limit line length
(setq whitespace-style '(face lines-tail))

(projectile-mode +1)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-whitespace-mode +1)

(setq column-number-mode t)

(setq vc-follow-symlinks t)
