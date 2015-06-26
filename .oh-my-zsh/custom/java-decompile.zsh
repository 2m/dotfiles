function javaDecompile() {

  for f in $(find . -name '*.class'); do
    filename=`echo $f | cut -d'.' -f2`
    javap -v -l -c $f > ./$filename.javap
  done

}
