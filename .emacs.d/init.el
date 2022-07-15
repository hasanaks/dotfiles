(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq package-selected-packages
      '(company
	kaolin-themes
	lsp-mode
	org
	org-bullets
	use-package
	yasnippet))

(setq inhibit-startup-screen t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)

(set-frame-font "Fira Mono 16" nil t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(electric-pair-mode 1)

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package csharp-mode
  :mode "\\.csx\\'")

(use-package lsp-mode
  :hook
  ('c-mode . 'lsp)
  ('c++-mode . 'lsp)
  :init
  (setq
   lsp-keymap-prefix "C-ş"
   lsp-headerline-breadcrumb-icons-enable nil))

(use-package yasnippet
  :config
  (yas-global-mode)
  (delete-selection-mode))

(use-package company
  :init
  (setq
   company-minimum-prefix-length 1
   company-idle-delay 0))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)
