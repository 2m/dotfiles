function fdroidUpdate() {

  fdroid build $1
  fdroid publish
  fdroid update --create-metadata

  echo "Serving updated repo..."
  webfsd  -f index.html -F -p 8989 -r repo

}
