;;禁止生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
;;最近使用文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
