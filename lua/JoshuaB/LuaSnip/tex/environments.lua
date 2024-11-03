return{
    -- General environment
    s({trig='env', dscr='General environment'},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { i(1), i(2), rep(1)}
        )
    ),

    -- Equation environments
    s({trig='beq', dscr='A LaTeX equation environment'},
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            { i(1) }
        )
    ),
    s({trig='bseq', dscr='A LaTeX equation environment (unnumbered)'},
        fmta(
            [[
                \begin{equation*}
                    <>
                \end{equation*}
            ]],
            { i(1) }
        )
    ), 
    s({trig='bal', dscr='A LaTeX align environment'},
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
            ]],
            { i(1) }
        )
    ), 
    s({trig='bsal', dscr='A LaTeX align environment (unnumbered)'},
        fmta(
            [[
                \begin{align*}
                    <>
                \end{align*}
            ]],
            { i(1) }
        )
    ), 
    s({trig='bspl', dscr='A LaTeX split environment'},
        fmta(
            [[
                \begin{split}
                    <> &= <> \\
                \end{split}
            ]],
            { i(1, 'a'), i(2, 'b') }
        )
    ),

    -- Figures
    s({trig='bfig', dscr='A LaTeX figure environment'},
        fmta(
            [[
                \begin{figure}[<>]
                    \centering
                    \includegraphics[width=<><>]{<>}
                    \caption{<>}
                    \label{fig:<>}
                \end{figure}
            ]],
            { i(1, 'h'), i(2, '0.5'), i(3, '\\linewidth'), i(4), i(5), i(6) }
        )
    ),

    -- Tables
    -- I'd rather use an online table maker
    
    -- Hyperrefs
    s({trig='hr', dscr="The hyperref package's href{}{} command (for url links)"},
        fmta(
            '\\href{<>}{<>}',
            { i(1, 'url'), i(2, 'display name') }
        )
    ),

    -- Enumeration
    s({trig='ben', dscr='LaTeX enumerate environment'},
        fmta(
            [[
                \begin{enumerate}
                    \item <>
                \end{enumerate}
            ]],
        { i(1, 'item') }
        )
    ),
    s({trig='bit', dscr='LaTeX itemize environment'},
        fmta(
            [[
                \begin{itemize}
                    \item <>
                \end{itemize}
            ]],
        { i(1, 'item') }
        )
    ),
    
    -- Referencing
    s({trig='ref', dscr='LaTeX refereces'},
        fmta(
            '\\ref{<>}',
            { i(1) }
        )
    ),
    s({trig='eqr', dscr='LaTeX equation referenceing'},
            fmta(
                '\\eqref{<>}',
                { i(1) }
            )
    ),
    s({trig='lab', dscr='Labels'},
            fmta(
                '\\label{<>}',
                { i(1) }
            )
    ),

    -- Citing references
    s({trig='cite', dscr='Cite references'},
        fmta(
            '\\cite{<>}',
            { i(1, 'ref') }
        )
    ),

    -- Chapters, Sections, etc.
    s({trig='ch', dscr='LaTeX chapter'},
        fmta('\\chapter{<>}',
            { i(1, 'Chapter title') }
        )
    ),
    s({trig='sec', dscr='LaTeX section'},
        fmta('\\section{<>}',
            { i(1, 'Section title') }
        )
    ),
    s({trig='ss', dscr='LaTeX subsection'},
        fmta('\\subsection{<>}',
            { i(1, 'Subsection title') }
        )
    ),
    s({trig='sss', dscr='LaTeX subsubsection'},
        fmta('\\subsubsection{<>}',
            { i(1, 'Subsubsection title') }
        )
    ),
}
