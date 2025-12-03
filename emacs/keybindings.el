;;; Package --- keybindings
;;; Commentary:

;;; Code:

;; General
(use-package general
  :ensure t
  :config
  (general-evil-setup)

  ;; Define the leader key
  (general-create-definer leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; Set leader
    :global-prefix "M-SPC")

  ;; All leader keybindings
  (leader-keys
    ;; Buffers
    "b" '(:ignore t :wk "Buffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previuos buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b i" '(ibuffer :wk "Ibuffer")
    "," '(consult-buffer :wk "Switch buffer")

    ;; Eval
    "e" '(:ignore t :wk "Eval")
    "e b" '(eval-buffer :wk "Evaluate buffer")
    "e r" '(eval-region :wk "Evaluate region")

    ;; Files
    "." '(find-file :wk "Find file")
    "f c" '((lambda () (interactive) (find-file "~/.config/emacs")) :wk "Open emacs config")
    "TAB TAB" '(comment-line :wk "Comment lines")
    ;; Sudo-edit
    "f u" '(sudo-edit-find-file :wk "Sudo find file")
    "f U" '(sudo-edit :wk "Sudo edit file")

    ;; Git(Magit)
    "g" '(:ignore t :wk "Git")
    "g s" '(magit-status :wk "Magit status")
    "g c" '(magit-commit-create :wk "Magit commit")
    "g p" '(magit-pull :wk "Magit pull")
    "g P" '(magit-push :wk "Magit push")
    "g b" '(magit-branch-checkout :wk "Magit branch")
    "g l" '(magit-log-all :wk "Magit log")

    ;; Help & Emacs
    "h" '(:ignore t :wk "Help")
    "h f" '(describe-function :wk "Describe function")
    "h v" '(describe-variable :wk "Describe variable")
    "h i" '(info :wk "Info browser")
    "h r r" '(reload :wk "Reload emacs config")

    ;; Org-roam
    "r" '(:ignore t :wk "Org Roam")
    "r f" '(org-roam-node-find :which-key "org-roam find node")
    "r i" '(org-roam-node-insert :which-key "org-roam insert node")

    ;; Project search
    "s" '(:ignore t :wk "Search")
    "s p" '(consult-ripgrep :wk "Ripgrep in project")

    ;; Projectile
    "p" '(:ignore t :wk "Projectile")
    "p p" '(projectile-persp-switch-project :which-key "Switch Project (persp)")

    ;; Undo Tree
    "u" '(:ignore t :wk "Undo")
    "u u" '(undo-tree-visualize :wk "Undo tree visualize")
    
    ;; Windows
    "w" '(:ignore t :wk "Window")
    "w s" '(ace-swap-window :wk "Ace window")
    "w h" '(windmove-left :wk "Move to left window")
    "w j" '(windmove-down :wk "Move to down window")
    "w k" '(windmove-up :wk "Move to up window")
    "w l" '(windmove-right :wk "Move to right window")

    ;; Workspaces
    "TAB" '(:ignore t :wk "Workspace")
    "TAB ." '(persp-switch :which-key "Switch/Create workspace")
    "TAB n" '(persp-switch :which-key "New workspace (type name)")
    "TAB k" '(persp-kill :which-key "Kill workspace")
    "TAB >" '(persp-next :which-key "Next workspace")
    "TAB <" '(persp-prev :which-key "Previous workspace")

    "TAB 1" '((lambda () (interactive) (persp-switch-by-number 1)) :which-key "Goto workspace 1")
    "TAB 2" '((lambda () (interactive) (persp-switch-by-number 2)) :which-key "Goto workspace 2")
    "TAB 3" '((lambda () (interactive) (persp-switch-by-number 3)) :which-key "Goto workspace 3")
    "TAB 4" '((lambda () (interactive) (persp-switch-by-number 4)) :which-key "Goto workspace 4")
    "TAB 5" '((lambda () (interactive) (persp-switch-by-number 5)) :which-key "Goto workspace 5")

    ;; Treemacs
    "t" '(:ignore t :wk "Treemacs")
    "t t" '(treemacs :which-key "treemacs toggle")
    "t c" '(centaur-tabs-kill-current :which-key "close tab")
    "t f" '(treemacs-find-file :which-key "treemacs find file")
    "t w" '(treemacs-select-window :which-key "treemacs select window"))

  ;; Other package keybindings
  (general-define-key
   :keymaps 'vertico-map
   "C-j" 'vertico-next
   "C-k" 'vertico-previous)

  (general-define-key
   :keymaps 'window
   "C-h" 'evil-window-left
   "C-;" 'evil-window-right)

  ;; Org-roam C-c keys
  (general-define-key
   :states '(normal insert motion)
   :keymaps 'override
   :prefix "C-c"
   "n i" '(org-roam-node-insert :which-key "org-roam insert node")
   "n f" '(org-roam-node-find :which-key "org-roam find node")))


;; Reload function
(defun reload ()
  (interactive)
  (load-file "~/.config/emacs/init.el")
  (load-file "~/.config/emacs/init.el"))


;; Reload function
(defun reload ()
  (interactive)
  (load-file "~/.config/emacs/init.el")
  (load-file "~/.config/emacs/init.el"))


;; Define key bindings for Vertico using general
(general-define-key
 :keymaps 'vertico-map
 "C-j" 'vertico-next
 "C-k" 'vertico-previous)

(general-define-key
 :keymaps 'window
 "C-h" 'evil-window-left
 "C-;" 'evil-window-right)

(provide 'keybindings)

;;; keybindings.el ends here
