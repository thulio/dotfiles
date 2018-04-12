(add-hook 'elixir-format-hook '(lambda ()
                                 (if (projectile-project-p)
                                   (setq elixir-format-arguments (list "--dot-formatter" (concat (projectile-project-root) "/.formatter.exs")))
                                   (setq elixir-format-arguments nil))))

(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format-before-save)))

