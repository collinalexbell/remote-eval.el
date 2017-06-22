* Emacs Remote Eval
Evaluate Emacs code using an http request

** Usage
```
git clone https://github.com/SlightlyCyborg/remote-eval.el.git ~/.emacs.d/remote-eval
```

Add this to your emacs init file
```
;;REMOTE EVAL
(load "~/.emacs.d/remote-eval/remote-eval.el")
(remote-eval-start 3333)
```



