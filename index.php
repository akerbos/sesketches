<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<?php
  $seids = array(
            "academia" => "3213",
             "cs" => "98",
             "so" => "539599",
             "math" => "3330",
             "cstheory" => "1546",
             "tex" => "3213",
             "meta.cs" => "98"
           );

  $perrow = 5;
  
  $imgfmts = array( ".svg", ".png", ".jpg", ".jpeg" );
?>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Sketches for Stack Exchange</title>
    <meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />

    <link rel="stylesheet" href="style.css" type="text/css" />
  </head>

  <body><div id="main">
    <h1>Sketches for Stack Exchange</h1>
    <div id="gallery"><table>
      <?php
        $files = glob('src/*.{tikz,tex,gnuplot,dot}', GLOB_BRACE);
        //sort($files, SORT_STRING);
        $count = 0;
        foreach($files as $file) {
          preg_match ('/(([\w\.]+?)_(\d+).*?)\.[^\.]+/', $file, $match);
          if ( $count == 0 ) echo "<tr>";

          // Build post URL; have to handle some sites separately
          if ( $match[2] == "so" ) {
            $domain = "stackoverflow.com";
          }
          else {
            $domain = $match[2].".stackexchange.com";
          }
          
          $imgfmt = $imgfmts[0];
          for ( $i = 1; !file_exists("thumb/".$match[1].$imgfmt) && $i < sizeof($imgfmts); $i++ ) {
            $imgfmt = $imgfmts[$i];
          }
      ?>

      <td><div class="entry">
        <div class="thumbbox">
          <span>
            <img src="thumb/<?php echo $match[1].$imgfmt; ?>" class="thumb" alt="<?php echo $match[1]; ?>"/>
          </span>
        </div>
        <p>
          <a href="https://github.com/akerbos/sesketches/blob/gh-pages/src/<?php echo $match[0]; ?>">Source</a>&nbsp;&nbsp;&nbsp;
          <a href="http://<?php echo $domain; ?>/q/<?php echo $match[3]; ?>/<?php echo $seids[$match[2]]; ?>">
            Post
          </a>
        </p>
      </div></td>
      
      <?php
          if ( $count == $perrow - 1 ) echo "</tr>";
          $count = ($count + 1) % $perrow;
        }
        if ( $count > 0 ) echo "</tr>";
      ?>
    </table></div>

    <h2>What is this?</h2>
    <div id="readme">
      All files exhibited above have been created for the purpose of illustrating
      posts on Stack Exchange. They are canonically named <tt>$site_$q.$type</tt> where
      <ul>
        <li><tt>$site</tt> is the subdomain part of the corresponding Stack Exchange,</li>

        <li>
          <tt>$q</tt> is the question id (as seen in the URLs). If multiple files of the same type
          were used for the same question, an underscore followed by ordinals is
          appended.
        </li>

        <li>
          <tt>$type</tt> is one of
          <ul>
            <li>
              <tt>dot</tt> &mdash; a graph description that can be converted into images using the free
              <a href="http://graphviz.org/">Graphviz</a> suite, e.g. <tt>dot -Tpng -ocs_411.png cs_411.dot</tt>.
              Note that graph layout can differ wildly depending on the algorithm used.
            </li>

            <li>
              <tt>gnuplot</tt> &mdash; a plotting script that can be converted into images using the
              free tool <a href="http://gnuplot.info/">gnuplot</a>, e.g. <tt>gnuplot cs_654.gnuplot</tt>.
            </li>

            <li>
              <tt>tex</tt> &mdash; LaTeX documents; translate with <tt>pdflatex</tt> (or any other LaTeX
              compiler). You may need some packages; generally, the latest <a href="https://www.tug.org/texlive/">Tex Live</a>
              should work. If you want to translate the resulting PDF into an image, consider Imagemagick's <tt>convert</tt>.
            </li>

            <li>
              <tt>tikz</tt> &mdash; an image built with LaTeX package TikZ. Can be converted into images
              using scripts <a href="https://github.com/akerbos/scripts/blob/master/tikz2png">tikz2png</a> and
              <a href="https://github.com/akerbos/scripts/blob/master/tikz2svg">tikz2svg</a> by the same author.
              You need a working LaTeX installation, preferably the latest <a href="https://www.tug.org/texlive/">Tex Live</a>.
            </li>
          </ul>
        </li>
      </ul>
      Have fun!
    </div>

    <div id="license">
      <p>
        All files are subject to an <a href="http://opensource.org/licenses/MIT">MIT license</a>.
        <br/>
         &copy; Raphael Reitzig 2014
      </p>
    </div>
  </div></body>
</html>
