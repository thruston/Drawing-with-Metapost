
<div align="right">
  <details>
    <summary >🌐 Language</summary>
    <div>
      <div align="center">
        <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=en">English</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=zh-CN">简体中文</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=zh-TW">繁體中文</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=ja">日本語</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=ko">한국어</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=hi">हिन्दी</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=th">ไทย</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=fr">Français</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=de">Deutsch</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=es">Español</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=it">Italiano</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=ru">Русский</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=pt">Português</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=nl">Nederlands</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=pl">Polski</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=ar">العربية</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=fa">فارسی</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=tr">Türkçe</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=vi">Tiếng Việt</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=id">Bahasa Indonesia</a>
        | <a href="https://openaitx.github.io/view.html?user=thruston&project=Drawing-with-Metapost&lang=as">অসমীয়া</
      </div>
    </div>
  </details>
</div>

# Drawing-with-Metapost

Toby Thurston -- 7 Apr 2026

This project provides a document that discusses how to draw technical diagrams
with John Hobby's Metapost language. It includes over 200 illustrations created
with Metapost, complete with source code as inspiration and examples.  The
intended level is for intermediate to advanced users rather than complete
beginners.  For introductions, tutorials, and other articles about Metapost, see
http://www.tug.org/metapost.html

Start with `Drawing-with-Metapost.pdf` in the top directory.

The `src` directory contains 
- the TeX source for the main document
- the style file used for marking up Metapost source code
- the Metapost source for each illustration used in the main document
- the corresponding PDF files created from each MP source file

The text includes a discussion of the techniques used for drawing the
illustrations, and includes complete or partial listings for most of them.
These listings are included directly from the source code used, so in all cases
the output should exactly match what you see on the page.

You might like to read the main document first, but you might also like to
browse through the PDFs in the `src` directory, and when you find one that is
interesting, have a look at the corresponding MP source file.  There is a
one-to-one match between the PDF names and the MP source names, so
`geometry-apollonius.pdf` is created from `geometry-apollonius.mp`.  The `src`
directory contains a few drawings that are not included in the main document.

If you find any errors, or have any suggestions for improvement, please raise an
issue or submit a pull request on Github.

Copyright (c) 2026 by Toby Thurston. This material may be distributed only
subject to the terms and conditions set forth in the Open Publication License,
v1.0 or later.  The latest version is presently available at
https://opencontent.org/openpub/

Distribution of substantively modified versions of this document is prohibited
without the explicit permission of the copyright holder.  Distribution of the
work or derivative of the work in any standard (paper) book form is prohibited
unless prior permission is obtained from the copyright holder.
