;;; Package --- Packages
;;; Commentary:

;;; Code:

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			             ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))


(package-initialize)


(require 'use-package)
(setq use-package-always-ensure t)


;;evil mode(vim emulation)
(use-package evil :ensure t :demand t
    :init     ;; tweak evil's configuration before loading
    (setq evil-want-integration t
	  evil-want-keybinding nil
	  evil-vsplit-window-right t
	  evil-split-window-below t)
    :config
    (evil-mode 1))


(use-package evil-collection :ensure t
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer magit))
    (evil-collection-init))


(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-separator ?\s)
  (corfu-preselect 'prompt)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  :bind (:map corfu-map
	      ("<tab>" . corfu-next)
	      ("TAB" . corfu-next)
	      ("S-TAB" . corfu-previous)))


(use-package kind-icon
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))


(use-package yasnippet-capf
  :ensure t
  :after yasnippet
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))


(use-package cape
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-file))


;; LSP
(use-package lsp-mode
  :ensure t
  :hook ((c++-mode c-mode java-mode python-mode rust-mode) . lsp-deferred)
  :hook ((python-ts-mode c-ts-mode c++-ts-mode rust-ts-mode) . lsp-deferred)
  :commands (lsp lsp-deferred)
  :custom
  (lsp-prefer-capf t)
  (lsp-keep-workspace-alive nil)
  (read-process-output-max (* 1024 1024))
  (lsp-idle-delay 0.500)) ;; 1mb


(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (lsp-ui-mode 1))


(use-package python-black
 :ensure t
 :hook (python-mode . python-black-on-save-mode-enable-dwim)
 :hook (python-ts-mode . python-black-on-save-mode-enable-dwim))


(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))

;; Tabs
(use-package centaur-tabs
  :ensure t
  :demand t
  :bind (:map evil-normal-state-map
         ("g t" . centaur-tabs-forward)
         ("g T" . centaur-tabs-backward))
  :config
  (centaur-tabs-mode 1)
  (setq centaur-tabs-style "bar"
        centaur-tabs-set-icons t
        centaur-tabs-icon-type 'all-the-icons
        centaur-tabs-cycle-scope 'tabs
        centaur-tabs-height 32
        centaur-tabs-set-modified-marker t))

;; Treesitter
(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))


;; Which-key
(use-package which-key :ensure t
  :config
  (which-key-mode 1)
  (setq  which-key-add-column-padding 1
	 which-key-min-display-lines 6
	 which-key-idle-delay 0.8
	 which-key-separator " → " ))


;; Theme
(use-package ef-themes
  :ensure t
  :init
  (ef-themes-take-over-modus-themes-mode 1)
  :bind
  (("<f5>" . modus-themes-rotate)
   ("C-<f5>" . modus-themes-select)
   ("M-<f5>" . modus-themes-load-random))
  :config
  ;; All customisations here.
  (setq modus-themes-mixed-fonts t)
  (setq modus-themes-italic-constructs t)

  (modus-themes-load-theme 'ef-duo-dark))


;; Vertico
(use-package vertico
  :ensure t
  :custom
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  :init
  (vertico-mode 1))


(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))


(use-package savehist
  :init
  (savehist-mode))


;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;;Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :ensure t
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))


(use-package consult :ensure t)


(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))


;; substring search for vertico
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
  (setq orderless-matching-styles '(orderless-flex orderless-initialism)))


;; Ace-window
(use-package ace-window :ensure t)


;; Sudo-edit
(use-package sudo-edit
  :defer t
  :ensure t)


;; Snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)


;; Flycheck
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(use-package flycheck-inline
  :ensure t
  :hook (flycheck-mode . flycheck-inline-mode))


;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (setq doom-modeline-major-mode-color-icon t
	doom-modeline-buffer-state-icon t))
  

;; All the icons
(use-package all-the-icons :ensure t)

;; Org
(use-package org-modern
  :ensure t
  :after org)

(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)


(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


(use-package org-fragtog
  :ensure t
  :hook (org-mode . org-fragtog-mode))


(use-package org-roam
  :ensure t
  :after general
  :defer t
  :init
  (add-hook 'after-init-hook #'org-roam-db-autosync-mode)
  :custom
  (org-roam-directory "~/org-roam"))


(use-package org-roam-ui
    :ensure t
    :demand t
    :after org-roam)


;; Dashboard
(use-package dashboard
  :ensure t
  :demand t
  :hook (dashboard-mode . centaur-tabs-local-mode)
  :config
  (dashboard-setup-startup-hook)
  ;;(setq dashboard-startup-banner "~/.config/emacs/rayquaza.png")
  )


;; Startup analyzer
(use-package benchmark-init
  :ensure t)

;; Workspace(perspective)
(use-package perspective
  :ensure t
  :hook (after-init . persp-mode)
  :config
  (setq persp-suppress-no-prefix-key-warning t)
  (add-to-list 'consult-buffer-sources 'persp-consult-source))


(use-package persp-projectile
  :ensure t
  :after (perspective projectile))


;; Copilot
(use-package copilot
  :ensure t
  :hook (prog-mode . copilot-mode)
  :config
  (setq copilot-indent-offset-warning-disable t)
  (define-key copilot-mode-map (kbd "C-<return>") 'copilot-accept-completion))


;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  :config
  (treemacs-follow-mode t)
  (treemacs-git-mode 'simple))


(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)


;; Magit
(use-package magit
  :defer t
  :ensure t)


;; Undo tree
(use-package undo-tree
  :ensure t
  :hook (after-init . global-undo-tree-mode))

(provide 'package)
;;; package.el ends here
