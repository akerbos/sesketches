All files in this repository have been created for the purpose of illustrating
posts on Stack Exchange. They are canonically named `$site_$q.$type` where

 * `$site` is the subdomain part of the corresponding Stack Exchange

 * `$q` is the question id (as seen in the URLs). If multiple files of the same type
     were used for the same question, an underscore followed by ordinals is
     appended.

 * `$type` is one of

   * dot     -- a graph description that can be converted into images using the free
                [graphviz](http://graphviz.org/) suite, e.g. `dot -Tpng -ocs_411.png cs_411.dot`. Note
                that graph layout can differ wildly depending on the algorithm used.

   * gnuplot -- a plotting script that can be converted into images using the
              free tool [gnuplot](http://gnuplot.info/), e.g. `gnuplot cs_654.gnuplot`.

   * tex     -- LaTeX documents; translate with `pdflatex` (or any other LaTeX
              compiler). You may need some packages; generally, the latest [Tex Live](https://www.tug.org/texlive/)
              should work.If you want to translate the resulting PDF into an
              image, consider Imagemagick's `convert`.

   * tikz    -- an image built with LaTeX package TikZ. Can be converted into images
              using scripts [`tikz2png` and `tikz2svg`](https://github.com/akerbos/scripts)
              by the same author.
              You need a working LaTeX installation, preferably the latest [Tex Live](https://www.tug.org/texlive/).
              
Have fun!

--------------------------------------------------

All files are subject to an MIT License
