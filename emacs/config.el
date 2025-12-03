;;; Package --- config
;;; Commentary:
;;; Code:

;; Remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Comments and Keywords
(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

;; Display line numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; Font
(set-face-attribute 'default nil
		    :font "JetBrainsMono Nerd Font"
		    :height 120
		    :weight 'medium)


(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq-default c-basic-offset 4)
(setq-default c-ts-mode-indent-offset 4)
(setq-default c-ts-mode-indent-style 'bsd)
(setq-default indent-tabs-mode nil)


(electric-pair-mode 1)
(electric-indent-mode 1)

;; ORG config
(add-hook 'org-mode-hook 'org-indent-mode)

;; indent styles
(setq c-default-style
      '((c++-mode . "java") (c-mode . "java") (java-mode . "java") (other . "gnu")))


;; Treesitter
(add-hook 'emacs-startup-hook
          (lambda ()
            (add-to-list 'auto-mode-alist '("\\.py\\'" . python-ts-mode))
            (add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))
            (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
            (add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-ts-mode))
            (add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-ts-mode))
            (add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-ts-mode))
            (add-to-list 'auto-mode-alist '("\\.hh\\'" . c++-ts-mode))))


(setq treesit-font-lock-level 4)


;; Opacity
(set-frame-parameter (selected-frame) 'alpha-background 50)
(add-to-list 'default-frame-alist '(alpha-background . 50))


(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))


(provide 'config)

;;; config.el ends here
