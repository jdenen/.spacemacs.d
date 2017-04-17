(load-file "~/.spacemacs.d/functions.el")

;; Hooks
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'shell-mode-hook 'with-editor-export-editor)

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

;; Mastodon
(use-package mastodon
  :load-path "~/Code/me/mastodon.el/lisp")

;; Keybindings
(spacemacs/set-leader-keys
  "or"  'jump-to-register
  "aoa" 'org-agenda-and-todos
  "amm" 'mastodon
  "amt" 'mastodon-toot
  "."   'mc/mark-next-like-this
  ","   'mc/unmark-next-like-this
  "ok"  'tramp-cleanup-all-buffers)
