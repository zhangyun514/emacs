 (when (>= emacs-major-version 24)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
(require 'cl)


 ;; Add Packages
 (defvar my/packages '(
		company
		monokai-theme
		hungry-delete
		swiper
		counsel
		smartparens
		js2-mode
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;;加载主题
(load-theme 'monokai t)

;;显示行号
(global-linum-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;便捷删除空格
(require 'hungry-delete)
(global-hungry-delete-mode)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;括号自动补齐
(require 'smartparens-config)
(smartparens-global-mode t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(provide 'init-package)
