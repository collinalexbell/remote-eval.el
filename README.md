# Emacs Remote Eval
Insecure evaluation of Emacs code using an http request.

This is my first emacs lisp program.

Instead of injecting code over http like this repo does, the proper solution would be to just write an HTTP interface on top of the emacs code I would have other wise injected. 

¯\_(ツ)_/¯

## Usage
```
git clone https://github.com/SlightlyCyborg/remote-eval.el.git ~/.emacs.d/remote-eval
```

Add this to your emacs init file
```
;;REMOTE EVAL
(load "~/.emacs.d/remote-eval/remote-eval.el")
(remote-eval-start 3333)
```

Then go to this url

```
localhost:3333/?code=(print %22Hello World%22)
```

Remind me to add password protection and SSL before going to defcon!!



