(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

(global-display-line-numbers-mode)
(menu-bar--display-line-numbers-mode-relative)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Fira Mono 16" nil t)

(electric-pair-mode 1)
(setq-default tab-width 4)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
	(ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(setq package-selected-packages
	  '(company
		base16-theme
		lsp-mode
		org
		use-package
		yasnippet))

(setq-default indent-tabs-mode nil)

(use-package org
  :init
  (setq
   org-startup-indented t))

(use-package lsp-mode
  :hook
  ('c-mode . 'lsp)
  ('c++-mode . 'lsp)
  ('rust-mode . 'lsp)
  ('python-mode . 'lsp)
  ('go-mode . 'lsp)
  ('dart-mode . 'lsp)
  :init
  (setq
   lsp-keymap-prefix "C-ş"
   lsp-headerline-breadcrumb-icons-enable nil
   lsp-clients-clangd-args '("--header-insertion=never")
   lsp-enable-on-type-formatting 1))

(use-package yasnippet
  :config
  (yas-global-mode)
  (delete-selection-mode))

(use-package company
  :init
  (setq
   company-minimum-prefix-length 1
   company-idle-delay 0))

(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  :init
  (setq
   undo-tree-auto-save-history nil))

(use-package evil
  :hook
  ('evil-local-mode-hook . 'turn-on-undo-tree-mode)
  :config
  (evil-mode 1)
  :init
  (setq evil-want-C-u-scroll t
		evil-search-module 'evil-search
		evil-undo-system 'undo-tree))

(use-package base16-theme
  :init
  (load-theme 'base16-classic-dark))

(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup))
