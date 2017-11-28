(load-file "~/.spacemacs.d/functions.el")

;; Ansible
(setq ansible::vault-password-file "~/.vault_pass")

;; Hooks
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'shell-mode-hook 'with-editor-export-editor)

;; EACL
(defhydra hydra-eacl ()
  "Use EACL for code completion."
  ("l" eacl-complete-line)
  ("n" eacl-complete-snipper)
  ("s" eacl-complete-statement)
  ("t" eacl-complete-tag))

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

;; Perspective
(persp-mode)
(defhydra hydra-persp ()
  "Use `persp-mode'."
  ("s" persp-switch)
  ("n" persp-next)
  ("N" persp-prev)
  ("x" persp-kill))

;; Registers
(set-register ?s '(file . "~/vc-docs/scratch.org"))

;; Keybindings
(spacemacs/set-leader-keys
  "or"  'jump-to-register
  "oc"  'hydra-eacl/body
  "os"  'hydra-persp/body
  "aoa" 'org-agenda-and-todos
  "amm" 'mastodon
  "amt" 'mastodon-toot
  "."   'mc/mark-next-like-this
  ","   'mc/unmark-next-like-this
  "ww"  'ace-window
  "ok"  'tramp-cleanup-all-buffers)
