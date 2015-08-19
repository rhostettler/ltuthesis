TODO
====
This is a list of todos (and possibly bugs) for the 'ltuthesis.cls' LaTeX class.

[ ] Adjust copyright statement for not accepted papers
[ ] Use parskip.sty instead of manually setting the parskip length
[ ] Make the example file a tutorial where the class is explained
[ ] I used a shell script to relabel the included papers so that no label
    conflicts occured. The proper solution of this would be to redefine the 
    \label{}, \ref{}, and \eqref{} commands in order to let this happen 
    automagically. I'm thinking about something along the lines to store the 
    original commands using \let and then redefining the commands where we 
    simply prepend something like the paper identifier (A, B, C, ...).
    => Some effort has been done already (check the cls file) but there is some 
    issue preventing the two to work together.
[ ] Properly integrate the Appendix-formatting
[ ] Include a title page for Web-publishing so that we can upload our own 
    version with bookmarks.
[ ] Include microtype for better flow.
[ ] The paper letter in the thumbmarks don't center properly, needs 
    investigation.
[ ] Add an option to include the paper title in the ToC.
[ ] Add templates for theorems, propostions, etc.

