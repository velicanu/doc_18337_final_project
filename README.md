doc_18337_final_project
=======================

For my 18.337 Parallel Programming final project I designed and implemented an improved documentation system for the Julia programming language. To add this package to Julia just place the contents of this folder in a "mydocs" folder located in the root directory from where Julia is executed. For example on Windows this would be something like this:
```
julia-d6f7c7c781\bin\mydocs
```

Then inside Julia just load the docmacros.jl from that folder:

```Julia
include("mydocs/docmacros.jl")
```

Then just use like help (or instead of help) like so:
```Julia
doc(abs)
doc(doc)
doc(docwrite)
doc(plot)
```

If people find this useful I'd be glad to expand the set of functions documented in this way. The current library is just a proof-of-conocept of what can be done. 

For more details look in DragosVelicanu_ProjectProposal_Fall2013_18337.pdf 
