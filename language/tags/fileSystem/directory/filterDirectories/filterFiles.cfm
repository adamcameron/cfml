<cfdirectory action="list" directory="#expandPath('./listMe/')#" name="files" type="file" filter="match*.*" recurse="true">
<cfdirectory action="list" directory="#expandPath('./listMe/')#" name="directories" type="dir" filter="match*" recurse="true">
<cfdump var="#variables#" version="long">