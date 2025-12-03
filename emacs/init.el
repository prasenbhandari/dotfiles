;;;init


;; Set GC high for startup
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100MB
(setq read-process-output-max (* 1024 1024)) ;; 1MB


(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)


(load "~/.config/emacs/package.el")
(load "~/.config/emacs/config.el")
(load "~/.config/emacs/keybindings.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-box-icons-alist 'company-box-icons-all-the-icons)
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "3c8133fbaa807e696596977ff8eaea08dd3bb0595433738c3e644b9894f56960"
     "bab5aedce5b8d7dbbbff62ed32695716e9de9ae3c4c4e31273d31069c839ca5d"
     "348bb7f1c7f13a9c17c7b2c3a2ce58b4e7cbf002ab273cdcf15486ac052f569b"
     "d9140cc03cdfbb469a11cae37d845d651c35b058fcf1ca97e86fabea26f5610c"
     "8b0dd58983c8ab7a9e6f4ba4327865ddeb309b2bdfa31c410ce2b47d0a807d74"
     "af0f00876d0423d0d43c46accc2aaa561c11cf0932defd7e6368ce43bc3a3705"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     default))
 '(package-selected-packages
   '(all-the-icons company-box consult corfu dashboard doom-modeline
		   doom-themes esup evil-collection evil-org
		   flycheck-inline general lsp-java lsp-pyright magit
		   marginalia orderless org-bullets org-fragtog
		   org-roam-ui python-black sudo-edit vertico
		   yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Return GC to a normal value after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1024 1024)))) ;; 2MB

;;; init.el ends here
