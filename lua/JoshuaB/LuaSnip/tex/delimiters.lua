local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1, 'text'))
    end
end

return{
    -- \left \right environments
    s({trig="((", snippetType='autosnippet'},
        fmta(
            [[\left( <> \right)]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='[[', snippetType='autosnippet'},
        fmta(
            "\\left[ <> \\right]",
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='{{', snippetType='autosnippet'},
        fmta(
            "\\left \\{ <> \\right \\}",
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='<<', snippetType='autosnippet'},
        fmta(
            "\\left \\langle <> \\right \\rangle",
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    -- bigg variants
    s({trig="b(", snippetType='autosnippet'},
        fmta(
            [[\bigg( <> \bigg)]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='b[', snippetType='autosnippet'},
        fmta(
            "\\bigg[ <> \\bigg]",
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='b{', snippetType='autosnippet'},
        fmta(
            "\\bigg \\{ <> \\bigg \\}",
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='b<', snippetType='autosnippet'},
        fmta(
            "\\bigg \\langle <> \\bigg \\rangle",
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    -- Vertical line "Evaluated at" symbol
    s({trig='__', snippetType='autosnippet'},
        fmta(
            [[\left. <> \right\vert_{<>}]],
            { d(1, get_visual), i(2) }
        ),
        { condition = in_mathzone }
    ),
}
