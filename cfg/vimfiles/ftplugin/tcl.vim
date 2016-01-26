function! Foldproc()
    :normal 1g
    let s:anz=0
    let W = "W"
    while search("proc\\>",W) > 0
        let s:startpos = line(".") - 1
        let s:anz = s:anz + 1
        "auf das zweite wort gehen (Argumente)
      " go to 2nd word (args)
        :normal WW
        "testen, ob das erste Zeichen der Argumente eine ist
      " test if the first char is a brace
        let startofargument =strpart(getline(line(".")), col(".") - 1 , 10)
        if  match(startofargument,"{") == 0
            "eine Argumentenliste
            if searchpair("{","","}",W,'synIDattr(synID(line("."), col("."), 0), "name") =~? "string"') <= 0
                " keine schließende klammer gefunden
                " die nächste proc probieren
                continue
            endif
        else
            "ein einzelnes wort ; no ist a single word
        endif
        " wir stehen jetzt entweder am beginn eines wortes oder auf der
        " schließenden klammer
      " we are at the beginning of a single word argument
      " or at the closing brace of an argumentlist
        :normal W
        " Jetzt stehen wir auf der öffnenden Klammer
      " this is the opening brace of the proc
        let startofargument =strpart(getline(line(".")), col(".") - 1 , 10)
        if  match(startofargument,"{") == 0
            " if searchpair("{","","}",W,'synIDattr(synID(line("."), col("."), 0), "name") =~? "string"') <= 0
            if searchpair("{","","}",W,'') <= 0
                " das ende der Proc ist nicht gefunden
            " didn't find end of proc
                continue
            endif
        else
            continue
        endif
      "insert foldmarks
        call append(s:startpos , "\# <-<1")
        call append(line("."), "\# >->1")
    endwhile
 endfunction
