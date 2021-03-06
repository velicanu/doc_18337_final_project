# function writedoc(func_name , definition , example, url, source)
function docwrite(func_name , definition="", input="", output="", url="", info = "", see_also="", examples...)
  filename = "mydocs/"*string(func_name)*"_doc.jl"
  outdoc = open(filename,"w")
  out = "# Auto-generated by: docwrite("*string(func_name)*",\""*definition*"\",\""*input*"\",\""*output*"\",\""*url*"\",\""*info*"\",\""*see_also
  for i in examples
    out = out*"\",\""*string(i)
  end
  out = out*"\")\n"
  write(outdoc,out)
  write(outdoc,"println(\"\")\n println(\""*definition*"\")\n println(\"\")\n")
  write(outdoc,"print_with_color(:white,\"Input : \")\n println(\""*input*"\")\n")
  write(outdoc,"print_with_color(:white,\"Output: \")\n println(\""*output*"\")\n println(\"\")\n")
  write(outdoc,"print(\"Julia specific help is located here online: \")\n")
  write(outdoc,"print_with_color(:magenta,\""*url*"\n\")\n")
  write(outdoc,"print(\"A good source of information about this is: \")\n")
  write(outdoc,"print_with_color(:magenta,\""*info*"\n\")\n")
  write(outdoc,"println(\"\")\n print_with_color(:white,\"See Also: \")\n")
  write(outdoc,"print_with_color(:black,\""*see_also*"\n\")\n")
  write(outdoc,"println(\"\")\n print_with_color(:white,\"Source Code: \")\n")
  write(outdoc,"println(\"to see where the source code is located call the function methods("*string(func_name)*") \")\n")
  write(outdoc,"println(\"\")\n print_with_color(:white,\"Examples:\n\n\")\n")
  for i in examples
    out = "print_with_color(:green,\"julia> \") ; println(\""*i*"\")\n"
    write(outdoc,out)
    write(outdoc,i*"\n")
  end
  write(outdoc,"\n")
  close(outdoc)
end

function docaddex(func_name , examples...)
  filename = "mydocs/"*string(func_name)*"_doc.jl"
  outdoc = open(filename,"a")
  out = "# Appended examples generated by: docaddex("*string(func_name)
  for i in examples
    out = out*",\""*string(i)*"\""
  end
  out = out*")\n\n"
  write(outdoc,out)
  for i in examples
    out = "print_with_color(:green,\"julia> \") ; println(\""*i*"\")\n"
    write(outdoc,out)
    write(outdoc,i*"\n")
  end
  close(outdoc)
end

function doc(func_name)
  filename = "mydocs/"*string(func_name)*"_doc.jl"
  help(func_name)
  # methods(func_name)
  if(isfile(filename))  
    indoc = open(filename,"r")
    all = readall(indoc)
    println("")
    include(filename)
    println("")
    println("This doc can be found at: "*filename)
    close(indoc)
  else
    println("")
    print_with_color(:orange,"No custom documentation exists yet for "*string(func_name))
    println("")
  end
end

# print_with_color colors: magenta, black, yellow, green, blue, red, cyan, white