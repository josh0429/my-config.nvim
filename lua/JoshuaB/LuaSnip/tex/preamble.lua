return{
    s({trig='subfile', dscr='Snippet for subfile preamble'},
        fmta(
            [[
                \documentclass[<>]{subfiles}
                \graphicspath{{\subfix{<>}}}

                \begin{document}

                    <>

                \end{document}
            ]],
            { i(1, '../main.tex'), i(2, '../images/'), i(3) }
        )
    )
}
