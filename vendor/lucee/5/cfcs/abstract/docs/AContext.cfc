// AContext.cfc
abstract component {
   abstract function getFile(); 

   final function getDirectory() {
      return getDirectoryFromPath(getFile());
   }
}