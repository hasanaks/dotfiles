(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load-theme 'gruvbox t)
(set-frame-font "Fira Mono 16")

(setq-default
 ring-bell-function 'ignore
 
 inhibit-startup-screen t ; no startup screen
 tab-width 2

 ; backup settings
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist '(("." . "~/.emacs-saves/"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(global-set-key "\M-p" 'hippie-expand)

(defun open-user-init-file()
	(interactive)
	(find-file user-init-file))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "70cfdd2e7beaf492d84dfd5f1955ca358afb0a279df6bd03240c2ce74a578e9e" default))
 '(ispell-dictionary nil)
 '(package-selected-packages '(go-mode gruvbox-theme cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
