local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1, 'text'))
    end
end

return{
    -- Typewriter text
    s({trig='ttt', dscr="Typewriter"},
        fmta(
                '\\texttt{<>}',
                { d(1, get_visual) }
        )
    ),
    -- Bold face
    s({trig='tbf', dscr="Boldface"},
        fmta(
                '\\textbf{<>}',
                { d(1, get_visual) }
        )
    ),
    -- Italic
    s({trig='tit', dscr="Italic"},
        fmta(
                '\\textit{<>}',
                { d(1, get_visual) }
        )
    ),
    -- Emphasis
    s({trig='tem', dscr="Emphasis"},
        fmta(
                '\\emph{<>}',
                { d(1, get_visual) }
        )
    ),
    -- Underline
    s({trig='tun', dscr="Underline"},
        fmta(
                '\\underline{<>}',
                { d(1, get_visual) }
        )
    ),
}
