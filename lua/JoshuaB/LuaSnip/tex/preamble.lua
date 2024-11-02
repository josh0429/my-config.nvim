return{
    s({trig='subfile', dscr='Snippet for subfile preamble'},
        fmta(
            [[
                \documentclass[<>]{subfiles}
                \graphicspath{{\subfix{<>}}}
            ]],
            { i(1, '../main.tex'), i(2, '../images/') }
        )
    )
}
