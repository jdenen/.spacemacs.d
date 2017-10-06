(load-file "~/.spacemacs.d/functions.el")

;; Ansible
(setq ansible::vault-password-file "~/.vault_pass")

;; Hooks
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'shell-mode-hook 'with-editor-export-editor)

;; Elfeed
(setq elfeed-search-filter "+unread")
(setq elfeed-feeds '(("http://endlessparentheses.com/atom.xml"  emacs)
                     ("http://planet.emacsen.org/atom.xml"      emacs)))

;; Eshell
(setq eshell-alias-file "~/.spacemacs.d/.alias")

;; Org
(setq agenda-file                    "~/vc-docs/scratch.org"
      org-agenda-files               `(,agenda-file)
      org-agenda-start-with-log-mode t
      org-agenda-use-time-grid       t
      org-agenda-include-diary       t
      org-log-done                   'time
      diary-file                     "~/vc-docs/diary"
      org-todo-keywords              '((sequence "TODO(t)" "WIP(w)" "|" "DONE(d)")
                                       (sequence "BLOCK(b)" "|" "CANCEL(c)"))
      org-capture-templates          `(("n" "Note" entry (file+datetree ,agenda-file)
                                        (file "~/.spacemacs.d/templates/note.orgcaptmpl"))
                                       ("d" "Todo" entry (file+datetree ,agenda-file)
                                        (file "~/.spacemacs.d/templates/todo.orgcaptmpl"))
                                       ("t" "Task" entry (file+datetree ,agenda-file)
                                        (file "~/.spacemacs.d/templates/task.orgcaptmpl"))
                                       ("a" "Appt" entry (file+datetree ,agenda-file)
                                        (file "~/.spacemacs.d/templates/appt.orgcaptmpl"))))

;; Magit
(setq magit-diff-refine-hunk t)

;; Markdown
(setq markdown-command "pandoc")

;; Mastodon
(use-package mastodon
  :load-path "~/Code/me/mastodon.el/lisp")

;; Registers
(set-register ?s '(file . "~/vc-docs/scratch.org"))

;; Keybindings
(spacemacs/set-leader-keys
  "or"  'jump-to-register
  "aoa" 'org-agenda-and-todos
  "amm" 'mastodon
  "amt" 'mastodon-toot
  "."   'mc/mark-next-like-this
  ","   'mc/unmark-next-like-this
  "ok"  'tramp-cleanup-all-buffers)
