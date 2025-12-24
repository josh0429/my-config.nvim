return{
-- JHEP article template
    s({trig='jhep', dscr='JHEP TeX template'},
        fmta(
            [[
                \documentclass[12pt]{article}
                \usepackage[utf8]{inputenc}
                \usepackage{geometry, bbold, mathrsfs, tikz, amssymb, amsmath, slashed, caption, subcaption, graphicx, dsfont, braket}
                \usetikzlibrary{decorations.pathmorphing}
                \usepackage[colorlinks=true, linkcolor=blue, linktocpage=true]{hyperref}
                \geometry{textwidth=6.5in ,textheight=8.5in}
                \numberwithin{equation}{section}
                \renewcommand{\baselinestretch}{1.2}

                % Macros
                % Macro for differential d
                \newcommand{\diff}{\ensuremath{\operatorname{d}\!}}

                %When working with multiple files
                \usepackage{subfiles}

                \begin{document}

                \include{titlepage}
                \title{<>}

                \tableofcontents

                \section{Sample section}

                % Uncomment for references. Needs "references.bib" file in directory
                % \bibliographystyle{ieeetr}
                % \bibliography{references.bib}

                \end{document}
            ]],
            { i(1, 'Sample title') }
        )
    ),

-- TODO: Book template

-- Minimal article template
    s({trig='note', dscr='Minimal working article'},
        fmta(
            [[
                \documentclass{article}
                % General document formatting
                \usepackage[margin=0.7in]{geometry}
                \usepackage[parfill]{parskip}
                \usepackage[utf8]{inputenc}
                \usepackage{geometry, bbold, mathrsfs, tikz, amssymb, amsmath, slashed, caption, subcaption, graphicx, dsfont, braket}

                \numberwithin{equation}{section}

                % Macros
                % Macro for differential d
                \newcommand{\diff}{\ensuremath{\operatorname{d}\!}}

                \begin{document}
                \title{<> \\\large <>}
                \author{Joshua Bautista}

                \maketitle

                \section{Part a}

                \end{document}
            ]],
            {i(1, 'Sample title'), i(2, 'filename')}
        )
    ),
}
