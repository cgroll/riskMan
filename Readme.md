Slides:

- [Introductory slides](http://cgroll.github.io/riskMan/output/intro.slides.html#/)
- [VaR and ES slides](http://cgroll.github.io/riskMan/output/var_es.slides.html#/)
- [Functions of random variables slides](http://cgroll.github.io/riskMan/output/func_rand_var.slides.html#/)


Remark:

LaTeX export requires relative picture paths relative to the main
project directory, so that a path `../pics` path would be outside the
repository. Still, this path would be perfectly legitimate for `html`
output, as paths are interpreted relative to the output file.

Hence, the solution is a relative path `pics/`, together with a folder
pics residing in the output directory. In addition, however, LaTeX
needs the pictures to be in the main directory. In order to not commit
the pictures twice, a simply set up a symbolic link to `output/pics`
in the main directory. This link in turn can not be commit to github,
as symbolic links to directories will resolve as the directory itself
being committed, which also would duplicate all pictures. Hence, the
solution is that I need to manually create this symbolic link on each
computer, hoping to never accidentally commit it to github.
